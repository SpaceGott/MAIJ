---
MAIJ DOCUMENT IDENTIFIER: REG-MAIJ-DOC-001
TITLE: MAIJ Master Document Register
CATEGORY: Summaries & Registers
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: The authoritative master index of every document in the MAIJ repository, modeled on FAA order and manual registers, providing for each document its identifier, title, category, version, status, owner, location, and a new-administrator summary.
---

# MAIJ Master Document Register

**Repository:** `SpaceGott/MAIJ` — folder `maij/`
**Classification:** Draft — internal working documents
**Review cycle:** quarterly, aligned with the CBYX calendar and FAA regulatory updates

This register is the first document a **new administrator** should read. It indexes every file generated for the MAIJ venture during the November 2026 planning and migration sessions. Documents follow an FAA-style identifier convention: **SOP** (standard operating procedure), **AD** (administrative directive), **GAP** (gap/risk register), **PLN** (plan), **IGD** (installation guide), **TOOL** (executable tool), **SKL** (reusable skill), **REG** (register), **MAN** (manual), **CHG** (changelog).

---

## Document Index

| Identifier | Title | Category | Version | Status | Location |
|---|---|---|---|---|---|
| SOP-MAIJ-CC-001 | Cold-Chain Standard Operating Procedure | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_cold_chain_sop.md` |
| AD-MAIJ-BUS-001 | NC Entity Formation & Business Foundations Guide | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_entity_formation_guide.md` |
| GAP-MAIJ-2026-001 | One-Year Overlooked-Items & Risk Register | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_one_year_overlooked_audit.md` |
| PLN-MAIJ-STR-001 | Micro-Term Roadmap: Language Game → Costlo | Strategy & Roadmaps | 1.0 | DRAFT | `01_STRATEGY_AND_ROADMAPS/maij_microterm_roadmap.md` |
| PLN-MAIJ-DATA-001 | Asset Inventory Plan & Data Strategy | Strategy & Roadmaps | 1.0 | DRAFT | `01_STRATEGY_AND_ROADMAPS/maij_training_asset_inventory_plan.md` |
| PLN-MAIJ-IT-001 | File-Filtering & Cleanup Strategy | Strategy & Roadmaps | 1.0 | DRAFT | `01_STRATEGY_AND_ROADMAPS/file_filtering_and_cleanup_strategy.md` |
| IGD-MAIJ-IT-001 | Windows-to-Linux Migration Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/windows_to_linux_migration_guide.md` |
| IGD-MAIJ-IT-002 | Ubuntu 24.04 LTS Dual-Boot Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/ubuntu_installation_guide.md` |
| IGD-MAIJ-IT-003 | Pop!_OS 24.04 LTS (NVIDIA) Setup Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/pop_os_setup_guide.md` |
| PLN-MAIJ-UI-001 | Future Custom GUI Roadmap | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/custom_gui_roadmap.md` |
| TOOL-MAIJ-IT-001 | Migration Audit & Backup Script (PowerShell) | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/migrate-to-linux.ps1` |
| SKL-MAIJ-001 | Unified Roblox Game Architecture Skill | Skills & Automation | 1.0 | VALIDATED | `03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture/` |
| SKL-MAIJ-001-A | Skill Package Archive | Skills & Automation | 1.0 | VALIDATED | `03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture.skill` |
| REG-MAIJ-DOC-001 | Master Document Register (this document) | Summaries & Registers | 1.0 | DRAFT | `04_SUMMARIES_AND_REGISTERS/DOCUMENT_REGISTER.md` |
| CHG-MAIJ-001 | Changelog | Summaries & Registers | 1.0 | DRAFT | `04_SUMMARIES_AND_REGISTERS/CHANGELOG.md` |
| MAN-MAIJ-OPS-001 | MAIJ Operations Manual | — | 1.0 | DRAFT | `README.md` |

---

## Document Summaries (for the New Administrator)

### SOP-MAIJ-CC-001 — Cold-Chain Standard Operating Procedure
**Summary:** Governs temperature control for perishable food and inspected meat in autonomous drone transport: required temperatures by product class (meat 33–40 °F, TCS produce 33–41 °F, whole produce 45–55 °F), pre-flight gel-pack cooling, continuous digital data-logging, 60-minute maximum flight budgets, delivery-acceptance signatures retained three years, and daily sanitization logs — designed to satisfy NC Department of Agriculture meat-inspection and county health-department oversight.

### AD-MAIJ-BUS-001 — NC Entity Formation & Business Foundations Guide
**Summary:** The administrative path to forming MAIJ as a North Carolina single-member LLC: name-availability check, registered agent (usable while based in Germany), $125 online filing, free IRS EIN, single-member operating agreement, business banking, insurance quotation request (send Q1 2027), MAIJ wordmark filing ($75/class), and the recommendation to base the venture in the Raleigh/Durham/Greensboro corridor when the CBYX fellowship ends in June 2027.

### GAP-MAIJ-2026-001 — One-Year Overlooked-Items & Risk Register
**Summary:** Prioritizes ten areas the simulation-centric plan currently leaves untouched: physical hardware procurement, FAA filing clocks (Part 108/107/135), cold-chain compliance, "Costlo" trademark risk, the June 2027 CBYX transition, player-data governance, entity/banking/insurance foundations, sim-to-real transfer validation, solo-scope discipline, and school outreach — each with severity, owner, target quarter, and first deliverable.

### PLN-MAIJ-STR-001 — Micro-Term Roadmap: Language Game → Costlo
**Summary:** A 24-week phased plan sequencing a language-learning mechanic, a North Carolina food-delivery route simulator, rate-model mathematics, and the unified Costlo warehouse simulator, with data contracts between modules and a decision matrix between micro-to-macro and macro-to-micro build orders.

### PLN-MAIJ-DATA-001 — Asset Inventory Plan & Data Strategy
**Summary:** Establishes the eleven-category training-asset taxonomy (`01_3D_and_CAD_Models` through `11_Model_Zoo_and_Benchmarks`), performs an honest short-term and long-term gap analysis against the mission, and defines milestone data priorities so every game module produces datasets that feed the next.

### PLN-MAIJ-IT-001 — File-Filtering & Cleanup Strategy
**Summary:** Defines KEEP and SKIP rules so only necessary files survive the migration, cautions on OneDrive On-Demand placeholders and browser-data export, and maps the eleven-category target layout on external drive F:.

### IGD-MAIJ-IT-001 — Windows-to-Linux Migration Guide
**Summary:** Audits 30+ installed-application classes for Linux compatibility (native, Wine, web, or Windows-only), lists re-download sources and alternatives, provides a pre-migration safety checklist, and recommends Ubuntu 24.04 LTS or Pop!_OS 24.04 LTS for Windows switchers.

### IGD-MAIJ-IT-002 — Ubuntu 24.04 LTS Dual-Boot Guide
**Summary:** Step-by-step installation with Rufus bootable USB, vendor boot keys, partition shrinking, the safe "Install alongside Windows" procedure, and the first-boot package checklist.

### IGD-MAIJ-IT-003 — Pop!_OS 24.04 LTS (NVIDIA) Setup Guide
**Summary:** Dedicated guide for the user's chosen Linux GUI: NVIDIA ISO installation, driver verification, Roblox Studio through Vinegar (with the Roblox Player/Byfron limitation clearly stated), developer toolchain, and the bridge to the custom GUI project.

### PLN-MAIJ-UI-001 — Future Custom GUI Roadmap
**Summary:** Architectural roadmap from the Pop!_OS COSMIC starting point through a Tauri MVP dashboard to a native libcosmic operations workstation and eventually a full flight-operations shell, with a technology selection matrix.

### TOOL-MAIJ-IT-001 — Migration Audit & Backup Script (`migrate-to-linux.ps1`)
**Summary:** Automated PowerShell script that inventories installed apps with Linux compatibility tagging, categorizes user files, detects junk, stages MAIJ assets into the eleven categories on drive F:, and safely copies curated documents with Robocopy verification — all pure-ASCII, UTF-8-BOM, CRLF-safe for Windows PowerShell 5.1 and 7.

### SKL-MAIJ-001 — Unified Roblox Game Architecture Skill
**Summary:** Reusable Manus skill codifying the unification process: seven-step workflow, flywheel wiring, the eleven-category taxonomy, build-order decision matrix, rate-formula toolkit, module-spec and master-plan templates, and the plan validator. Validated under official skill-creator rules.

---

## 3. Maintenance Rules

1. Every document must carry the standard header block (ID, title, category, effective date, version, owner, status, summary).
2. The register is the single source of truth for document IDs; retire IDs to the changelog rather than reusing them.
3. Versioning follows `1.0 (Draft)` → `1.1` (minor corrections) → `2.0` (material scope changes).
4. Review this register quarterly against the CBYX calendar (November 2026, February 2027, May 2027, August 2027).
