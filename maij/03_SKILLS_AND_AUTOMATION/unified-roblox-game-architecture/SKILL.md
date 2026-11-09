---
name: unified-roblox-game-architecture
description: "Unify separate concepts — learning interactions, regional logistics, rate mathematics, and full-store economy simulation — into one cohesive Roblox game, with an 11-category folder taxonomy whose modules feed each other, a weekly bounded-task cadence playbook, and a verified founder context corpus covering the MAIJ mission, Part 135 BVLOS certification requirements, the German-train-style ICE/RE/S-Bahn route hierarchy, drone economics, and energy/grid infrastructure. Use when: designing a multi-concept Roblox simulation game, choosing between micro-to-macro and macro-to-micro build orders, allocating asset and telemetry folders that cross-support game modules, formalizing flywheels and data contracts between game systems, or grounding plans in verified MAIJ mission, economics, regulatory, and NC geography facts."
---

# Unified Roblox Game Architecture

This skill guides the design of multi-concept Roblox simulation games by turning separate concepts (education, logistics, economics, retail) into one integrated world where every module's outputs become another module's inputs, supported by a shared asset and telemetry folder taxonomy, a proven weekly execution cadence, and a verified founder context corpus.

## When to Use

* You are designing a Roblox game that must merge several independent domains (e.g., a language-learning mechanic, a regional delivery-route simulator, and a full Costco-style warehouse economy).
* You need to decide the build order: **micro-to-macro** (inside-out, measurement-first) versus **macro-to-micro** (outside-in, flagship-first).
* You need a deterministic folder structure on an external drive or repository so assets, datasets, formulas, and telemetry cross-support every game module.
* You need to define flywheels, data contracts, and definition-of-done criteria between modules.
* You are writing any MAIJ-related plan, pitch, or simulation document and need the verified facts (mission wording, Part 135/108 rules, network hierarchy, drone economics).

## Core Workflow

### Step 1: Inventory Concepts and Declare the Parent Container

List the candidate concepts as independent domains (for example: language learning, food-delivery routes, rate mathematics, warehouse retail). Then declare the **parent container** — the one world that physically and thematically holds them all (for example, a Costco-style store simulator named "Costlo"). A concept that cannot be placed inside the container should become a separate mini-game or be cut.

### Step 2: Specify Each Module with Boundaries

Copy `templates/module-spec-template.md` for each module and fill: one-sentence objective, primary KPI measurable from gameplay telemetry, three must-have scope items for the first release, explicit out-of-scope items, declared input/output folders, and Roblox architecture (server-authoritative state, telemetry events, datastore needs).

### Step 3: Wire the Flywheels

Declare at least three producer → consumer relationships where one module's output file feeds another's input. The default MAIJ flywheels: language mechanic logs calibrate the assistant NPC; route telemetry calibrates the rate formulas; formulas feed the store economy; store telemetry feeds long-term MAIJ datasets. Any module with no flywheel is isolated — wire it or remove it.

### Step 4: Map the Network Tiers

Adopt the German-train route hierarchy: **ICE** for long-range trunk corridors, **RE** for regional feeds, **S-Bahn** for last-mile collection to/from production hubs (small farms). Map vehicle classes to the tiers — eVTOL for 0–50 miles (S-Bahn to RE/ICE) and RAM for 50–250 miles (RE + ICE). Treat public transportation as active IFR clearances, and model departures, reroutes, and schedules as a simulated AI vector inside the game.

### Step 5: Choose the Build Order

Read `references/decision-matrix.md` and declare the chosen direction in the plan:

* **Micro-to-Macro (Language → Routes → Formulas → Costlo):** choose when founder time is constrained by studies or fellowships and a published research-grade artifact is an explicit near-term goal.
* **Macro-to-Micro (Costlo shell → Delivery job → Formulas → Language quests):** choose when building one viral, high-retention flagship is the primary goal.
* **Dual-Track:** blueprint the macro container, build the smallest mechanic as the first playable slice, then slot it into the container.

Record a dated switch trigger (for example: "if no module ships by month three, drop to micro-to-macro").

### Step 6: Allocate the Folder Taxonomy

Read `references/folder-taxonomy-pattern.md` and adopt the 11-category structure on the external drive or repository: `01_3D_and_CAD_Models` through `11_Model_Zoo_and_Benchmarks`. Retroactive categories 01–07 are harvested from existing files with an inventory script first (audit mode before copy mode, always). Forward-looking categories 08–11 are pre-created empty and fill organically as each phase ships. Never store institutional or student data inside game categories.

### Step 7: Embed the Rate Formulas

For delivery and economy modules, read `references/rate-formula-toolkit.md` and embed the six-model suite: per-delivery cost, drone energy with wind, perishable decay with the cold-chain constraint, break-even comparison against ground delivery, VRPTW routing, and rate policy. Label every coefficient sourced (with URL) or assumed, and ship the suite as a tested Python module before in-game use.

### Step 8: Couple Simulation to Real-World Infrastructure

Couple airspace slot scheduling and trajectory management to energy realities: airport microgrid peak loads, turnaround power staging, dedicated vertipads, megawatt charging logs, battery turnarounds, thermal management, and localized microgrid demand. Track volatile elements (aircraft type and eVTOL propeller designs, battery mechanisms, operational dates) in an explicit assumptions register rather than hardcoding them.

### Step 9: Ground Plans in the Verified Context

Read `references/founder-context-maij.md` for the verified factual corpus (mission wording, Part 135/108 rules, NC food-safety law, education pipeline ethics, Pop!_OS/COSMIC GUI decision).

### Step 10: Run the Weekly Cadence Playbook

Read `references/cadence-patterns.md` and adopt the weekly bounded-task pattern ("Execute the next [Module] roadmap week"), the G0-style evidence gates, modular sequencing (economy → role mechanics → non-gameplay → meta-loop), and the definition-of-done checklist.

### Step 11: Validate and Deliver the Plan

Run the validator on the completed plan:

```bash
python3 scripts/validate_game_plan.py path/to/game-architecture-plan.md
```

Fix any missing required sections, isolated flywheels, or undeclared build orders. The deliverable is one validated `game-architecture-plan.md` plus the populated module specs.

## Bundled Resources

* `scripts/validate_game_plan.py` — structural validator for the plan document
* `references/decision-matrix.md` — micro-to-macro versus macro-to-micro selection rules
* `references/folder-taxonomy-pattern.md` — 11-category specification, flywheel matrix, lifecycle rules
* `references/rate-formula-toolkit.md` — reusable formula suite with provenance discipline
* `references/founder-context-maij.md` — verified factual corpus for MAIJ documents
* `references/cadence-patterns.md` — weekly execution cadence and evidence-gate patterns
* `templates/module-spec-template.md` — per-module specification
* `templates/game-architecture-plan-template.md` — master architecture document template

## Non-Negotiable Guardrails

* **Data firewall:** game-side telemetry never touches school or institutional systems; any student use follows the discovery-note → Design-Partner-MOA → authorized-pilot agreement stack with parent-controlled home-game continuity.
* **Aviation gating:** the first 24 months of education-track product work may use only simulated aviation; real-world flight programs are a strictly separate long-horizon thesis.
* **Rate-model transparency:** every cost coefficient must be labelled sourced or assumed — never present assumptions as facts.
* **Certification realism:** the 1,600–1,750 lb payload class cannot fit Part 108 (1,320 lb MTOW max including cargo and batteries); plans must target Part 135 BVLOS with a full documentation set (flight manual, maintenance program, training syllabus, SMS), DAA with human-equivalent safety, encrypted C2 link resiliency, and Remote Broadcast ID.
