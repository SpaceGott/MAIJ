---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-IT-001
TITLE: Pre-Migration File-Filtering and Cleanup Strategy
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: File-hygiene plan defining KEEP and SKIP rules, OneDrive On-Demand and browser-data cautions, and the eleven-category target layout on external drive F: so only necessary files survive the migration.
---

# File-Filtering and Cleanup Strategy

A practical, rules-based guide for migrating from Windows to Linux with the **least amount of loss** while **removing unused items**.

---

## 1. The Strategy in One Picture

Your data lives on a continuum from *irreplaceable* to *worthless junk*. The goal is simple: copy everything on the left, leave everything on the right.

| Priority | Category | Examples | Action |
|---|---|---|---|
| **P0 — Irreplaceable** | Personal & business documents | Schoolwork, MAIJ briefs, business plans, CVs, slides, tax/ID scans | Copy 100% |
| **P0 — Irreplaceable** | Code & repositories | `C:\blu-k2-port`, side projects, scripts, notebooks | Copy source + git history |
| **P0 — Irreplaceable** | Creative & training assets | Photos, video, audio, 3D models, datasets, logos | Copy original quality |
| **P0 — Irreplaceable** | Credentials & exports | `.env` files, SSH keys, browser exports, MFA codes | Copy securely |
| **P1 — Recreatable but painful** | Project dependencies | `node_modules/`, `.venv/`, cargo/cache dirs | **Skip** — re-install on Linux |
| **P2 — Truly useless on Linux** | Windows binaries | `.exe`, `.msi`, `.iso`, `Thumbs.db`, `.tmp` | **Skip** |
| **P2 — Truly useless on Linux** | OS caches & temp | `%TEMP%`, `%LOCALAPPDATA%\Temp`, browser cache | **Skip** |

---

## 2. The KEEP List (included in the curated backup)

* **Documents:** `.docx`, `.doc`, `.pdf`, `.xlsx`, `.xls`, `.csv`, `.pptx`, `.ppt`, `.odt`, `.ods`, `.odp`, `.txt`, `.md`, `.rtf`, `.epub`
* **Code & developer files:** `.py`, `.js`, `.ts`, `.jsx`, `.tsx`, `.html`, `.css`, `.scss`, `.json`, `.yaml`, `.yml`, `.xml`, `.sql`, `.sh`, `.ps1`, `.bat`, `.lua`, `.cpp`, `.c`, `.h`, `.hpp`, `.cs`, `.java`, `.go`, `.rs`, `.rb`, `.php`
* **Images:** `.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.webp`, `.tiff`, `.svg`, `.ico`, `.raw`, `.cr2`, `.nef`, `.dng`, `.psd`, `.ai`, `.eps`, `.xcf`, `.kra`
* **Video:** `.mp4`, `.mov`, `.avi`, `.mkv`, `.wmv`, `.webm`, `.flv`, `.m4v`
* **Audio:** `.mp3`, `.wav`, `.flac`, `.aac`, `.ogg`, `.m4a`, `.mid`, `.aup3`
* **3D & CAD:** `.obj`, `.fbx`, `.stl`, `.step`, `.stp`, `.iges`, `.dwg`, `.dxf`, `.blend`, `.glb`, `.gltf`, `.dae`, `.sldprt`, `.sldasm`, `.iam`, `.ipt`, `.fcstd`, `.rbxm`, `.rbxl`
* **Datasets & model weights:** `.parquet`, `.feather`, `.h5`, `.hdf5`, `.pkl`, `.npy`, `.npz`, `.onnx`, `.pt`, `.pth`, `.safetensors`, `.bin`, `.tflite`, `.gguf`
* **Archives:** `.zip`, `.rar`, `.7z`, `.tar`, `.gz`, `.bz2` (contain personal files)

---

## 3. The SKIP List (excluded by the script)

* **Windows temporary folders:** `%TEMP%`, `%LOCALAPPDATA%\Temp`, `%USERPROFILE%\AppData\Local\Temp`
* **Installer packages:** `.exe`, `.msi`, `.iso`, `.img` — they are Windows-only and can be re-downloaded
* **Old installers in Downloads:** installers older than 60 days are flagged in `junk_old_installers.csv`
* **Dependency trees:** every `node_modules` folder (recreate via `npm/pnpm/yarn install` on Linux), every Python virtual environment (`.venv`, `venv`, `env` — recreate via `python -m venv`), build outputs (`dist/`, `build/`, `bin/`, `obj/`, `__pycache__/`)
* **Package manager caches:** `.npm`, `.pnpm-store`, `.cache`, `.cargo`, `.gradle`, `.m2`, `.nuget`
* **OS artifacts:** `Thumbs.db`, `desktop.ini`, `~$*.docx` temporary lock files, the Recycle Bin (`$RECYCLE.BIN`)
* **Browser caches:** Linux browsers will not reuse them; the script skips them automatically

---

## 4. Special Cases That Require Your Attention

### 4.1 OneDrive "Files On-Demand" (highest risk)

Files shown with a cloud icon in Windows Explorer are placeholders, not real files. Copying them produces empty shells.

1. Open File Explorer and go to your OneDrive folder (for `maij.us` or personal)
2. Right-click the folder → choose **"Always keep on this device"**
3. Wait until the blue sync icon on every sub-folder disappears
4. Only then run the final copy step

### 4.2 Browser Data

* **Bookmarks:** *Chrome/Edge → ⋮ → Bookmarks → Bookmark manager → ⋮ → Export bookmarks* → save the HTML file
* **Passwords:** *Settings → Autofill → Password Manager → Settings → Export passwords* → save the CSV securely on F: (or rely on Bitwarden/1Password if you use one)
* **History:** you do not need it; browsing history is rebuilt quickly
* **Extensions:** let them reinstall via your Google/Microsoft account sign-in on Linux

### 4.3 MFA / Authenticator Apps

* If you use Microsoft Authenticator or Google Authenticator on your phone, **do not uninstall it**; MFA is independent of your laptop
* For extra safety, open *maij.us* account security (Microsoft 365) and university account security, generate **one-time recovery codes**, and write them down or save them in a secure file on F:

### 4.4 Your Roblox Project (`C:\blu-k2-port`)

* This repo contains irreversible work for "Wayfarer's Light"
* The script copies the entire repository including the `.git` folder (commit history is preserved) while skipping huge build artifacts
* Before wiping Windows, push your latest commits to GitHub and verify `git log` on F: matches your working repo

### 4.5 `.env` and Config Files

* `.env` files in project folders are copied automatically
* Copy `C:\Users\<you>\.ssh` (SSH keys for GitHub and servers) manually or let the script include it

---

## 5. What the Result Looks Like on Drive F:

After running `.\migrate-to-linux.ps1 -Mode Copy`, your drive will contain:

```
F:\MigrationBackup_YYYYMMDD_HHMMSS\
│
├── Important_Documents/          # Curated documents, code, images, audio, CAD
│   ├── <YourUserName>/           # Mirror of your user folder (Documents, Desktop, etc.)
│   └── blu-k2-port/              # Mirror of the game project repo
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
│   ├── maij_training_assets_detected.csv
│   └── maij_assets_copy_log.csv
│
├── README_FIRST.txt              # What's on this drive + pre-wipe checklist
└── migration_audit_report.html   # Open in your browser to review everything
```

---

## 6. Verification Before You Wipe

Never trust a copy until you have tested it:

1. **Spot-check:** open 10+ files directly from F: — including a large video, a `.docx`, a `.blend` or CAD file, and a `.py` script
2. **Count-check:** `F:\audit_reports\maij_assets_copy_log.csv` — confirm all rows say `OK`
3. **Log-check:** `F:\audit_reports\robocopy_*.log` — the summary section at the bottom should show `Failed: 0`
4. **OneDrive-check:** confirm no OneDrive files on F: are 0-byte placeholders
5. **Git-check:** open the copied `blu-k2-port` folder on F: in a terminal and run `git status` — it should be a valid repo

Only after all five checks pass should you proceed to install Linux.
