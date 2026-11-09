# =====================================================================
# Windows-to-Linux Migration Audit & Backup Script
# Created for: Windows -> Linux migration preparation
# External target: Drive F: (External hard drive)
#
# Features:
#   1. External drive F: detection and capacity verification
#   2. Installed applications inventory + Linux compatibility tagging
#   3. Full user-file scan categorized by type, size, and importance
#   4. Junk/bloat detection (caches, node_modules, old installers, temp)
#   5. MAIJ model training asset detection and structured staging
#   6. Safe copy of important documents and assets to F: with verification
#   7. HTML + CSV reports for easy review before migration
#
# Usage (run in PowerShell as Administrator):
#   Audit only (safe, no files copied):
#     .\migrate-to-linux.ps1 -ExternalDrive "F:" -Mode Audit
#
#   Audit + copy important files to external drive:
#     .\migrate-to-linux.ps1 -ExternalDrive "F:" -Mode Copy
#
#   Audit a specific user profile or extra folder:
#     .\migrate-to-linux.ps1 -ExternalDrive "F:" -Mode Copy -Source "C:\Users\Mari" -ExtraFolders "C:\blu-k2-port"
# =====================================================================

[CmdletBinding()]
param(
    [string]$ExternalDrive = "F:",
    [ValidateSet("Audit", "Copy")]
    [string]$Mode = "Audit",
    [string]$Source = $env:USERPROFILE,
    [string[]]$ExtraFolders = @("C:\blu-k2-port"),
    [int]$InstallerAgeDays = 60
)

$ErrorActionPreference = "Continue"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$reportDir = Join-Path $ExternalDrive ("MigrationBackup_" + $timestamp)
$baseFolder = if ($PSCommandPath) { Split-Path -Parent $PSCommandPath } else { $env:USERPROFILE }
$localReportDir = Join-Path $baseFolder ("MigrationAudit_" + $timestamp)

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "      Windows-to-Linux Migration Audit & Backup Tool        " -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Mode:              $Mode" -ForegroundColor Yellow
Write-Host "Source:            $Source" -ForegroundColor Yellow
Write-Host "External Drive:    $ExternalDrive" -ForegroundColor Yellow
Write-Host "Extra folders:     $($ExtraFolders -join ', ')" -ForegroundColor Yellow
Write-Host ""

# -------------------------------------------------------------
# STEP 1: Verify External Drive
# -------------------------------------------------------------
Write-Host "[1/6] Checking external drive $ExternalDrive ..." -ForegroundColor Green
$driveLetter = $ExternalDrive.TrimEnd(":").TrimEnd("\")
$drive = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Name -ieq $driveLetter }
if (-not $drive) {
    Write-Warning "External drive $ExternalDrive was NOT found. Attached drives:"
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{N='FreeGB';E={[math]::Round($_.Free/1GB,1)}}, @{N='UsedGB';E={[math]::Round($_.Used/1GB,1)}} | Format-Table -AutoSize
    if ($Mode -eq "Copy") {
        Write-Error "Cannot continue in Copy mode without the external drive. Connect drive $ExternalDrive and retry, or use -Mode Audit."
        exit 1
    }
    Write-Host "Reports will be saved locally to: $localReportDir" -ForegroundColor DarkGray
    $outDir = $localReportDir
} else {
    $freeGB = [math]::Round($drive.Free/1GB, 1)
    $usedGB = [math]::Round($drive.Used/1GB, 1)
    $totalGB = [math]::Round(($drive.Used + $drive.Free)/1GB, 1)
    Write-Host "  External drive found: ${totalGB} GB total, ${freeGB} GB free, ${usedGB} GB used" -ForegroundColor Green
    $vol = Get-Volume -DriveLetter $driveLetter 2>$null
    if ($vol) {
        Write-Host "  File system: $($vol.FileSystem)  |  Label: $($vol.FileSystemLabel)" -ForegroundColor DarkGray
        if ($vol.FileSystem -notin @("exFAT","FAT32","NTFS")) {
            Write-Warning "Drive file system is $($vol.FileSystem). exFAT or NTFS is recommended so Linux can read it."
        }
    }
    $outDir = $reportDir
}
New-Item -ItemType Directory -Path $outDir -Force | Out-Null
$reportsFolder = Join-Path $outDir "audit_reports"
New-Item -ItemType Directory -Path $reportsFolder -Force | Out-Null

# -------------------------------------------------------------
# STEP 2: Inventory Installed Applications & Linux Compatibility
# -------------------------------------------------------------
Write-Host "`n[2/6] Auditing installed Windows applications ..." -ForegroundColor Green

$apps = @()

# 64-bit and 32-bit registry uninstall keys
$regPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
)
foreach ($rp in $regPaths) {
    try {
        $items = Get-ItemProperty -Path $rp -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -and $_.SystemComponent -ne 1 -and $_.ParentKeyName -eq $null } |
            Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation
        $apps += $items
    } catch {}
}

# winget list if available
if (Get-Command winget -ErrorAction SilentlyContinue) {
    try {
        $wg = winget list --accept-source-agreements 2>$null | Out-String
        $wg | Out-File -Encoding utf8 (Join-Path $reportsFolder "winget_installed_packages.txt")
        Write-Host "  Exported winget package list" -ForegroundColor DarkGray
    } catch {}
}

# Start Menu shortcuts
$startApps = @()
$startPaths = @(
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
)
foreach ($sp in $startPaths) {
    if (Test-Path $sp) {
        $startApps += Get-ChildItem -Path $sp -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue |
            Select-Object @{N='AppName';E={$_.BaseName}}, FullName
    }
}
$startApps | Export-Csv -Path (Join-Path $reportsFolder "start_menu_shortcuts.csv") -NoTypeInformation -Encoding utf8

# Deduplicate apps by name
$uniqueApps = $apps | Group-Object DisplayName | ForEach-Object { $_.Group | Sort-Object DisplayVersion -Descending | Select-Object -First 1 }

# Linux compatibility knowledge base
$knownCompat = @{
    # Native Linux
    "Mozilla Firefox"        = @{ Status = "Native Linux"; Alt = "Available natively on all Linux distros" }
    "Google Chrome"          = @{ Status = "Native Linux"; Alt = "Chrome or Chromium native" }
    "Brave"                  = @{ Status = "Native Linux"; Alt = "Brave native flatpak/apt" }
    "Opera"                  = @{ Status = "Native Linux"; Alt = "Opera native" }
    "Microsoft Edge"         = @{ Status = "Native Linux"; Alt = "Edge native for Linux or Firefox" }
    "Visual Studio Code"     = @{ Status = "Native Linux"; Alt = "VS Code native (.deb/flatpak/snap)" }
    "Notepad++"              = @{ Status = "Wine / Alt";   Alt = "Kate, Geany, VS Code, or Notepad-Plus-Plus via snap" }
    "Sublime Text"           = @{ Status = "Native Linux"; Alt = "Sublime Text native" }
    "Git"                    = @{ Status = "Native Linux"; Alt = "Git is Linux-native (apt/dnf install git)" }
    "GitHub Desktop"         = @{ Status = "Alt";          Alt = "shiftkey's GitHub Desktop for Linux, GitKraken, or Git CLI" }
    "Python"                 = @{ Status = "Native Linux"; Alt = "Preinstalled on most Linux distros" }
    "Node.js"                = @{ Status = "Native Linux"; Alt = "Node.js native (nvm recommended)" }
    "MATLAB"                 = @{ Status = "Native Linux"; Alt = "MATLAB + Simulink officially validated on Ubuntu/Debian/RHEL" }
    "Blender"                = @{ Status = "Native Linux"; Alt = "Blender native (excellent Linux performance)" }
    "OBS Studio"             = @{ Status = "Native Linux"; Alt = "OBS Studio native flatpak" }
    "Audacity"               = @{ Status = "Native Linux"; Alt = "Audacity native" }
    "GIMP"                   = @{ Status = "Native Linux"; Alt = "GIMP native (Photoshop alternative)" }
    "Inkscape"               = @{ Status = "Native Linux"; Alt = "Inkscape native (Illustrator alternative)" }
    "Krita"                  = @{ Status = "Native Linux"; Alt = "Krita native (digital art)" }
    "VLC"                    = @{ Status = "Native Linux"; Alt = "VLC native (best media player on Linux)" }
    "Discord"                = @{ Status = "Native Linux"; Alt = "Discord native / flatpak / Vesktop / web" }
    "Telegram"               = @{ Status = "Native Linux"; Alt = "Telegram Desktop native" }
    "Slack"                  = @{ Status = "Native Linux"; Alt = "Slack native deb / flatpak" }
    "Zoom"                   = @{ Status = "Native Linux"; Alt = "Zoom native deb / flatpak" }
    "Steam"                  = @{ Status = "Native Linux"; Alt = "Steam native + Proton runs most Windows games" }
    "Spotify"                = @{ Status = "Native Linux"; Alt = "Spotify native client or web player" }
    "Obsidian"               = @{ Status = "Native Linux"; Alt = "Obsidian native flatpak/appimage" }
    "7-Zip"                  = @{ Status = "Alt";          Alt = "p7zip CLI or PeaZip/Ark GUI" }
    "WinRAR"                 = @{ Status = "Alt";          Alt = "Ark, File Roller, or unrar CLI" }
    "PuTTY"                  = @{ Status = "Alt";          Alt = "Linux terminal has native SSH built-in" }
    "Thunderbird"            = @{ Status = "Native Linux"; Alt = "Thunderbird native (email client)" }
    "LibreOffice"            = @{ Status = "Native Linux"; Alt = "LibreOffice native (Office alternative)" }
    "OneDrive"               = @{ Status = "Alt";          Alt = "abraunegg/onedrive client, OneDriveGUI, or web OneDrive" }
    "Teams"                  = @{ Status = "Web / PWA";    Alt = "Microsoft Teams PWA in browser or web app" }
    "Roblox Studio"          = @{ Status = "Wine / Alt";   Alt = "Runs via Wine/Vinegar; Sober runs the Roblox Player on Linux (unofficial)" }
    "Roblox Player"          = @{ Status = "Unofficial";   Alt = "Sober (Flatpak) or Waydroid; Windows client blocked by Hyperion anti-cheat" }
    "Epic Games Launcher"    = @{ Status = "Alt";          Alt = "Heroic Games Launcher (native, connects to Epic + GOG)" }
    "GOG GALAXY"             = @{ Status = "Alt";          Alt = "Heroic Games Launcher or Lutris" }
    "Photoshop"              = @{ Status = "Windows-only"; Alt = "GIMP, Krita, Photopea (web), or Windows VM" }
    "Premiere Pro"           = @{ Status = "Windows-only"; Alt = "DaVinci Resolve (native!), Kdenlive, Shotcut" }
    "Illustrator"            = @{ Status = "Windows-only"; Alt = "Inkscape (vector) or Vectornator/Figma (web)" }
    "After Effects"          = @{ Status = "Windows-only"; Alt = "Blender (VFX), Natron, or DaVinci Resolve Fusion" }
    "SolidWorks"             = @{ Status = "Windows-only"; Alt = "Onshape (browser), FreeCAD (open-source), BricsCAD, or dual-boot" }
    "AutoCAD"                = @{ Status = "Windows-only"; Alt = "BricsCAD, DraftSight, LibreCAD, or Onshape" }
    "Autodesk Inventor"      = @{ Status = "Windows-only"; Alt = "Onshape, FreeCAD, or dual-boot" }
    "ANSYS"                  = @{ Status = "Native Linux"; Alt = "ANSYS officially supports Linux (enterprise/academic)" }
    "MATLAB Runtime"         = @{ Status = "Native Linux"; Alt = "MATLAB Runtime native for Linux" }
    "Adobe Acrobat"          = @{ Status = "Alt";          Alt = "Document Viewer (Evince), Okular, Master PDF Editor" }
    "Dropbox"                = @{ Status = "Native Linux"; Alt = "Dropbox native Linux client" }
    "Google Drive"           = @{ Status = "Alt";          Alt = "rclone, Insync, or GNOME Online Accounts" }
    "iTunes"                 = @{ Status = "Windows-only"; Alt = "No Linux support; manage Apple devices in Windows/iOS or web Apple Music" }
    "Valorant"               = @{ Status = "Windows-only"; Alt = "Vanguard kernel anti-cheat does not support Linux" }
    "Fortnite"               = @{ Status = "Windows-only"; Alt = "Anti-cheat blocks Linux; playable via cloud gaming (GeForce NOW, Xbox Cloud)" }
    "Davinci Resolve"        = @{ Status = "Native Linux"; Alt = "Official native Linux build from Blackmagic Design" }
    "Kdenlive"               = @{ Status = "Native Linux"; Alt = "Native Linux video editor" }
    "FreeCAD"                = @{ Status = "Native Linux"; Alt = "Native open-source parametric CAD" }
    "Onshape"                = @{ Status = "Web / PWA";    Alt = "Browser-based full parametric CAD -- runs anywhere" }
    "Figma"                  = @{ Status = "Web / PWA";    Alt = "Browser-based or unofficial Linux desktop app" }
    "Notion"                 = @{ Status = "Web / PWA";    Alt = "Browser-based or Lothark's Notion app for Linux" }
    "AnyDesk"                = @{ Status = "Native Linux"; Alt = "AnyDesk native Linux" }
    "TeamViewer"             = @{ Status = "Native Linux"; Alt = "TeamViewer native Linux" }
    "virtualbox"             = @{ Status = "Native Linux"; Alt = "VirtualBox native on Linux" }
    "VMware"                 = @{ Status = "Native Linux"; Alt = "VMware Workstation Pro free for personal use on Linux" }
    "JetBrains"              = @{ Status = "Native Linux"; Alt = "All JetBrains IDEs native (Toolbox app)" }
    "Android Studio"         = @{ Status = "Native Linux"; Alt = "Native Linux" }
    "Arduino IDE"            = @{ Status = "Native Linux"; Alt = "Native Linux" }
    "Power BI Desktop"       = @{ Status = "Windows-only"; Alt = "Power BI web service; Metabase, Apache Superset, Tableau web" }
    "Microsoft 365"          = @{ Status = "Web / PWA";    Alt = "Office web apps at office.com; LibreOffice locally" }
}

function Classify-App($name) {
    if (-not $name) { return @{ Status="Unknown"; Alt="Check manually" } }
    foreach ($k in $knownCompat.Keys) {
        if ($name -match [regex]::Escape($k)) { return $knownCompat[$k] }
    }
    return @{ Status="Check manually"; Alt="Search '<app name> linux alternative' or check protondb.com for games" }
}

$inventory = @()
foreach ($a in $uniqueApps) {
    $c = Classify-App $a.DisplayName
    $inventory += [PSCustomObject]@{
        AppName        = $a.DisplayName
        Version        = $a.DisplayVersion
        Publisher      = $a.Publisher
        LinuxStatus    = $c.Status
        LinuxAlternative = $c.Alt
    }
}
$inventory | Sort-Object LinuxStatus, AppName | Export-Csv -Path (Join-Path $reportsFolder "installed_applications_compatibility.csv") -NoTypeInformation -Encoding utf8

$nativeCount   = ($inventory | Where-Object { $_.LinuxStatus -eq "Native Linux" }).Count
$wineCount     = ($inventory | Where-Object { $_.LinuxStatus -match "Wine" }).Count
$webCount      = ($inventory | Where-Object { $_.LinuxStatus -match "Web" }).Count
$altCount      = ($inventory | Where-Object { $_.LinuxStatus -match "Alt" }).Count
$windowsOnly   = ($inventory | Where-Object { $_.LinuxStatus -eq "Windows-only" }).Count
$unknownCount  = ($inventory | Where-Object { $_.LinuxStatus -eq "Check manually" }).Count
Write-Host "  Apps found: $($inventory.Count) | Native Linux: $nativeCount | Via Wine/Proton: $wineCount | Web apps: $webCount | Windows-only (needs replacement): $windowsOnly | Other: $($altCount+$unknownCount)" -ForegroundColor DarkGray

# -------------------------------------------------------------
# STEP 3: Full File Inventory by Type & Category
# -------------------------------------------------------------
Write-Host "`n[3/6] Scanning user files (this may take a few minutes) ..." -ForegroundColor Green

$fileCategories = @{
    "Documents"  = @(".docx",".doc",".pdf",".xlsx",".xls",".csv",".pptx",".ppt",".odt",".ods",".odp",".txt",".md",".rtf",".epub")
    "Code & Dev" = @(".py",".js",".ts",".jsx",".tsx",".html",".css",".scss",".json",".yaml",".yml",".xml",".sql",".sh",".ps1",".bat",".lua",".cpp",".c",".h",".hpp",".cs",".java",".rb",".php",".go",".rs")
    "Images"     = @(".png",".jpg",".jpeg",".gif",".bmp",".webp",".tiff",".tif",".svg",".ico",".raw",".cr2",".nef",".dng",".psd",".ai",".eps",".xcf",".kra")
    "Video"      = @(".mp4",".mov",".avi",".mkv",".wmv",".webm",".flv",".m4v",".mts",".3gp")
    "Audio"      = @(".mp3",".wav",".flac",".aac",".ogg",".m4a",".wma",".mid",".midi",".aup3")
    "3D & CAD"   = @(".obj",".fbx",".stl",".step",".stp",".iges",".igs",".dwg",".dxf",".blend",".glb",".gltf",".dae",".sldprt",".sldasm",".iam",".ipt",".rbxm",".rbxl",".fcstd")
    "Archives"   = @(".zip",".rar",".7z",".tar",".gz",".bz2",".xz")
    "Datasets"   = @(".parquet",".feather",".avro",".h5",".hdf5",".pkl",".pickle",".npy",".npz",".nc")
    "Model Files"= @(".onnx",".pt",".pth",".safetensors",".bin",".tflite",".gguf")
    "Installers (safe to skip)" = @(".exe",".msi",".iso",".img")
}

$excludeDirs = @(
    "AppData",".vscode",".cache",".cargo",".gradle",".m2",".nuget",".npm",".nvm",".pnpm-store",
    "node_modules","__pycache__",".venv","venv","env",".env",".git","dist","build","bin","obj",
    "VirtualBox VMs",".android","Downloads_OLD","Trash","OneDriveTemp","Temp"
)

$sourceFolders = @($Source) + $ExtraFolders
$sourceFolders = $sourceFolders | Where-Object { Test-Path $_ } | Select-Object -Unique

function Get-Category($ext) {
    if (-not $ext) { return "Other" }
    foreach ($cat in $fileCategories.Keys) {
        if ($fileCategories[$cat] -contains $ext.ToLower()) { return $cat }
    }
    return "Other"
}

$allFiles = @()
foreach ($sf in $sourceFolders) {
    Write-Host "  Enumerating $sf ..." -ForegroundColor DarkGray
    try {
        $files = Get-ChildItem -Path $sf -Recurse -File -Force -ErrorAction SilentlyContinue |
            Where-Object {
                $full = $_.FullName
                $skip = $false
                foreach ($ex in $excludeDirs) {
                    if ($full -match [regex]::Escape("\$ex\") -or $full -match [regex]::Escape("\$ex$")) { $skip = $true; break }
                }
                -not $skip
            } | Select-Object FullName, Extension, Length, LastWriteTime,
                @{N='Category';E={ Get-Category $_.Extension }},
                @{N='SizeMB';E={ [math]::Round($_.Length/1MB, 2) }}
        $allFiles += $files
    } catch {}
}

$allFiles | Export-Csv -Path (Join-Path $reportsFolder "all_files_inventory.csv") -NoTypeInformation -Encoding utf8

$catSummary = $allFiles | Group-Object Category | ForEach-Object {
    [PSCustomObject]@{
        Category   = $_.Name
        FileCount  = $_.Count
        TotalSizeMB= [math]::Round((($_.Group | Measure-Object Length -Sum).Sum)/1MB, 1)
        TotalSizeGB= [math]::Round((($_.Group | Measure-Object Length -Sum).Sum)/1GB, 2)
    }
} | Sort-Object TotalSizeMB -Descending

$catSummary | Export-Csv -Path (Join-Path $reportsFolder "category_summary.csv") -NoTypeInformation -Encoding utf8
Write-Host ""
$catSummary | Format-Table -AutoSize
$grandCount = $allFiles.Count
$grandGB = [math]::Round((($allFiles | Measure-Object Length -Sum).Sum)/1GB, 2)
Write-Host "  TOTAL: $grandCount files, $grandGB GB across scanned locations" -ForegroundColor Yellow

# -------------------------------------------------------------
# STEP 4: Junk & Unused Items Detection
# -------------------------------------------------------------
Write-Host "`n[4/6] Identifying junk and unused files (safe to leave behind) ..." -ForegroundColor Green
$junk = @()

# Temp folders
$tempPaths = @("$env:LOCALAPPDATA\Temp", "$env:TEMP")
foreach ($tp in $tempPaths) {
    if (Test-Path $tp) {
        $tf = Get-ChildItem -Path $tp -Recurse -File -Force -ErrorAction SilentlyContinue |
            Measure-Object -Property Length -Sum
        $junk += [PSCustomObject]@{ Item = "Windows Temp ($tp)"; Count = $tf.Count; SizeMB = [math]::Round(($tf.Sum)/1MB,1); Action = "Do NOT copy; recreated by OS" }
    }
}

# Old installers in Downloads
$downloads = Join-Path $Source "Downloads"
if (Test-Path $downloads) {
    $cutoff = (Get-Date).AddDays(-$InstallerAgeDays)
    $oldInst = Get-ChildItem -Path $downloads -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in @(".exe",".msi",".iso") -and $_.LastWriteTime -lt $cutoff }
    $s = ($oldInst | Measure-Object Length -Sum).Sum
    $junk += [PSCustomObject]@{ Item = "Old installers in Downloads (older than $InstallerAgeDays days)"; Count = $oldInst.Count; SizeMB = [math]::Round($s/1MB,1); Action = "Skip -- apps will be reinstalled from Linux package managers" }
    $oldInst | Select-Object FullName, Length, LastWriteTime | Export-Csv -Path (Join-Path $reportsFolder "junk_old_installers.csv") -NoTypeInformation -Encoding utf8
}

# node_modules
$nm = Get-ChildItem -Path $Source -Directory -Recurse -Force -Filter "node_modules" -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch "\.(vscode|cache)" }
$nmList = @()
foreach ($d in $nm) {
    $m = Get-ChildItem -Path $d.FullName -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
    $nmList += [PSCustomObject]@{ Path = $d.FullName; Files = $m.Count; SizeMB = [math]::Round(($m.Sum)/1MB,1) }
}
$nmList | Export-Csv -Path (Join-Path $reportsFolder "junk_node_modules.csv") -NoTypeInformation -Encoding utf8
$junk += [PSCustomObject]@{ Item = "node_modules folders (re-created via 'npm/pnpm i' on Linux)"; Count = $nmList.Count; SizeMB = [math]::Round(($nmList | Measure-Object SizeMB -Sum).Sum,1); Action = "Skip -- reinstall dependencies on Linux" }

# Python venvs
$venvs = Get-ChildItem -Path $Source -Directory -Recurse -Force -Filter ".venv" -ErrorAction SilentlyContinue
$vList = @()
foreach ($d in $venvs) {
    $m = Get-ChildItem -Path $d.FullName -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
    $vList += [PSCustomObject]@{ Path = $d.FullName; Files = $m.Count; SizeMB = [math]::Round(($m.Sum)/1MB,1) }
}
$junk += [PSCustomObject]@{ Item = "Python virtualenvs (re-created via 'python -m venv' on Linux)"; Count = $vList.Count; SizeMB = [math]::Round(($vList | Measure-Object SizeMB -Sum).Sum,1); Action = "Skip -- create fresh Linux venvs" }

$junk | Format-Table -AutoSize
$junk | Export-Csv -Path (Join-Path $reportsFolder "junk_and_unused_items.csv") -NoTypeInformation -Encoding utf8
$junkGB = [math]::Round((($junk | Measure-Object SizeMB -Sum).Sum)/1024, 2)
Write-Host "  ~${junkGB} GB of temporary/recreatable files can be safely left behind" -ForegroundColor DarkGray

# -------------------------------------------------------------
# STEP 5: MAIJ Model-Training Asset Detection & Organization
# -------------------------------------------------------------
Write-Host "`n[5/6] Hunting MAIJ model-training assets ..." -ForegroundColor Green
$maijKeywords = @("maij","drone","farm","crop","uav","robot","robotics","simulation","concept","flight","fly","payload","aerial","cad","payload","delivery","airspace","jetson","propeller","motor","hospitation","akg","commercial","storyboard","logo","branding","training","dataset")
$mediaExt = @(".png",".jpg",".jpeg",".gif",".webp",".svg",".mp4",".mov",".avi",".webm",".wav",".mp3",".ogg",".obj",".fbx",".stl",".step",".stp",".blend",".glb",".gltf",".rbxm",".rbxl",".csv",".json",".parquet",".txt",".md",".pdf",".docx",".pptx",".fcstd")

$maijAssets = @()
foreach ($f in $allFiles) {
    $nameLower = ($f.FullName).ToLower()
    $ext = [IO.Path]::GetExtension($f.FullName).ToLower()
    if ($mediaExt -contains $ext) {
        $hit = $false
        foreach ($kw in $maijKeywords) {
            if ($nameLower -match [regex]::Escape($kw)) { $hit = $true; break }
        }
        if ($hit) { $maijAssets += $f }
    }
}

# Sub-categorize MAIJ assets
function SubCat-MAIJ($f) {
    $n = ($f.FullName).ToLower()
    $ext = [IO.Path]::GetExtension($f.FullName).ToLower()
    if ($f.Extension -in @(".obj",".fbx",".stl",".step",".stp",".blend",".glb",".gltf",".rbxm",".rbxl",".fcstd")) { return "3D_and_CAD_Models" }
    if ($f.Extension -in @(".mp4",".mov",".avi",".webm")) { return "Video_Footage_and_Simulations" }
    if ($f.Extension -in @(".wav",".mp3",".ogg")) { return "Audio_and_Voiceovers" }
    if ($n -match "dataset|training|\.parquet|\.json|\.csv" -and $f.Extension -in @(".csv",".json",".parquet")) { return "Structured_Data_and_Labels" }
    if ($n -match "logo|brand|brochure|storyboard|commercial|slide") { return "Branding_and_Graphics" }
    if ($n -match "drone|aerial|farm|flight|propeller|motor|simulation|fly") { return "Drone_and_Simulation_Imagery" }
    if ($f.Extension -in @(".txt",".md",".pdf",".docx",".pptx")) { return "Documentation_and_Text_Data" }
    return "Imagery_and_Other"
}

$maijWithCats = @()
foreach ($a in $maijAssets) {
    $maijWithCats += [PSCustomObject]@{
        FullName     = $a.FullName
        Name         = [IO.Path]::GetFileName($a.FullName)
        MAIJCategory = SubCat-MAIJ $a
        SizeMB       = $a.SizeMB
        LastWriteTime= $a.LastWriteTime
    }
}
$maijWithCats | Export-Csv -Path (Join-Path $reportsFolder "maij_training_assets_detected.csv") -NoTypeInformation -Encoding utf8

$maijSummary = $maijWithCats | Group-Object MAIJCategory | ForEach-Object {
    [PSCustomObject]@{ Category = $_.Name; Count = $_.Count; SizeMB = [math]::Round(($_.Group | Measure-Object SizeMB -Sum).Sum, 1) }
}
Write-Host "  Found $($maijWithCats.Count) potential MAIJ-related assets:" -ForegroundColor Yellow
$maijSummary | Format-Table -AutoSize

# -------------------------------------------------------------
# STEP 6: Backup / Copy Plan Execution
# -------------------------------------------------------------
Write-Host "`n[6/6] Backup plan ..." -ForegroundColor Green

$importantCategories = @("Documents","Code & Dev","Images","Audio","3D & CAD","Datasets","Model Files")
$curated = $allFiles | Where-Object {
    $_.Category -in $importantCategories -and $_.Length -gt 0
}
$curatedGB = [math]::Round((($curated | Measure-Object Length -Sum).Sum)/1GB, 2)
Write-Host "  Curated set: $($curated.Count) files, ${curatedGB} GB" -ForegroundColor Yellow

# Copy execution
if ($Mode -eq "Copy") {
    Write-Host "`n>>> COPYING FILES TO EXTERNAL DRIVE <<<" -ForegroundColor Magenta
    $docsTarget = Join-Path $outDir "Important_Documents"
    $maijTarget = Join-Path $outDir "MAIJ_Model_Training_Assets"
    New-Item -ItemType Directory -Path $docsTarget -Force | Out-Null
    New-Item -ItemType Directory -Path $maijTarget -Force | Out-Null

    # 6a. Copy MAIJ assets into structured training folders
    Write-Host "  Staging MAIJ assets into category folders on $ExternalDrive ..." -ForegroundColor DarkGray
    # Pre-create future-use training categories so the staging structure is complete
    $futureCats = @("Geospatial_and_Airspace","Simulation_and_Hardware_Environments","Telemetry_and_Operations_Data","Model_Zoo_and_Benchmarks")
    foreach ($fc in $futureCats) { New-Item -ItemType Directory -Path (Join-Path $maijTarget $fc) -Force | Out-Null }
    $maijCopyLog = @()
    foreach ($a in $maijWithCats) {
        $destFolder = Join-Path $maijTarget $a.MAIJCategory
        New-Item -ItemType Directory -Path $destFolder -Force | Out-Null
        $dest = Join-Path $destFolder $a.Name
        if (Test-Path $dest) { $dest = Join-Path $destFolder (([guid]::NewGuid().ToString().Substring(0,6)) + "_" + $a.Name) }
        try {
            Copy-Item -LiteralPath $a.FullName -Destination $dest -Force -ErrorAction Stop
            $maijCopyLog += [PSCustomObject]@{ Source = $a.FullName; Destination = $dest; Status = "OK" }
        } catch {
            $maijCopyLog += [PSCustomObject]@{ Source = $a.FullName; Destination = $dest; Status = "FAILED: $_" }
        }
    }
    $maijCopyLog | Export-Csv -Path (Join-Path $reportsFolder "maij_assets_copy_log.csv") -NoTypeInformation -Encoding utf8
    $maijOK = ($maijCopyLog | Where-Object Status -eq "OK").Count
    Write-Host "  MAIJ assets staged: $maijOK / $($maijCopyLog.Count) copied" -ForegroundColor Green

    # 6b. Copy curated documents/code/media with Robocopy (mirrors folder structure safely)
    Write-Host "  Copying curated documents, code, and media (preserving folder structure) ..." -ForegroundColor DarkGray
    $roboLogs = @()
    foreach ($sf in $sourceFolders) {
        $dest = Join-Path $docsTarget ([IO.Path]::GetFileName($sf))
        $roboLog = Join-Path $reportsFolder ("robocopy_" + (Split-Path $sf -Leaf) + ".log")
        $roboArgs = @(
            "`"$sf`"", "`"$dest`"", "*.*",
            "/S", "/Z", "/R:2", "/W:2", "/NP", "/NDL",
            "/XD", "`$RECYCLE.BIN", "node_modules", ".git\objects", "__pycache__", ".venv", "venv", "AppData",
            "/XF", "*.exe", "*.msi", "*.iso", "Thumbs.db", "desktop.ini", "*.tmp",
            "/LOG:`"$roboLog`""
        )
        Start-Process robocopy -ArgumentList $roboArgs -Wait -NoNewWindow | Out-Null
        $roboLogs += $roboLog
        Write-Host "    $sf -> $dest" -ForegroundColor DarkGray
    }
    Write-Host "  Documents copy complete. Logs in $reportsFolder" -ForegroundColor Green

    # Write README on the drive
    $readme = @"
# Windows-to-Linux Migration Backup
Created: $(Get-Date -Format "yyyy-MM-dd HH:mm")
Source PC: $env:COMPUTERNAME ($env:OS, Windows $(([Environment]::OSVersion).Version))

## Folder Contents
- Important_Documents/          - Curated documents, code, images, audio, CAD models
- MAIJ_Model_Training_Assets/   - Assets pre-sorted for MAIJ model training (11 categories):
  * 3D_and_CAD_Models/
  * Drone_and_Simulation_Imagery/
  * Video_Footage_and_Simulations/
  * Audio_and_Voiceovers/
  * Structured_Data_and_Labels/
  * Branding_and_Graphics/
  * Documentation_and_Text_Data/
  * Imagery_and_Other/
  * Geospatial_and_Airspace/ (pre-created for NC GIS/airspace data)
  * Simulation_and_Hardware_Environments/ (pre-created for Gazebo/PX4/calibrations)
  * Telemetry_and_Operations_Data/ (pre-created for flight logs/cold-chain)
  * Model_Zoo_and_Benchmarks/ (pre-created for checkpoints/recipes)
- audit_reports/                - CSV reports of apps, files, and copy logs

## Before wiping Windows, verify:
[ ] You can open a few files from this drive
[ ] All OneDrive files were downloaded (not cloud-only placeholders)
[ ] Browser bookmarks/passwords exported
[ ] MFA authenticator recovery codes saved
"@
    $readme | Out-File -Encoding utf8 (Join-Path $outDir "README_FIRST.txt")
}

# -------------------------------------------------------------
# STEP 7: HTML Master Report
# -------------------------------------------------------------
function Escape-Html($s) {
    if ($null -eq $s) { return '' }
    [System.Security.SecurityElement]::Escape([string]$s)
}

$appRows = foreach ($a in ($inventory | Sort-Object LinuxStatus, AppName)) {
    $cls = switch -regex ($a.LinuxStatus) {
        'Native'       {'ok'}
        'Wine|Web|Alt' {'warn'}
        'Windows-only' {'bad'}
        default        {'warn'}
    }
    '<tr><td>' + (Escape-Html $a.AppName) + '</td><td>' + (Escape-Html $a.Version) + '</td><td>' + (Escape-Html $a.Publisher) + '</td><td class="' + $cls + '">' + (Escape-Html $a.LinuxStatus) + '</td><td>' + (Escape-Html $a.LinuxAlternative) + '</td></tr>'
}

$catRows = foreach ($c in $catSummary) {
    '<tr><td>' + (Escape-Html $c.Category) + '</td><td>' + $c.FileCount + '</td><td>' + $c.TotalSizeMB + '</td><td>' + $c.TotalSizeGB + '</td></tr>'
}

$junkRows = foreach ($j in $junk) {
    '<tr><td>' + (Escape-Html $j.Item) + '</td><td>' + $j.Count + '</td><td>' + $j.SizeMB + '</td><td>' + (Escape-Html $j.Action) + '</td></tr>'
}

$maijRows = foreach ($m in $maijSummary) {
    '<tr><td>' + (Escape-Html $m.Category) + '</td><td>' + $m.Count + '</td><td>' + $m.SizeMB + '</td></tr>'
}

$appTable  = $appRows  -join "`r`n"
$catTable  = $catRows  -join "`r`n"
$junkTable = $junkRows -join "`r`n"
$maijTable = $maijRows -join "`r`n"

$html = @"
<!DOCTYPE html><html><head><meta charset='utf-8'><title>Windows-to-Linux Migration Audit</title>
<style>
body{font-family:Segoe UI,Arial,sans-serif;max-width:1100px;margin:30px auto;padding:0 20px;color:#222}
h1{color:#125287}h2{color:#1f6feb;border-bottom:2px solid #ddd;padding-bottom:6px}table{border-collapse:collapse;width:100%;margin:12px 0}
th,td{border:1px solid #ccc;padding:6px 10px;text-align:left;font-size:13px}th{background:#125287;color:#fff}
tr:nth-child(even){background:#f6f8fa}.ok{color:#1a7f37;font-weight:bold}.warn{color:#d29922;font-weight:bold}.bad{color:#cf222e;font-weight:bold}
.box{background:#f0f6ff;border:1px solid #c8d9ea;padding:12px 16px;margin:12px 0}
code{background:#eee;padding:1px 5px}
</style></head><body>
<h1>Windows-to-Linux Migration Audit</h1>
<p>Generated on $env:COMPUTERNAME &middot; $(Get-Date -Format "yyyy-MM-dd HH:mm") &middot; Mode: <b>$Mode</b></p>
<div class='box'><b>Summary:</b> Scanned $grandCount files (~${grandGB} GB), $inventory.Count installed applications. Curated backup set: $($curated.Count) files (~${curatedGB} GB). Found $($maijWithCats.Count) MAIJ model-training assets.</div>

<h2>Application Compatibility Review</h2>
<table><tr><th>Application</th><th>Version</th><th>Publisher</th><th>Linux Status</th><th>Linux Alternative / Notes</th></tr>
$appTable
</table>

<h2>Files by Category</h2>
<table><tr><th>Category</th><th>Count</th><th>Size (MB)</th><th>Size (GB)</th></tr>
$catTable
</table>

<h2>Junk / Recreatable Items (safe to leave behind)</h2>
<table><tr><th>Item</th><th>Count</th><th>Size (MB)</th><th>Action</th></tr>
$junkTable
</table>

<h2>MAIJ Model-Training Assets</h2>
<table><tr><th>Category</th><th>Count</th><th>Size (MB)</th></tr>
$maijTable
</table>

<h2>Next Steps</h2>
<ol>
<li>Review the full CSV files in <code>$reportsFolder</code></li>
<li>If satisfied, run with <code>-Mode Copy</code> to back up to $ExternalDrive</li>
<li>Verify the backup by opening a few files from the external drive</li>
<li>Export browser data (bookmarks, passwords) and save MFA recovery codes</li>
<li>Ensure all OneDrive files are "Always keep on this device" before final copy</li>
<li>Create a bootable Linux USB and install your chosen distro (Ubuntu 24.04 LTS or Linux Mint 22 recommended)</li>
</ol>
</body></html>
"@
$html | Out-File -Encoding utf8 (Join-Path $outDir "migration_audit_report.html")

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host "AUDIT COMPLETE" -ForegroundColor Green
Write-Host "  HTML report:   $outDir\migration_audit_report.html" -ForegroundColor Yellow
Write-Host "  CSV reports:   $reportsFolder\" -ForegroundColor Yellow
if ($Mode -eq "Copy") {
    Write-Host "  Documents:     $outDir\Important_Documents\" -ForegroundColor Yellow
    Write-Host "  MAIJ assets:   $outDir\MAIJ_Model_Training_Assets\" -ForegroundColor Yellow
    Write-Host "  README:        $outDir\README_FIRST.txt" -ForegroundColor Yellow
}
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "`nTip: open migration_audit_report.html in your browser to review." -ForegroundColor DarkGray
