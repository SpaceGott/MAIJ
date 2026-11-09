---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-IT-001
TITLE: File-Filtering and Cleanup Strategy for Windows-to-Linux Migration
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.1 (Draft)
OWNER: MAIJ Infrastructure
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Explicit KEEP/SKIP rules implemented by the PowerShell migration script, with dedicated handling for OneDrive placeholders, the Downloads folder (current-year documents kept and staged separately; installer packages skipped), and the verification checklist before wiping Windows.
---

# File-Filtering and Cleanup Strategy

## 1. Goal

Move only what matters to drive `F:`, leave recreatable junk behind, and verify before wiping Windows. The PowerShell script `migrate-to-linux.ps1` implements every rule in this document automatically.

## 2. The KEEP List (included in the curated backup)

* **Documents:** `.docx`, `.doc`, `.pdf`, `.xlsx`, `.xls`, `.csv`, `.pptx`, `.ppt`, `.odt`, `.ods`, `.odp`, `.txt`, `.md`, `.rtf`, `.epub`
* **Code & developer files:** `.py`, `.js`, `.ts`, `.jsx`, `.tsx`, `.html`, `.css`, `.scss`, `.json`, `.yaml`, `.yml`, `.xml`, `.sql`, `.sh`, `.ps1`, `.bat`, `.lua`, `.cpp`, `.c`, `.h`, `.hpp`, `.cs`, `.java`, `.go`, `.rs`, `.rb`, `.php`
* **Images:** `.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.webp`, `.tiff`, `.svg`, `.ico`, `.raw`, `.cr2`, `.nef`, `.dng`, `.psd`, `.ai`, `.eps`, `.xcf`, `.kra`
* **Video:** `.mp4`, `.mov`, `.avi`, `.mkv`, `.wmv`, `.webm`, `.flv`, `.m4v`
* **Audio:** `.mp3`, `.wav`, `.flac`, `.aac`, `.ogg`, `.m4a`, `.mid`, `.aup3`
* **3D & CAD:** `.obj`, `.fbx`, `.stl`, `.step`, `.stp`, `.iges`, `.dwg`, `.dxf`, `.blend`, `.glb`, `.gltf`, `.dae`, `.sldprt`, `.sldasm`, `.iam`, `.ipt`, `.fcstd`, `.rbxm`, `.rbxl`
* **Datasets & model weights:** `.parquet`, `.feather`, `.h5`, `.hdf5`, `.pkl`, `.npy`, `.npz`, `.onnx`, `.pt`, `.pth`, `.safetensors`, `.bin`, `.tflite`, `.gguf`
* **Archives:** `.zip`, `.rar`, `.7z`, `.tar`, `.gz`, `.bz2`

## 3. The SKIP List (excluded by the script)

* **Windows temporary folders:** `%TEMP%`, `%LOCALAPPDATA%\Temp`, `%USERPROFILE%\AppData\Local\Temp`
* **Installer packages:** `.exe`, `.msi`, `.iso`, `.img` — Windows-only; redownload from Linux package managers
* **Old installers in Downloads:** installers older than 60 days are flagged in `junk_old_installers.csv`
* **Dependency trees:** `node_modules` (recreate via `npm/pnpm/yarn install`), Python venvs (`.venv`, `venv` — recreate via `python -m venv`), build outputs (`dist/`, `build/`, `__pycache__/`)
* **Package manager caches:** `.npm`, `.cache`, `.cargo`, `.gradle`, `.nuget`
* **OS artifacts:** `Thumbs.db`, `desktop.ini`, `~$*.docx` lock files, the Recycle Bin
* **Browser caches:** Linux browsers will not reuse them

## 4. Special Cases That Require Your Attention

### 4.1 OneDrive "Files On-Demand" (highest risk)

Files shown with a cloud icon are placeholders, not real files. Copying them produces empty shells. Right-click your OneDrive folder → **"Always keep on this device"**, wait until the blue sync icons disappear, and only then run the copy step.

### 4.2 Browser Data

* **Bookmarks:** Chrome/Edge → Bookmarks → Bookmark manager → Export bookmarks → save the HTML file
* **Passwords:** Settings → Autofill → Password Manager → Export passwords → save the CSV securely on F:
* **Extensions:** let them reinstall via your Google/Microsoft account sign-in on Linux

### 4.3 MFA / Authenticator Apps

Do not uninstall Microsoft Authenticator or Google Authenticator from your phone — MFA is device-independent. For extra safety, generate **one-time recovery codes** for your `maij.us` (Microsoft 365) and university accounts and store them securely on F:.

### 4.4 Your Roblox Project (`C:\blu-k2-port`)

The script copies the entire repository including the `.git` folder (commit history preserved) while skipping build artifacts. Before wiping Windows, push your latest commits to GitHub and verify `git log` on F: matches your working repo.

### 4.5 `.env` and Config Files

`.env` files in project folders are copied automatically. Copy `C:\Users\<you>\.ssh` (SSH keys for GitHub and servers) manually or let the script include it.

### 4.6 Your Downloads Folder

The script **copies all document and media files from Downloads** (PDFs, Word docs, spreadsheets, presentations, images, CSVs, ZIPs) as part of the normal user-profile copy, while skipping installer packages (.exe, .msi, .iso). In addition, **current-year (2026) documents from Downloads are staged into a prominent dedicated folder on the drive** — `Recent_Downloads_2026/` — so they are instantly findable on Linux without digging through the user-profile tree. The Audit-mode report lists every one of these files with its date, size, and category.

## 5. What the Result Looks Like on Drive F:

```
F:\MigrationBackup_YYYYMMDD_HHMMSS\
├── Important_Documents/          # Curated documents, code, images, audio, CAD
│   ├── <YourUserName>/           # Mirror of your user folder (including Downloads!)
│   └── blu-k2-port/              # Mirror of the game project repo
│
├── Recent_Downloads_2026/        # Year-2026 documents recovered from Downloads
│
├── MAIJ_Model_Training_Assets/   # Pre-sorted training assets by category (11 categories)
│   ├── 01_3D_and_CAD_Models/
│   ├── 02_Drone_and_Simulation_Imagery/
│   ├── 03_Video_Footage_and_Simulations/
│   ├── 04_Audio_and_Voiceovers/
│   ├── 05_Structured_Data_and_Labels/
│   ├── 06_Branding_and_Graphics/
│   ├── 07_Documentation_and_Text_Data/
│   ├── 08_Geospatial_and_Airspace/              # NC DEMs, LiDAR, FAA charts
│   ├── 09_Simulation_and_Hardware_Environments/ # Gazebo, PX4, calibrations
│   ├── 10_Telemetry_and_Operations_Data/        # flight logs, cold-chain
│   └── 11_Model_Zoo_and_Benchmarks/             # checkpoints, recipes
│
├── audit_reports/                # Proof: CSVs of apps, files, and copy logs
│   ├── installed_applications_compatibility.csv
│   ├── category_summary.csv
│   ├── junk_and_unused_items.csv
│   ├── downloads_recent_documents_2026.csv
│   ├── maij_training_assets_detected.csv
│   └── maij_assets_copy_log.csv
│
├── README_FIRST.txt              # What's on this drive + pre-wipe checklist
└── migration_audit_report.html   # Open in your browser to review everything
```

## 6. Verification Before You Wipe

Never trust a copy until you have tested it:

1. **Spot-check:** open 10+ files directly from F: — including a large video, a `.docx`, a `.blend` or CAD file, and a `.py` script
2. **Recent-downloads check:** open `Recent_Downloads_2026/` and confirm your current-year documents are present and readable
3. **Count-check:** `F:\audit_reports\maij_assets_copy_log.csv` — confirm all rows say `OK`
4. **Log-check:** `F:\audit_reports\robocopy_*.log` — the summary section at the bottom should show `Failed: 0`
5. **OneDrive-check:** confirm no OneDrive files on F: are 0-byte placeholders
6. **Git-check:** open the copied `blu-k2-port` folder on F: in a terminal and run `git status` — it should be a valid repo

Only after all six checks pass should you proceed to install Linux.
