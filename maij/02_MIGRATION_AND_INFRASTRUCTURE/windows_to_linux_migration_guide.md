---
MAIJ DOCUMENT IDENTIFIER: IGD-MAIJ-IT-001
TITLE: Windows-to-Linux Migration Guide and Application Compatibility Audit
CATEGORY: Migration & Infrastructure
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Comprehensive migration guide auditing 30+ installed-application classes for Linux compatibility, providing a re-download/alternatives list, pre-migration safety checklist, and distribution recommendations for Windows switchers.
---

# Windows-to-Linux Migration Guide

A complete, actionable plan for moving from Windows to Linux with minimal data loss, a full application-compatibility audit, a file-filtering strategy, and a curated asset-staging plan for MAIJ model training.

---

## 1. Summary of What We Discovered About Your Setup

Before planning the move, a few critical facts about your current environment matter:

* **Your PC ("Laptoy")** is a Windows AMD64 computer registered in the Manus Desktop app with command access enabled for the `C:\blu-k2-port` workspace. When Manus connected to your PC, the desktop app reported that its local-execution protocol needs an update ("*The selected device executor does not support grant terminals. Update the Manus app or operator before running this approved command*"). Once you **update the Manus Desktop app** on Windows (or close and relaunch it after an update), Manus will be able to scan and copy files automatically. In the meantime, this guide includes a **fully automated PowerShell audit script** you can run yourself with one click.
* **Your external drive (F:)** is the target destination. The script verifies the drive exists, checks its free space, confirms its file system, and copies curated files to it.
* **Your stack** spans three distinct worlds that each need special handling on Linux:
  1. **MAIJ** — your farm-to-restaurant autonomous drone delivery venture (`maij.us`). Good news: Linux (especially Ubuntu) is the *de-facto standard* for robotics, ROS/ROS2, Jetson development, computer vision, and AI model training. This part of your workflow will actually run **better** on Linux.
  2. **Roblox game development ("Wayfarer's Light")** — Roblox Studio does **not** officially support Linux, but it **does run via Wine/Vinegar**; the Roblox Player is blocked on Wine by the Hyperion anti-cheat, though the community client **Sober** can play Roblox on Linux.
  3. **TU Dortmund mechanical engineering studies** — MATLAB and ANSYS are natively supported on Linux; Windows-only CAD like SolidWorks can be replaced by Onshape (browser-based) or FreeCAD, or kept in a dual-boot setup.

---

## 2. Application Compatibility Review: What Works, What Doesn't, What to Replace

Here is the complete review of applications you likely have installed, organized into four tiers.

### Tier 1: Natively Supported on Linux (install directly from Linux software stores or package managers)

| Application | Linux Status | How to Install on Linux |
|---|---|---|
| **Mozilla Firefox** | Native | Preinstalled on almost every distro |
| **Google Chrome / Chromium / Brave / Opera** | Native | `.deb` packages or Flatpak |
| **Visual Studio Code** | Native | `.deb` package, snap, or Flatpak |
| **Git** | Native | `sudo apt install git` (Ubuntu/Mint) |
| **Python 3 / Node.js** | Native | Preinstalled; use `nvm` for Node |
| **MATLAB & Simulink** | Native — officially validated on Ubuntu LTS, Debian, RHEL [1] | Download installer from mathworks.com |
| **ANSYS** | Native (enterprise/academic Linux builds) | Institutional installer |
| **Blender** | Native — outstanding Linux performance | Flatpak, snap, or apt |
| **OBS Studio** | Native | Flatpak or apt |
| **Audacity** | Native | Flatpak or apt |
| **GIMP** (Photoshop alternative) | Native | Flatpak or apt |
| **Inkscape** (Illustrator alternative) | Native | Flatpak or apt |
| **Krita** (digital art/painting) | Native | Flatpak or apt |
| **VLC Media Player** | Native | Flatpak or apt |
| **Discord** | Native | `.deb` package or Flatpak / Vesktop |
| **Telegram / Slack / Zoom** | Native | `.deb` packages or Flatpak |
| **Steam** (+ Proton for Windows games) | Native | apt or distro software store |
| **Spotify** | Native | Flatpak, snap, or `.deb` |
| **Obsidian** | Native | Flatpak or AppImage |
| **Dropbox** | Native | `.deb` package |
| **VirtualBox** | Native | apt |
| **Android Studio / Arduino IDE / JetBrains IDEs** | Native | Official Linux builds |
| **DaVinci Resolve** | Native professional video editor | Official Linux build from Blackmagic Design |
| **FreeCAD** | Native open-source parametric CAD | Flatpak or apt |
| **AnyDesk / TeamViewer** | Native | `.deb` packages |

### Tier 2: Works via Wine, Proton, or Community Tools

| Application | Status | Notes |
|---|---|---|
| **Roblox Studio** | Community supported | Runs through **Vinegar** (Wine-based). Roblox staff has confirmed Roblox Studio will not receive the Hyperion anti-cheat because it is only used for game development [2]. |
| **Roblox Player** (playing games) | Community supported | The Windows `.exe` client is blocked on Wine by Hyperion [3]. **Sober** (an x86-64 Linux client wrapping the Android build) plays Roblox on Linux; **Waydroid** is an Android-container alternative [2]. |
| **Windows Steam games** | ~85%+ compatible | Steam's built-in **Proton** translation layer runs most Windows games with zero setup. Check individual games at [protondb.com]. |
| **Epic Games & GOG titles** | Excellent | **Heroic Games Launcher** is a native Linux app that signs into both Epic and GOG and launches games through Proton/Wine. |
| **Notepad++** | Works via Wine | Or switch to native editors: VS Code, Kate, Geany. |

### Tier 3: Browser / Cloud Apps (run identically in any Linux browser)

| Application | Best Linux Access |
|---|---|
| **Microsoft 365 (Word, Excel, PowerPoint)** | [office.com](https://office.com) — full web apps |
| **Microsoft Outlook / `maij.us` email** | [outlook.office.com](https://outlook.office.com); or desktop clients: **Thunderbird**, **Evolution** (with Exchange/EWS support), or **Betterbird** [4] |
| **Microsoft Teams** | Teams Progressive Web App (PWA) in Chrome/Firefox or unofficial Linux desktop wrappers |
| **OneDrive** | [abraunegg/onedrive](https://github.com/abraunegg/onedrive) — full-featured open-source client with sync for Personal, Business, Microsoft 365, and SharePoint; or **OneDriveGUI** frontend; or [onedrive.live.com] [5] |
| **Figma / Notion / Canva / Miro** | Browser-based or unofficial Linux desktop apps |
| **Onshape** | Full parametric 3D CAD in the browser — the most direct SolidWorks alternative on Linux |
| **Google Drive / Docs** | Browser; or sync tools like **rclone**, **Insync**, or GNOME Online Accounts |

### Tier 4: Windows-Only Software Needing Replacements

| Windows App | Linux Verdict | Recommended Linux Replacement |
|---|---|---|
| **SolidWorks** | Windows only | **Onshape** (browser parametric CAD), **FreeCAD** (open-source), **BricsCAD** / **VariCAD**, or keep a Windows dual-boot/VM [6] |
| **AutoCAD / Autodesk Inventor** | Windows only | **BricsCAD**, **DraftSight**, **LibreCAD**, **Onshape**, **FreeCAD** |
| **Adobe Photoshop** | Windows/macOS only | **GIMP**, **Krita**, **Photopea** (browser), or a Windows VM [7] |
| **Adobe Illustrator** | Windows/macOS only | **Inkscape** (native vector), **Figma**, **Vectornator** [7] |
| **Adobe Premiere Pro** | Windows/macOS only | **DaVinci Resolve** (native, industry-standard), **Kdenlive**, **Shotcut** [7] [8] |
| **Adobe After Effects** | Windows/macOS only | **Blender** (VFX/compositing), **Natron**, **DaVinci Resolve Fusion** [8] |
| **Adobe Acrobat** | Windows/macOS only | **Evince** (Document Viewer), **Okular**, **Master PDF Editor**, **PDF Arranger** |
| **Power BI Desktop** | Windows only | Power BI web service; **Metabase**, **Apache Superset**, Tableau web |
| **iTunes** | Windows/macOS only | Manage Apple devices in iOS or web Apple Music; no full Linux equivalent |
| **Games with kernel-level anti-cheat** (Valorant / Vanguard, Fortnite, EA anticheat titles) | Not supported on Linux | Cloud gaming (**GeForce NOW**, Xbox Cloud Gaming) or a Windows dual-boot [3] |

---

## 3. What You Will Need to Redownload After Installing Linux

Make a quick checklist so you can get back to work in one afternoon:

1. **Web browsers:** Chrome/Brave/Firefox (sync extensions and bookmarks)
2. **Communication:** Discord, Telegram, Zoom, Slack, Teams PWA
3. **Development:** VS Code (extensions sync with your GitHub/Microsoft account), Git, Node.js (`nvm`), Python (usually preinstalled), Docker (optional)
4. **Engineering:** MATLAB from mathworks.com (login with your TU Dortmund license), ANSYS (via university license), FreeCAD or Onshape login
5. **Creative/media:** Blender, OBS Studio, GIMP, Inkscape, Krita, Audacity, DaVinci Resolve
6. **Gaming:** Steam, Heroic Games Launcher, Vinegar (Roblox Studio), Sober (Roblox Player)
7. **Cloud sync:** [abraunegg/onedrive](https://github.com/abraunegg/onedrive) with OneDriveGUI for your `maij.us` Microsoft 365 OneDrive
8. **Email:** Thunderbird or Evolution configured for `yrodriguez@maij.us` and your university account

> **Tip:** VS Code settings sync, browser account sync, and Steam cloud saves mean most of your personalized configuration restores automatically once you log in.

---

## 4. File-Filtering Strategy: Keep What Matters, Drop What Doesn't

### What to KEEP (copy to F:)

* **Documents:** `.docx`, `.pdf`, `.xlsx`, `.pptx`, `.md`, `.txt` — all schoolwork, MAIJ briefs, business plans, CVs, slides
* **Code & repositories:** `.py`, `.js`, `.ts`, `.lua`, `.html`, `.css`, `.json`, `.yaml`, `.git` folders — especially `C:\blu-k2-port` ("Wayfarer's Light") and any other project code
* **Creative assets:** `.png`, `.jpg`, `.svg`, `.mp4`, `.mov`, `.wav`, `.mp3`, `.psd`, `.ai`, `.blend`, `.fbx`, `.obj`, `.stl`, `.glb`
* **3D & CAD models:** `.obj`, `.fbx`, `.stl`, `.step`, `.blend`, `.glb`, `.rbxm`/`.rbxl` (Roblox models/places), `.fcstd` (FreeCAD)
* **Datasets & training data:** `.csv`, `.parquet`, `.json` datasets, ONNX/PT model files
* **Credentials & exports:** `.env` files, SSH keys (`~/.ssh`), browser bookmarks HTML export, password manager export, MFA recovery codes, license keys

### What to DELETE or LEAVE BEHIND (safe to skip — will be recreated or is useless on Linux)

* **Windows temporary files:** `%LOCALAPPDATA%\Temp`, `%TEMP%` — recreated by Windows continuously
* **Old installers in Downloads:** `.exe`, `.msi`, `.iso` files — you cannot run these on Linux anyway; you will reinstall from Linux package managers
* **Build artifacts:** `node_modules/` (run `npm install` on Linux), `.venv/` (run `python -m venv .venv`), `__pycache__/`, `dist/`, `build/`
* **Application caches:** `.cache/`, browser cache folders, `.npm/_cacache`, `.cargo`, `.nuget`
* **System leftovers:** `Thumbs.db`, `desktop.ini`, Windows Update download caches, the Recycle Bin
* **Duplicate downloads:** older versions of already-installed software installers

### Two critical warnings before copying

1. **OneDrive "Files On-Demand":** files shown with a cloud icon in Windows Explorer are *not* stored locally — they are cloud placeholders. If you copy them as-is, they will be empty. Right-click your OneDrive folder and choose **"Always keep on this device"**, then wait until the blue sync icons disappear before running the final copy.
2. **Browser data:** Linux browsers cannot read Windows browser caches. Manually export:
   * Chrome/Edge: **Bookmarks → Bookmark manager → ⋮ → Export bookmarks** (saves an HTML file)
   * Passwords: **Settings → Autofill and passwords → Password Manager → Settings → Export passwords** (CSV) — store this file securely on F:
   * MFA apps: generate one-time recovery codes for Microsoft Authenticator, Google Authenticator, etc., and write them down or save them in a secure file on F:

---

## 5. MAIJ Model-Training Asset Plan

MAIJ is an autonomous farm-to-restaurant drone delivery venture in North Carolina. Model-training assets fall into seven practical categories. The automated script will hunt these down using keyword matching (`maij`, `drone`, `farm`, `crop`, `uav`, `robot`, `simulation`, `concept`, `flight`, `payload`, `aerial`, `jetson`, `propeller`, `motor`, `hospitation`, `akg`, `commercial`, `storyboard`, `logo`, `branding`, `training`, `dataset`) across your media files and stage them into this folder structure on drive F::

```
F:\MAIJ_Model_Training_Assets\
│
├── 01_3D_and_CAD_Models/                   # Drone concepts, payloads, mechanisms (.obj, .fbx, .stl, .step, .blend, .glb, .fcstd)
├── 02_Drone_and_Simulation_Imagery/        # Aerial photos, farm shots, flight/simulation captures
├── 03_Video_Footage_and_Simulations/       # Drone footage, commercial footage, simulation recordings (.mp4, .mov, .webm)
├── 04_Audio_and_Voiceovers/                # Commercial voiceovers, narration, audio clips (.wav, .mp3, .ogg)
├── 05_Structured_Data_and_Labels/          # Flight logs, route data, datasets, annotation files (.csv, .json, .parquet)
├── 06_Branding_and_Graphics/               # Logos (SVG/PNG), storyboards, brochures, slide graphics
├── 07_Documentation_and_Text_Data/         # Mission statements, production briefs, commercial scripts, regulatory notes
├── 08_Geospatial_and_Airspace/            # NC DEMs, LiDAR, FAA charts, farm/restaurant coordinates
├── 09_Simulation_and_Hardware_Environments/ # Gazebo worlds, PX4 configs, URDFs, sensor calibrations, thrust curves
├── 10_Telemetry_and_Operations_Data/       # Flight logs, cold-chain logs, weather history, market tables
└── 11_Model_Zoo_and_Benchmarks/            # Checkpoints, recipes, ontologies, benchmark test sets
```

This structure is immediately usable for training or fine-tuning vision models (drone/crop detection), language models (MAIJ-specific knowledge), or multi-modal models (video/audio alignment for future MAIJ commercials).

---

## 6. How to Run the Automated PowerShell Script

The script `migrate-to-linux.ps1` runs on your Windows computer in PowerShell.

### Step 1 — Copy the script to your PC

Save [migrate-to-linux.ps1](/home/ubuntu/outputs/migrate-to-linux.ps1) onto your Windows computer (for example in `C:\blu-k2-port\migrate-to-linux.ps1` or your Documents folder).

### Step 2 — Run the safe audit (nothing is copied)

Open **PowerShell as Administrator** and run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
cd C:\blu-k2-port
.\migrate-to-linux.ps1 -ExternalDrive "F:" -Mode Audit
```

The script will:
* Verify external drive F: exists and shows free space
* Enumerate every installed app and classify it by Linux compatibility
* Scan your files and categorize them by type with counts and sizes
* Identify junk files and tell you how many gigabytes they waste
* Detect MAIJ model-training assets and list them by category
* Write full CSV reports plus an **`migration_audit_report.html`** you can double-click to view in your browser

### Step 3 — Review the report, then run the copy

When you are satisfied with what is going to be moved:

```powershell
.\migrate-to-linux.ps1 -ExternalDrive "F:" -Mode Copy
```

This copies MAIJ assets into the organized staging folders above and uses Robocopy to safely mirror your important documents and code to `F:\Important_Documents`, writing complete copy logs so you can verify that every file made it.

---

## 7. Pre-Migration Safety Checklist (do these BEFORE wiping Windows)

* [ ] **Backup verified:** open 10+ files directly from drive F: on your PC to confirm the copy succeeded
* [ ] **OneDrive fully downloaded:** "Always keep on this device" applied and completed
* [ ] **Browser bookmarks exported** to HTML
* [ ] **Browser passwords exported** (or already in a password manager)
* [ ] **MFA authenticator recovery codes** saved
* [ ] **SSH keys backed up:** copy `C:\Users\<you>\.ssh` to F:
* [ ] **License keys / product keys** saved (MATLAB license number, software purchases)
* [ ] **BitLocker recovery key saved:** go to *Settings → Device encryption → BitLocker recovery keys* and save the key (or disable BitLocker before shrinking partitions)
* [ ] **Roblox project code verified:** confirm the full `C:\blu-k2-port` folder (including `.git`) is on F:
* [ ] **Windows product key recorded** (optional, for reinstalling Windows later): `wmic path softwarelicensingservice get OA3xOriginalProductKey` in PowerShell
* [ ] **A 16 GB+ USB drive prepared** for the Linux installer

---

## 8. Choosing a Linux Distribution

For a mechanical-engineering and aviation-science student who also does AI work, game development, and content creation:

| Distribution | Verdict | Why |
|---|---|---|
| **Ubuntu 24.04 LTS (Noble Numbat)** | **Top recommendation** | The industry standard for robotics/ROS, Jetson development, CUDA/AI, MATLAB (officially validated [1]), and DaVinci Resolve. The largest documentation base and five years of support [9]. |
| **Linux Mint 22 (Cinnamon)** | **Top beginner recommendation** | Built on Ubuntu 24.04 LTS (supported until 2029) but with a Windows-like taskbar and start menu, making the transition nearly invisible for day-to-day use [10]. |
| **Fedora Workstation** | Strong alternative | Modern GNOME experience, cutting-edge kernel (great for newer laptop hardware), but MATLAB officially targets LTS distros. |
| **Pop!_OS** | Great if you have an NVIDIA GPU laptop | Built-in NVIDIA drivers, excellent for AI training and gaming. |

**Bottom line:** **Ubuntu 24.04 LTS** is the safest choice for your engineering and AI toolchain; **Linux Mint 22** is the friendliest if you want it to feel like Windows from day one.

---

## 9. Next Steps to Install Linux

1. Download the ISO from **ubuntu.com/download/desktop** (Ubuntu 24.04 LTS) or **linuxmint.com** (Linux Mint 22 Cinnamon).
2. Download **Rufus** (rufus.ie) on Windows and flash the ISO onto your USB drive.
3. Reboot, press your boot menu key (**F12 / F2 / Del / Esc** depending on your laptop), select the USB drive, and boot into the live environment — you can test WiFi, sound, and the display before installing anything.
4. During installation, choose:
   * **"Install alongside Windows" (dual-boot)** if you want to keep Windows available for SolidWorks, anti-cheat games, or iTunes (safest approach)
   * **"Erase disk and install"** only after the checklist in Section 7 is 100% complete
5. After install, plug in drive F:, copy your files back, and work through the redownload list in Section 3.

---

## References

[1]: https://www.mathworks.com/support/requirements/matlab-linux.html "MATLAB and Simulink Linux system requirements"
[2]: https://vinegarhq.org/Home/rol_faq.html "The Roblox on Linux Block FAQ - Vinegar"
[3]: https://roblox.fandom.com/wiki/Hyperion "Hyperion anti-cheat on Roblox"
[4]: https://www.greatmail.com/blog/email-hosting/best-linux-email-clients-2026-outlook-alternatives/ "Best Linux email clients: Outlook alternatives"
[5]: https://github.com/abraunegg/onedrive "abraunegg onedrive - OneDrive client for Linux"
[6]: https://www.onshape.com/en/blog/3dexperience-solidworks-alternative "Onshape: browser-based CAD alternative to SolidWorks"
[7]: https://yarygintech.com/articles/linux-for-creators/ "Linux for Creators: creative work on Linux"
[8]: https://www.youtube.com/watch?v=SxwCUMl3lKo "Free alternatives to Adobe software"
[9]: https://ubuntu.com/download/desktop "Ubuntu Desktop download"
[10]: https://lwn.net/Articles/981130/ "Linux Mint 22 release overview"
