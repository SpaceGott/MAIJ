# MAIJ Documentation — Changelog

## 2026-11-09 — Downloads current-year document safeguard

* TOOL-MAIJ-IT-001 (`migrate-to-linux.ps1`) now scans Downloads for current-year (2026) documents and stages them into a dedicated `Recent_Downloads_2026/` folder on drive F:, with a dedicated report section and CSV.
* PLN-MAIJ-IT-001 updated to v1.1 documenting the Downloads KEEP rule (documents kept, installer packages skipped).

Document identifier: **CHG-MAIJ-001** · Version 1.2 (Draft) · 2026-11-09

## 2026-11-09 — Part 135 Compliance Frameworks & Network Plan (v1.2)

* Added four Part 135 compliance frameworks under `00_REGULATORY_FRAMEWORK/`: Flight Operations Manual (MAN-MAIJ-OPS-002), Continuous Airworthiness Maintenance Program (CAMP-MAIJ-001), Training Syllabus (TRN-MAIJ-001), and Safety Management System Manual (SMS-MAIJ-001).
* Added the German-train network operations plan (PLN-MAIJ-OPS-001) under `01_STRATEGY_AND_ROADMAPS/` with ICE/RE/S-Bahn stop mapping, simulated AI vectors, and vertipad/grid requirements.
* Updated PLN-MAIJ-STR-001 and PLN-MAIJ-DATA-001 to v1.1 with the refined dual mission, load-profile economics, network tiers, and Costlo waste-rate KPI patterns.
* Updated founder-context-maij.md with the full corpus; re-validated SKL-MAIJ-001 (v1.2) and re-packaged the skill archive.
* Updated Document Register and README to v1.2 — 21 filed documents total.

## 2026-11-09 — FAA-Style Documentation Release (v1.1)

* Re-validated SKL-MAIJ-001 after enriching it with the founder context corpus (mission, economics, FAA rules, NC facts).
* Added `founder-context-maij.md` and `cadence-patterns.md`.

## 2026-11-09 — Initial FAA-Style Documentation Release (v1.0)

* Created the `maij/` folder structure under `SpaceGott/MAIJ` with four operational categories plus summaries.
* Filed fifteen initial documents with FAA-style identifiers, header blocks, and summaries.
* Imported the reusable skill `unified-roblox-game-architecture` (SKL-MAIJ-001).
* Fixed TOOL-MAIJ-IT-001 (`migrate-to-linux.ps1`).
* Added Pop!_OS 24.04 LTS (NVIDIA) and future custom GUI documentation.
