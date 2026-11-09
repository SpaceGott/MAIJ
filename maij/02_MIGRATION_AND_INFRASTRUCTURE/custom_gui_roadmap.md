---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-UI-001
TITLE: Future Custom GUI Architecture Roadmap
CATEGORY: Migration & Infrastructure
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Architecture roadmap for building MAIJ's future proprietary desktop GUI — from a Pop!_OS COSMIC starting point, through a Tauri/libcosmic operations dashboard, to a full flight-operations workstation shell — with a technology selection matrix and phased milestones.
---

# Future Custom GUI — Architecture Roadmap

This roadmap defines the path from the current **Pop!_OS COSMIC** starting point to a **bespoke MAIJ operations GUI** — the custom workstation interface that will eventually control mission planning, fleet dispatch, cold-chain telemetry, customer ordering, and economy simulations from one purpose-built environment.

---

## 1. Vision and Requirements

The MAIJ custom GUI is not a generic desktop shell; it is an **operations workstation** with these requirements:

| # | Requirement | Source |
|---|---|---|
| R1 | Live drone/fleet map with NC hub network (hubs in their respective towns, per the route simulator) | Categories 05, 08 |
| R2 | Real-time cold-chain telemetry panel (logger feeds, excursion alerts per SOP-MAIJ-CC-001) | Category 10 |
| R3 | Interactive rate engine (editable coefficients, sourced-vs-assumed provenance tags) | Formula toolkit |
| R4 | Costlo economy simulator dashboards (play-session telemetry, price experiments) | Category 10 |
| R5 | Language-learning AI-usage-ratio research dashboard | Phase 1 telemetry |
| R6 | Offline-first, keyboard-driven, dual-monitor workflow on NVIDIA GPU | Founder workflow |
| R7 | Hackable and extensible — Rust-based preferred to match COSMIC | Long-term ownership |

## 2. Technology Selection Matrix

| Toolkit | Language | Best For | Risk | Recommendation |
|---|---|---|---|---|
| **libcosmic / iced** | Rust | Native COSMIC applets; memory-safe; full desktop integration | Smaller ecosystem | **Primary choice** — builds directly on Pop!_OS's stack |
| **Tauri + web (Svelte/React)** | JS/TS + Rust | Fastest MVP dashboards; reuse web UI skills | Web-view performance ceiling | **Phase 1 MVP choice** |
| **GTK4 / Libadwaita** | Rust/C/Python | Polished Linux-native apps; huge widget set | Gnome-centric style | Strong alternative |
| **Qt6** | C++ / Python | Industry-grade for aerospace & MATLAB interop | Heavy, licensing nuance | Phase 3 flight-ops |
| **Custom wayland compositor (smithay/COSMIC)** | Rust | Fully bespoke window manager | Enormous scope | Phase 2+ only |

## 3. Phased Roadmap

### Phase 0 — Learn and Prototype on COSMIC (Q4 2026 – Q2 2027)

* Use Pop!_OS COSMIC daily; customize keybindings, applets, and tiling.
* Build a tiny **Tauri + Svelte** MVP of the MAIJ Dashboard (hubs map + rate-formula playground), consuming `05_Structured_Data_and_Labels` and the Python rate engine.
* Ship the MVP as a flatpak-able app you run every day — this validates both the GUI stack and the data pipeline.

### Phase 1 — MAIJ Operations Dashboard v1 (Q3–Q4 2027)

* After returning from the CBYX fellowship in June 2027, rewrite the MVP on **libcosmic / iced** as a native desktop application.
* Features: live NC hub map, cold-chain telemetry ingestion from Category 10, rate-formula workbench with saveable scenario files, and the Costlo economy dashboard.
* Distribute as a flatpak to any MAIJ workstation.

### Phase 2 — Custom Shell Extension Layer (2028)

* Extend the COSMIC desktop with custom panels, applets, and window-management rules (using COSMIC's open Rust codebase).
* The desktop itself becomes MAIJ-branded: a mission-control status bar, quick-dispatch panel, and simulation launcher integrated into the desktop shell rather than as separate windows.

### Phase 3 — Full Flight-Operations Workstation (2029+, Part 135 timeline)

* Certified dispatch workstation for commercial operations under FAA Part 135/108: mission planning, BVLOS link monitoring, airspace displays, and voice-comm channels.
* Qt6/native stack for aerospace-grade assurance and dual-monitor dispatch screens.
* Only start Phase 3 after FAA regulatory paperwork is in progress.

## 4. Immediate Next Steps (Tonight / This Week)

1. Boot Pop!_OS 24.04 LTS (NVIDIA) and confirm `nvidia-smi` works.
2. Install **Rust** (`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`) and **Tauri** CLI for the Phase 0 dashboard MVP.
3. Keep the GUI repository inside this repo under `maij/02_MIGRATION_AND_INFRASTRUCTURE/` or as a submodule once started.

## 5. Related Documents

* [Pop!_OS Setup Guide](pop_os_setup_guide.md) — install and toolchain
* [Cold-Chain SOP](00_REGULATORY_FRAMEWORK/maij_cold_chain_sop.md) — requirements source for R2
* [MAIJ Micro-Term Roadmap](01_STRATEGY_AND_ROADMAPS/maij_microterm_roadmap.md) — data sources for R1, R4, R5
* [Rate-Formula Toolkit](03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture/references/rate-formula-toolkit.md) — requirements source for R3
