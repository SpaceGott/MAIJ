---
MAIJ DOCUMENT IDENTIFIER: MAN-MAIJ-OPS-002
TITLE: MAIJ Flight Operations Manual (General Operations Manual Skeleton)
CATEGORY: Regulatory Framework
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft Skeleton)
OWNER: MAIJ Operations
STATUS: DRAFT — FAA PART 135 COMPLIANCE WORKING DRAFT
SUMMARY: The FAA-aligned flight operations manual skeleton for a future Part 135 BVLOS autonomous-freight fleet operator: organization, crew qualifications, dispatch and flight following, BVLOS technical operating procedures (DAA, encrypted C2, Remote ID), weather minimums, abnormal and emergency procedures, and recordkeeping.
---

# MAIJ Flight Operations Manual (Draft Skeleton)

**Document:** MAN-MAIJ-OPS-002 · **Version:** 1.0 (Draft) · **Target standard:** 14 CFR Part 135 / BVLOS

This document is the **working skeleton** of MAIJ's General Operations Manual (GOM) for a Part 135 on-demand cargo operation. It defines the operational envelope for rural small-fleet drone freight (1,600–1,750 lb payload class) and will be completed with the FAA principal operations inspector assigned during the certification process.

## 1. Organization and Responsibilities

* **Director of Operations:** overall responsibility for air carrier certificate operations.
* **Chief Remote Pilot:** remote-pilot qualifications, training records, and standardizations.
* **Director of Maintenance:** CAMP execution and airworthiness responsibility (see CAMP-MAIJ-001).
* **Safety Manager:** independent SMS execution (see SMS-MAIJ-001).

## 2. Remote Pilot and Crew Standards

* Remote-pilot qualifications, currency, and medical standards.
* Duty-time and rest limitations aligned with Part 135 principles.
* Crew pairing rules and supervision ratios for multi-aircraft operations (one planner/supervisor over multiple aircraft — the economic model in `founder-context-maij.md`).

## 3. Dispatch, Flight Following, and Scheduling

* Public transportation is treated as **active IFR clearances** in the scheduling model; departures are calculated, reroutes issued, and schedules managed as a **simulated AI vector** before live execution.
* Flight-following through continuous digital telemetry; lost-data protocol.
* Weight and balance dispatch: cargo plan covering 300 lb vegetables, 1,000 lb dry goods, 500 lb meats, within the 1,600–1,750 lb envelope.
* Cold-chain pre-flight verification per SOP-MAIJ-CC-001.

## 4. BVLOS Technical Operating Procedures

* **Detect-and-avoid (DAA):** human-equivalent safety standard for non-cooperative traffic, with documented separation distances and encounter-handling.
* **Command-and-control (C2):** encrypted link resiliency requirements, redundant pathways, lost-link procedures.
* **Remote Broadcast ID:** compliant broadcasting on all flights.
* Rural-delivery operating-permit envelope and fast-tracked small-fleet procedures.

## 5. Weather Minimums and Airspace

* Day/night, wind, visibility, and icing limitations; thermal limits derived from battery management (see `founder-context-maij.md`).
* Class G rural airspace procedures; community airspace deconfliction models.

## 6. Abnormal and Emergency Procedures

* Lost C2 link; lost DAA; GPS degradation; energy/battery contingencies (battery turnaround logistics coupling).
* Emergency response plan activation and SMS reporting triggers.

## 7. Recordkeeping

* Flight logs, cargo manifests, and cold-chain signatures retained three years minimum, digital and auditable.
