# Module Specification Template

Copy this template for each module of a unified multi-concept Roblox simulation game.

---

## Module Name

* **Owner / role:** (e.g., solo founder)
* **Status:** draft | active | shipped | deprecated
* **Parent container:** (e.g., Costlo world container)
* **Build-order phase:** (e.g., Phase 2 of 4)

## Objective & Measurable KPI

* One-sentence objective:
* Primary KPI (must be measurable from gameplay telemetry):
* Secondary KPI:
* Failure definition (when to cut or pivot this module):

## Scope Boundaries

* **In scope (must-have for first release):**
  * 
  * 
  * 
* **Out of scope (explicitly not in first release):**
  * 
  * 
* **Nice-to-have (stretch, max 2):**
  * 
  * 

## Data Contracts

| Direction | Artifact | Category Folder | Format | Consumer / Producer |
|---|---|---|---|---|
| Input | | | | |
| Output | | | | |

## Roblox Technical Architecture

* **Server authority:** what logic runs server-side (pricing, economy, inventory)
* **Client responsibilities:** UI, movement, local effects
* **Telemetry events emitted:** (name + fields + frequency)
* **Shared state consumed:** (datastores, ReplicatedStorage)
* **Dependencies:** other modules that must be functional first

## Flywheels

* **Feeds:** this module's output X becomes next module Y's input
* **Fed by:** this module's input Z comes from module W's output

## Guardrails

* Data firewall: game-side only; no institutional/student data join
* Ethics/safety considerations:
* Rate-model transparency: sourced vs assumed coefficients

## Definition of Done (first release)

- [ ] Playable build in a test place with the three must-have scope items
- [ ] Primary KPI emits into category 10 (telemetry)
- [ ] One producer → consumer flywheel verified with real data
- [ ] Readme-level docs in category 07
