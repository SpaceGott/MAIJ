# Game Architecture Plan Template

Copy this template to produce the master architecture document for a unified multi-concept Roblox simulation game.

---

## 1. Game Identity

* **Name (working):**
* **One-line pitch:**
* **Parent container concept:**
* **Target player fantasy:**
* **Monetization model:** free-to-play with optional cosmetics/subscriptions (never pay-to-win on economy math)

## 2. Module Inventory

List every module with a one-sentence role. The recommended default is four: learning interaction, regional logistics, rate formulas, full-store economy.

| # | Module | Role | Owner | Build Phase |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |

## 3. Flywheel Graph

For each flywheel, declare producer module, artifact, consumer module, and the self-reinforcing effect.

| Flywheel | Producer | Artifact | Consumer | Effect |
|---|---|---|---|---|
| A | | | | |
| B | | | | |
| C | | | | |

## 4. Build-Order Decision

State the chosen direction (Micro-to-Macro, Macro-to-Micro, or Dual-Track) with the concrete trigger for switching directions, referencing `references/decision-matrix.md`.

* **Chosen direction:**
* **Why this direction fits the current founder situation:**
* **Switch trigger (date + condition):**

## 5. Folder Taxonomy

Declare the category set on the external drive or repository, following `references/folder-taxonomy-pattern.md`. List only categories that exist in this plan; pre-create future categories empty.

## 6. Data Firewall & Guardrails

* Game telemetry never touches school or institutional systems
* Age-appropriate controls: parent-controlled continuity, no predatory monetization
* Rate-model transparency: sourced vs assumed coefficients

## 7. Timeline & Definitions of Done

Phased milestone table with dates and exit criteria for each phase.

| Phase | Weeks | Exit Criterion |
|---|---|---|
| 1 | | |
| 2 | | |
| 3 | | |
| 4 | | |
