---
MAIJ DOCUMENT IDENTIFIER: IGD-MAIJ-IT-002
TITLE: Ubuntu 24.04 LTS Installation Guide (Windows Dual-Boot)
CATEGORY: Migration & Infrastructure
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Step-by-step installation guide covering bootable-USB creation with Rufus, vendor boot-menu keys, UEFI settings, partition shrinking, the "Install alongside Windows" procedure, and the first-boot package checklist.
---

# Ubuntu 24.04 LTS Installation Guide (Windows Dual-Boot)

The safest, fastest way to install **Ubuntu 24.04 LTS (Noble Numbat)** alongside your existing Windows — so nothing is erased and Windows remains available for SolidWorks, anti-cheat games, or iTunes.

---

## 1. Preparation Checklist (5 minutes, on Windows)

* [ ] External drive F: has a verified backup from `migrate-to-linux.ps1 -Mode Copy`
* [ ] OneDrive folder is fully downloaded ("Always keep on this device")
* [ ] Browser bookmarks exported to HTML; passwords exported
* [ ] BitLocker recovery key saved (Settings → Device encryption)
* [ ] A **16 GB+ USB flash drive** (will be erased)
* [ ] Laptop plugged into power, connected to Wi-Fi

## 2. Create the Bootable USB (10 minutes)

1. Download the **Ubuntu 24.04 LTS Desktop ISO** from **[ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)** (≈ 5–6 GB).
2. Download **Rufus** (portable) from **[rufus.ie](https://rufus.ie)** — no install needed.
3. Insert the USB drive; open Rufus; select your USB under *Device*; click *SELECT* and pick the downloaded Ubuntu ISO.
4. Leave settings at defaults (Partition scheme: **GPT**, Target system: **UEFI**), click **START**; choose **Write in ISO Image mode** if prompted. Rufus will erase the USB and write the installer (≈ 5–8 minutes).

## 3. Shrink Windows Partition for Ubuntu (5 minutes, still on Windows)

1. Press `Win + X` → open **Disk Management**.
2. Right-click your main **C:** partition → **Shrink Volume**.
3. Enter at least **60,000 MB (60 GB)** for Ubuntu — 100,000 MB (100 GB) is better if you plan ROS 2, Gazebo, and PyTorch datasets.
4. Click **Shrink**. The freed space will appear as *Unallocated*. Leave it unallocated — the Ubuntu installer will find it automatically.

## 4. Boot from the USB

1. Leave the USB inserted; restart Windows.
2. Immediately tap your laptop's **boot menu key** repeatedly until the menu appears:

| Laptop Brand | Boot Menu Key |
|---|---|
| Dell | **F12** |
| HP | **F9** (or Esc then F9) |
| Lenovo | **F12** (or the small Novo button) |
| Acer | **F12** (enable in BIOS F2 first) |
| ASUS | **Esc** or **F8** |
| Surface | Hold **Volume Down**, press Power |

3. Select the USB entry (e.g., *UEFI: Sandisk...*).
4. Choose **"Try or Install Ubuntu"** from the GRUB menu.

*(If the laptop boots into Windows instead: disable **Fast Startup** — Win+R → `control powercfg.cpl,,3` → uncheck "Turn on fast startup" — then retry; or hold Shift while clicking Windows Restart → Troubleshoot → Advanced → UEFI Firmware Settings → move USB to top of boot order.)*

## 5. The Installation (15 minutes)

1. Select language and keyboard layout; connect to Wi-Fi.
2. Choose **Normal installation** + check **Install third-party software for graphics and Wi-Fi hardware** (critical for NVIDIA GPUs).
3. **Installation type — pick CAREFULLY:**
   * **Recommended:** **"Install Ubuntu alongside Windows Boot Manager"** — Ubuntu automatically uses the unallocated space; Windows is untouched.
   * *Do NOT pick "Erase disk and install Ubuntu"* unless you have decided to wipe Windows entirely and the verification checklist is 100% complete.
4. Choose your timezone (e.g., *Europe/Berlin* for your current German base).
5. Set your username and password, then click **Install**.
6. When finished, click **Restart Now**, remove the USB when prompted, and press Enter.

## 6. First Boot Checklist (10 minutes)

* [ ] At the GRUB menu you now see both **Ubuntu** and **Windows Boot Manager** — dual-boot works
* [ ] Boot into Ubuntu; complete the welcome wizard
* [ ] Open terminal (`Ctrl + Alt + T`) and run the full update:
  ```bash
  sudo apt update && sudo apt full-upgrade -y
  ```
* [ ] If you have an NVIDIA GPU, check the driver:
  ```bash
  ubuntu-drivers devices
  # install the recommended driver, e.g.:
  sudo apt install -y nvidia-driver-535   # (version shown as recommended)
  ```
* [ ] Install the essentials with one command:
  ```bash
  sudo apt install -y git curl wget build-essential python3-pip python3-venv ffmpeg \
    vlc gimp inkscape krita audacity obs-studio blender virtualbox
  ```
* [ ] Plug in drive F: — Ubuntu mounts it automatically under `/media/<youruser>/...`; copy your `Important_Documents` and the MAIJ 11-category folders wherever you want them.
* [ ] Install VS Code, Discord, Zoom, MATLAB (via mathworks.com installer), Steam, and Heroic Games Launcher from the Ubuntu App Center or their official `.deb` downloads.
* [ ] Install the OneDrive client for your `maij.us` sync:
  ```bash
  sudo add-apt-repository -y ppa:abraunegg/onedrive && sudo apt update
  sudo apt install -y onedrive
  onedrive  # first run opens the Microsoft login URL in your browser
  ```

## 7. Safety Nets

* **Bootloader restored?** If an update ever hides Windows from the GRUB menu: `sudo update-grub` restores it in 10 seconds.
* **Going back?** You can remove Ubuntu later by deleting its partitions in Windows Disk Management and restoring the Windows bootloader — no risk to your Windows installation.
