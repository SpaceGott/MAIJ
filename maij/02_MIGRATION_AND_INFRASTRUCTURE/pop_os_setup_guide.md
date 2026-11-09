---
MAIJ DOCUMENT IDENTIFIER: IGD-MAIJ-IT-003
TITLE: Pop!_OS 24.04 LTS (NVIDIA) Installation and Developer-Environment Guide
CATEGORY: Migration & Infrastructure
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Installation and developer-environment guide for Pop!_OS 24.04 LTS with NVIDIA graphics — the user's chosen Linux desktop GUI — covering the NVIDIA ISO installation, driver verification, Roblox Studio through Vinegar, development toolchain, OneDrive synchronization, and the bridge to the future custom GUI project.
---

# Pop!_OS 24.04 LTS (NVIDIA) — Setup & Developer Environment Guide

This guide covers **Pop!_OS 24.04 LTS with the NVIDIA desktop** — the chosen Linux GUI environment for MAIJ development — from initial installation through the Roblox, simulation, and data-pipeline toolchain, ending with the bridge to your future custom GUI project.

---

## 1. Why Pop!_OS Fits This Mission

* **NVIDIA out of the box:** System76 ships an official ISO with NVIDIA proprietary drivers pre-bundled — no driver fighting, `nvidia-smi` works on first boot.
* **COSMIC desktop:** the new Rust-based COSMIC desktop is modern, window-tiling-friendly, and — critically — written in Rust using **libcosmic**, the exact toolkit you can later build your own GUI on top of.
* **Ubuntu 24.04 LTS base:** every package, PPA, and apt command from the Ubuntu guide works identically on Pop!_OS, so MATLAB, Gazebo, ROS 2, PyTorch, and the abraunegg OneDrive client install unchanged.
* **Flatpak-first Pop!_Shop:** single-click installs for Discord, Zoom, VS Code, Blender, OBS, and Steam.

## 2. Installation (Windows Dual-Boot)

1. Download the **Pop!_OS (NVIDIA)** ISO from **[system76.com/pop](https://system76.com/pop)** — select the *NVIDIA* version so drivers are included (≈ 6 GB).
2. Write the ISO to a 16 GB+ USB with **Rufus** (GPT / UEFI / default settings).
3. On Windows, shrink the C: partition by at least **80–120 GB** in Disk Management (leaving it as unallocated free space).
4. Reboot, tap your boot-menu key (F12 on Lenovo/Dell, F9 on HP, Esc on ASUS), pick the USB, and follow the installer.
5. In the installer choose **"Clean install"** only if Windows is fully backed up and you are wiping it, or choose **"Custom (Advanced)"** / alongside Windows to dual-boot. Create an EFI partition, a swap partition (8 GB), and the root partition `/` (ext4) in the unallocated space.
6. Complete the setup wizard, remove the USB, and restart.

## 3. First-Boot Verification

Open the terminal (`Super + T`) and run:

```bash
# 1. NVIDIA driver verification
nvidia-smi

# 2. Full system update
sudo apt update && sudo apt full-upgrade -y

# 3. Flatpak refresh
flatpak update -y
```

If `nvidia-smi` displays your GPU name, driver version, and CUDA version, you are fully set. If you need a specific driver branch, Pop!_OS manages it through **Settings → Desktop → General** or `sudo apt install system76-driver-nvidia`.

## 4. Roblox on Linux: the Exact Reality

| Roblox Component | Linux Status | How |
|---|---|---|
| **Roblox Studio** (create games, write Lua, publish places) | **Working** | Install **Vinegar** via Flatpak: `flatpak install -y flathub io.github.vinegarhq.Vinegar` then launch *Vinegar* and install Studio inside it |
| **Roblox Player** (play live games) | **Blocked** | Byfron/Hyperion anti-cheat does not support Linux as of 2026; play via cloud gaming (GeForce NOW) or keep Windows for playtests |
| **Roblox web site, developer hub, docs** | **Native** | Any Linux browser |
| **`blu-k2-port` repository & Rojo workflow** | **Native** | Git + rojo + vscode + Lua LSP all run natively on Linux |

**Bottom line for MAIJ:** you can build and publish all four games of the [MAIJ Micro-Term Roadmap](maij_microterm_roadmap.md) entirely on Pop!_OS through Roblox Studio inside Vinegar, with the full Lua toolchain native. For live multiplayer playtests, use cloud gaming or dual-boot into Windows.

## 5. MAIJ Developer Toolchain (One-Command Install)

```bash
sudo apt install -y git curl wget build-essential pkg-config libssl-dev \
  python3-pip python3-venv ffmpeg vlc gimp inkscape krita audacity obs-studio blender

# VS Code (official Microsoft repository)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install -y code
rm -f packages.microsoft.gpg

# OneDrive sync for your maij.us tenant
sudo add-apt-repository -y ppa:abraunegg/onedrive && sudo apt update
sudo apt install -y onedrive
onedrive  # opens Microsoft login URL in browser on first run
```

Additional tools from the **Pop!_Shop (Flatpak)**: Discord, Zoom, Steam, Heroic Games Launcher, Spotify.

## 6. Robotics & Simulation Stack (for Categories 08–10)

* **MATLAB / Simulink:** download the Linux installer from your MathWorks account (`mathworks.com`); MATLAB natively supports Ubuntu/Pop!_OS 24.04 LTS.
* **ROS 2:** install ROS 2 *Jazzy Jalisco* (the Ubuntu 24.04 LTS release) following `docs.ros.org` for drone-autonomy packages in the future.
* **Gazebo:** Harmonic or Ionic simulation environments run natively for the Phase 2/4 simulation track.
* **PyTorch + CUDA:** `pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121` uses your NVIDIA GPU out of the box.

## 7. Importing Your Backup

Plug in drive F:. It mounts at `/media/<user>/...`. Suggested local layout:

```
~/maij/               <- copy of the repository
~/MAIJ_Data/          <- symlink or copy of F:\MAIJ_Model_Training_Assets
~/documents/backup/   <- copy of F:\Important_Documents
```

## 8. Bridge to Your Future Custom GUI

The decision to treat Pop!_OS's COSMIC desktop as a **starting point** and build your own GUI in the future is architecturally sound. See the companion document [Future Custom GUI Roadmap](custom_gui_roadmap.md) for technology selection (libcosmic/iced vs. GTK4 vs. Tauri), milestone sequencing, and the plan to gradually absorb MAIJ operations dashboards into your own desktop shell.
