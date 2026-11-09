---
MAIJ DOCUMENT IDENTIFIER: CAMP-MAIJ-001
TITLE: Continuous Airworthiness Maintenance Program (Draft Skeleton)
CATEGORY: Regulatory Framework
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft Skeleton)
OWNER: MAIJ Maintenance
STATUS: DRAFT — FAA PART 135 COMPLIANCE WORKING DRAFT
SUMMARY: The FAA-aligned maintenance-program skeleton for the MAIJ fleet: airworthiness responsibility, scheduled inspection intervals, battery maintenance and megawatt-charging health tracking, propeller/rotor inspections, component time limits, discrepancy reporting and minimum-equipment list, and maintenance recordkeeping.
---

# Continuous Airworthiness Maintenance Program (Draft Skeleton)

**Document:** CAMP-MAIJ-001 · **Version:** 1.0 (Draft) · **Target standard:** 14 CFR Part 135 CAMP principles

This skeleton defines the maintenance system for the MAIJ freight fleet. Because aircraft type, eVTOL propeller designs, and battery mechanisms are flagged as **volatile** (see `founder-context-maij.md`), this document uses modular placeholders that freeze per airframe variant.

## 1. Airworthiness Responsibility

The Director of Maintenance is responsible for aircraft airworthiness. No aircraft may be released without a current maintenance release and an open-MEL review.

## 2. Inspection Program

* **Pre-flight / turnaround inspections:** structure, propulsion, propellers, sensors (DAA apertures), datalink antennas, and battery seating.
* **Periodic inspections:** hourly/cycles-based (to be set per airframe OEM program) covering motors, gearboxes, connectors, and software integrity.
* **Structural and composites program:** damage limits, repair tracking, and inspection after hard landings.

## 3. Battery System and Charging Infrastructure

* Battery state-of-health (SoH) tracking logged to a **megawatt-charging log**; thermal-management telemetry reviewed at every turnaround.
* Battery-turnaround staging discipline: charge windows, conditioning, and retirement criteria.
* Ground charging and vertipad interface inspections (coupling to `maij_network_and_route_operations_plan.md`).

## 4. Minimum Equipment List (MEL) and Discrepancy Reporting

* An FAA-approved MEL covering non-essential equipment.
* Discrepancy reporting system with clear return-to-service authority.
* Continuing airworthiness data feeding the SMS (SMS-MAIJ-001).

## 5. Recordkeeping

* Aircraft, engine/propulsion, propeller, and battery logs retained in digital form and available for FAA inspection on demand.
