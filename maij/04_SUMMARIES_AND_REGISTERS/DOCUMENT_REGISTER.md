---
MAIJ DOCUMENT IDENTIFIER: REG-MAIJ-DOC-001
TITLE: MAIJ Master Document Register
CATEGORY: Summaries & Registers
EFFECTIVE DATE: 2026-11-09
VERSION: 1.2 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: The authoritative master index of every document in the MAIJ repository, modeled on FAA order and manual registers, providing for each document its identifier, title, category, version, status, owner, location, and a new-administrator summary.
---

# MAIJ Master Document Register

**Repository:** `SpaceGott/MAIJ` — folder `maij/` · **Classification:** Draft — internal working documents · **Review cycle:** quarterly, aligned with the CBYX calendar and FAA regulatory updates

This register is the first document a **new administrator** should read. It indexes every file generated for the MAIJ venture during the November 2026 planning and migration sessions. Documents follow an FAA-style identifier convention: **SOP** (standard operating procedure), **AD** (administrative directive), **GAP** (gap/risk register), **PLN** (plan), **IGD** (installation guide), **TOOL** (executable tool), **SKL** (reusable skill), **REG** (register), **MAN** (manual), **CHG** (changelog), **CAMP** (continuous airworthiness maintenance program), **TRN** (training syllabus), **SMS** (safety management system).

---

## Document Index

| Identifier | Title | Category | Version | Status | Location |
|---|---|---|---|---|---|
| SOP-MAIJ-CC-001 | Cold-Chain Standard Operating Procedure | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_cold_chain_sop.md` |
| AD-MAIJ-BUS-001 | NC Entity Formation & Business Foundations Guide | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_entity_formation_guide.md` |
| GAP-MAIJ-2026-001 | One-Year Overlooked-Items & Risk Register | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maij_one_year_overlooked_audit.md` |
| MAN-MAIJ-OPS-002 | Flight Operations Manual (skeleton) | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/flight_operations_manual.md` |
| CAMP-MAIJ-001 | Maintenance Program (skeleton) | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/maintenance_program.md` |
| TRN-MAIJ-001 | Training Syllabus (skeleton) | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/training_syllabus.md` |
| SMS-MAIJ-001 | Safety Management System Manual (skeleton) | Regulatory Framework | 1.0 | DRAFT | `00_REGULATORY_FRAMEWORK/safety_management_system.md` |
| PLN-MAIJ-STR-001 | Micro-Term Roadmap: Language Game → Costlo | Strategy & Roadmaps | 1.1 | DRAFT | `01_STRATEGY_AND_ROADMAPS/maij_microterm_roadmap.md` |
| PLN-MAIJ-DATA-001 | Asset Inventory Plan & Data Strategy | Strategy & Roadmaps | 1.1 | DRAFT | `01_STRATEGY_AND_ROADMAPS/maij_training_asset_inventory_plan.md` |
| PLN-MAIJ-IT-001 | File-Filtering & Cleanup Strategy | Strategy & Roadmaps | 1.1 | DRAFT | `01_STRATEGY_AND_ROADMAPS/file_filtering_and_cleanup_strategy.md` |
| PLN-MAIJ-OPS-001 | Network & Route Operations Plan | Strategy & Roadmaps | 1.0 | DRAFT | `01_STRATEGY_AND_ROADMAPS/maij_network_and_route_operations_plan.md` |
| IGD-MAIJ-IT-001 | Windows-to-Linux Migration Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/windows_to_linux_migration_guide.md` |
| IGD-MAIJ-IT-002 | Ubuntu 24.04 LTS Dual-Boot Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/ubuntu_installation_guide.md` |
| IGD-MAIJ-IT-003 | Pop!_OS 24.04 LTS (NVIDIA) Setup Guide | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/pop_os_setup_guide.md` |
| PLN-MAIJ-UI-001 | Future Custom GUI Roadmap | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/custom_gui_roadmap.md` |
| TOOL-MAIJ-IT-001 | Migration Audit & Backup Script (PowerShell) | Migration & Infrastructure | 1.0 | DRAFT | `02_MIGRATION_AND_INFRASTRUCTURE/migrate-to-linux.ps1` |
| SKL-MAIJ-001 | Unified Roblox Game Architecture Skill | Skills & Automation | 1.2 | VALIDATED | `03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture/` |
| SKL-MAIJ-001-A | Skill Package Archive | Skills & Automation | 1.2 | VALIDATED | `03_SKILLS_AND_AUTOMATION/unified-roblox-game-architecture.skill` |
| REG-MAIJ-DOC-001 | Master Document Register (this document) | Summaries & Registers | 1.2 | DRAFT | `04_SUMMARIES_AND_REGISTERS/DOCUMENT_REGISTER.md` |
| CHG-MAIJ-001 | Changelog | Summaries & Registers | 1.2 | DRAFT | `04_SUMMARIES_AND_REGISTERS/CHANGELOG.md` |
| MAN-MAIJ-OPS-001 | MAIJ Operations Manual | — | 1.2 | DRAFT | `README.md` |

---

## Document Summaries (for the New Administrator)

### SOP-MAIJ-CC-001 — Cold-Chain SOP
**Summary:** Temperature control for inspected meat (33–40 °F) and produce in drone transport, pre-flight gel-pack cooling, continuous digital logging, 60-minute flight budgets, delivery signatures retained three years, for NC meat-inspection compliance.

### AD-MAIJ-BUS-001 — Entity Formation Guide
**Summary:** Administrative path to MAIJ NC LLC formation, EIN, registered agent usable from Germany, banking, insurance request, and wordmark filing.

### GAP-MAIJ-2026-001 — One-Year Gap Register
**Summary:** Prioritizes ten untouched areas (hardware, FAA clocks, cold chain, CBYX transition, etc.) with severities, owners, target quarters, and first deliverables.

### MAN-MAIJ-OPS-002 — Flight Operations Manual (skeleton)
**Summary:** Part 135 BVLOS GOM skeleton: organization, crew standards, dispatch/flight-following, DAA with human-equivalent safety, encrypted-C2 link resiliency, Remote Broadcast ID, weather minimums, abnormal/emergency procedures.

### CAMP-MAIJ-001 — Maintenance Program (skeleton)
**Summary:** Airworthiness responsibility, scheduled inspections, battery maintenance with megawatt-charging logs, propeller inspections, MEL, and recordkeeping — with modular handling of the volatile aircraft/battery elements.

### TRN-MAIJ-001 — Training Syllabus (skeleton)
**Summary:** Remote-pilot, dispatcher, and maintenance curricula, simulator-based qualification leveraging MAIJ's own simulation stack, human-factors/CRM training.

### SMS-MAIJ-001 — Safety Management System Manual (skeleton)
**Summary:** Part 5-aligned SMS: policy, SRM with BVLOS-specific hazard controls, assurance, promotion, and emergency response plan.

### PLN-MAIJ-STR-001 — Micro-Term Roadmap
**Summary:** 24-week plan from language game to Costlo simulator, with the macro-to-micro decision matrix and Costlo waste-rate KPI patterns.

### PLN-MAIJ-DATA-001 — Asset Inventory Plan
**Summary:** 11-category taxonomy, short/long-term gap analysis against the dual mission, milestone data priorities.

### PLN-MAIJ-IT-001 — File-Filtering Strategy
**Summary:** KEEP/SKIP rules, OneDrive cautions, Downloads current-year document preservation, and the drive F: staging layout.

### PLN-MAIJ-OPS-001 — Network & Route Operations Plan
**Summary:** German-train ICE/RE/S-Bahn network, simulated-AI-vector scheduling, farm criteria, vertipad/grid requirements.

### IGD-MAIJ-IT-001 — Migration Guide | IGD-MAIJ-IT-002 — Ubuntu Dual-Boot Guide | IGD-MAIJ-IT-003 — Pop!_OS Setup Guide
**Summary:** The complete workstation lifecycle: application audit and redownload list, dual-boot install, and your chosen Pop!_OS (NVIDIA) GUI with Vinegar/Roblox Studio.

### PLN-MAIJ-UI-001 — Custom GUI Roadmap
**Summary:** Tauri MVP → libcosmic workstation → flight-ops shell, with technology selection matrix.

### TOOL-MAIJ-IT-001 — Migration Script | SKL-MAIJ-001 — Roblox Skill
**Summary:** The PowerShell audit/copy tool and the reusable, validated unification skill (v1.2) with cadence playbook and verified founder context corpus.

---

## 3. Maintenance Rules

1. Every document must carry the standard header block. 2. The register is the single source of truth for document IDs. 3. Versioning: 1.0 (Draft) → 1.x (minor) → 2.0 (scope change). 4. Review quarterly against the CBYX calendar.
