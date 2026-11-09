---
MAIJ DOCUMENT IDENTIFIER: SOP-MAIJ-CC-001
TITLE: Cold-Chain Standard Operating Procedure for Perishable Food and Inspected Meat Transport
CATEGORY: Regulatory Framework
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Standard operating procedure governing temperature logging, pre-cooling, maximum flight-time budgets, delivery-acceptance verification, and sanitization for MAIJ autonomous drone freight under NC Department of Agriculture meat-inspection and food-establishment oversight.
---

# MAIJ Cold-Chain Standard Operating Procedure (SOP-MAIJ-CC-001)

**Document:** MAIJ Autonomous Cargo Drone Cold-Chain SOP
**Scope:** All transport of perishable produce and inspected meat under the MAIJ mission (small NC farms → NC restaurants)
**Regulatory basis:** NC Department of Agriculture Meat & Poultry Inspection Division rules; NC food establishment receiving standards
**Owner:** MAIJ Operations | **Version:** 1.0 (Draft) | **Review:** annual

---

## 1. Temperature Control Standards

| Product Class | Required Cargo Temp | Max Time Out of Temp | Logging |
|---|---|---|---|
| **Inspected meat** (raw, pre-cut, cured) | 33–40 °F (0.6–4.4 °C) | 0 minutes for excursions above 45 °F | Continuous digital data-logger, 1-min sampling |
| **Cut melons/leafy greens/tomatoes** (TCS produce) | 33–41 °F (0.6–5.0 °C) | 30 minutes | Digital data-logger |
| **Whole raw produce** | 45–55 °F (7.2–12.8 °C) | 60 minutes | Spot check at receipt |

**Golden rule:** Any meat consignment that exceeds 45 °F for more than zero minutes is quarantined, photographed, temperature-rechecked, and rejected; it is never re-routed or delivered.

## 2. Pre-Flight Preparation

1. **Cargo bay pre-cooling:** the insulated payload compartment is pre-cooled with food-grade gel packs to ≤ 38 °F before loading; record start temperature.
2. **Acceptance check at farm:** verify shipper's pre-loading temperature log; reject any cargo above product class maximums.
3. **Logger activation:** start the calibrated digital data-logger (calibrated annually, traceable to NIST standards), confirm it is recording, and place it at the cargo center.
4. **Flight-time budget:** maximum flight duration per leg is the shorter of: (a) 60 minutes; (b) the time the passive-cooling payload can maintain the product class temperature under ambient conditions. Flights exceeding this budget require a ground-relay or a cold-hold stop.

## 3. In-Flight Monitoring

* Where real-time datalink exists, temperature is streamed to the planner dashboard; excursion alerts are set at +3 °F above class maximum.
* Any excursion triggers an immediate mission replan: fastest safe route to destination, or return to origin, with a logged deviation record.

## 4. Delivery Acceptance & Verification

1. On landing, the restaurant receiving manager (or MAIJ representative) verifies: tamper-evident seal intact, cargo-bay temperature display, and the printed or uploaded logger graph.
2. **Sign-off:** receiving temperature, date/time, and inspector/receiver signature are logged to the electronic delivery record and retained for three years (meeting NC records-retention expectations).
3. If acceptance fails, the cargo is returned with an incident report; farm and restaurant are notified within one hour.

## 5. Cleaning & Sanitization

The payload bay is food-contact safe, wipe-sanitized with an EPA-registered food-contact sanitizer after every delivery day, air-dried, and logged in the aircraft sanitation logbook.

## 6. Training & Audits

All MAIJ crew, ground handlers, and supervisors complete annual cold-chain training; quarterly internal audits review logs against this SOP. An informational copy of this SOP is provided to the NC Department of Agriculture meat-inspection division and county health departments upon request.
