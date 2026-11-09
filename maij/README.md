---
MAIJ DOCUMENT IDENTIFIER: MAN-MAIJ-OPS-001
TITLE: MAIJ Operations Manual — Master Index & Administrator Guide
CATEGORY: Operations Manual
EFFECTIVE DATE: 2026-11-09
VERSION: 1.1 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: The FAA-manual-style master document of the MAIJ venture repository: purpose and scope, organizational structure, complete document index with summaries and identifiers, a new-administrator quick-start, compliance status, and the quarterly review cycle aligned with the CBYX calendar and FAA regulatory updates.
---

# MAIJ Operations Manual

**Document:** MAN-MAIJ-OPS-001 · **Version:** 1.1 (Draft) · **Effective Date:** 9 November 2026
**Organization:** MAIJ (autonomous drone freight — small NC farms to NC restaurants)
**Repository:** `https://github.com/SpaceGott/MAIJ` — folder `maij/`
**Classification:** Internal working documents — FAA-style structure

---

## 1. Purpose and Scope

This manual is the single entry point for any **administrator** joining the MAIJ documentation repository. It aggregates, indexes, and summarizes every document generated during the November 2026 planning and migration sessions into four operational categories. The structure deliberately mirrors the style of FAA orders and manuals (document identifiers, effective dates, versions, status, summaries) so the organization's documentation discipline matches the aviation-grade standards its mission will eventually require.

**Scope:** autonomous drone freight planning, Roblox-based simulation development, data strategy and training-asset management, Windows-to-Linux IT infrastructure, and founder life-calendar integration.

## 2. Organization of This Manual

| Folder | Code | Content |
|---|---|---|
| `00_REGULATORY_FRAMEWORK/` | REG | Cold-chain SOP, entity formation, risk/gap register |
| `01_STRATEGY_AND_ROADMAPS/` | STR | Micro-term roadmap, asset inventory plan, file-hygiene strategy |
| `02_MIGRATION_AND_INFRASTRUCTURE/` | INF | Migration guide, Ubuntu/Pop!_OS guides, custom GUI roadmap, PowerShell tool |
| `03_SKILLS_AND_AUTOMATION/` | AUT | Unified Roblox game-architecture skill, references, templates, validator |
| `04_SUMMARIES_AND_REGISTERS/` | SUM | Master document register and changelog |

## 3. Quick-Start for the New Administrator

If you have **15 minutes**: read this README, then the [Document Register](04_SUMMARIES_AND_REGISTERS/DOCUMENT_REGISTER.md).
If you have **1 hour**: also read [PLN-MAIJ-STR-001 (Roadmap)](01_STRATEGY_AND_ROADMAPS/maij_microterm_roadmap.md), [GAP-MAIJ-2026-001 (Gap Register)](00_REGULATORY_FRAMEWORK/maij_one_year_overlooked_audit.md), and [AD-MAIJ-BUS-001 (Entity Guide)](00_REGULATORY_FRAMEWORK/maij_entity_formation_guide.md).
If you are **setting up a workstation**: follow [IGD-MAIJ-IT-003 (Pop!_OS Setup)](02_MIGRATION_AND_INFRASTRUCTURE/pop_os_setup_guide.md).

## 4. Master Document Index

| ID | Title | Summary | File |
|---|---|---|---|
| **SOP-MAIJ-CC-001** | Cold-Chain SOP | Temperature control and documentation for inspected meat & produce in drone transport | [link](00_REGULATORY_FRAMEWORK/maij_cold_chain_sop.md) |
| **AD-MAIJ-BUS-001** | NC Entity Formation Guide | Formation checklist for MAIJ LLC, EIN, banking, insurance, wordmark | [link](00_REGULATORY_FRAMEWORK/maij_entity_formation_guide.md) |
| **GAP-MAIJ-2026-001** | One-Year Gap Register | Ten untouched areas with severity, owner, quarter, and first deliverable | [link](00_REGULATORY_FRAMEWORK/maij_one_year_overlooked_audit.md) |
| **PLN-MAIJ-STR-001** | Micro-Term Roadmap | 24-week plan from language game to Costlo simulator | [link](01_STRATEGY_AND_ROADMAPS/maij_microterm_roadmap.md) |
| **PLN-MAIJ-DATA-001** | Asset Inventory Plan | 11-category training-asset taxonomy and data strategy | [link](01_STRATEGY_AND_ROADMAPS/maij_training_asset_inventory_plan.md) |
| **PLN-MAIJ-IT-001** | File-Filtering Strategy | KEEP/SKIP rules and drive F: staging layout | [link](01_STRATEGY_AND_ROADMAPS/file_filtering_and_cleanup_strategy.md) |
| **IGD-MAIJ-IT-001** | Migration Guide | 30+ application classes audited for Linux; redownload list | [link](02_MIGRATION_AND_INFRASTRUCTURE/windows_to_linux_migration_guide.md) |
| **IGD-MAIJ-IT-002** | Ubuntu Dual-Boot Guide | Rufus USB, partitions, safe alongside-Windows install | [link](02_MIGRATION_AND_INFRASTRUCTURE/ubuntu_installation_guide.md) |
| **IGD-MAIJ-IT-003** | Pop!_OS (NVIDIA) Setup | Chosen GUI: NVIDIA ISO, Vinegar/Studio, toolchain | [link](02_MIGRATION_AND_INFRASTRUCTURE/pop_os_setup_guide.md) |
| **PLN-MAIJ-UI-001** | Custom GUI Roadmap | Tauri MVP → libcosmic workstation → flight-ops shell | [link](02_MIGRATION_AND_INFRASTRUCTURE/custom_gui_roadmap.md) |
| **TOOL-MAIJ-IT-001** | Migration Script | PowerShell audit and safe copy to drive F: | [link](02_MIGRATION_AND_INFRASTRUCTURE/migrate-to-linux.ps1) |
| **SKL-MAIJ-001** | Roblox Skill | Reusable unification skill with cadence playbook and verified founder context | [link](03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture/SKILL.md) |
| **REG-MAIJ-DOC-001** | Document Register | Full metadata for every document | [link](04_SUMMARIES_AND_REGISTERS/DOCUMENT_REGISTER.md) |
| **CHG-MAIJ-001** | Changelog | Revision history | [link](04_SUMMARIES_AND_REGISTERS/CHANGELOG.md) |

## 5. Compliance and Status Summary

* **All documents at Version 1.0–1.1 (Draft)** — suitable for internal operations; formal sign-off after the Q1 2027 entity formation.
* **Skill SKL-MAIJ-001 is VALIDATED (v1.1)** under the official skill-creator test suite with the full founder context corpus.
* **Tool TOOL-MAIJ-IT-001 is fixed and verified** (encoding, parser, HTML generation).
* **Next scheduled review:** February 2027 (end of CBYX fall term).

## 6. How This Folder Relates to the Parent Repository

This repository (`SpaceGott/MAIJ`) is a fork of NVIDIA's `xr-ai` project. Everything MAIJ-specific lives exclusively inside this `maij/` folder; the NVIDIA codebase at the root is untouched and remains available as reference infrastructure for future GPU-accelerated agent services.
