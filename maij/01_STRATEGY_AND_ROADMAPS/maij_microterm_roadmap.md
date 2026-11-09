---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-STR-001
TITLE: MAIJ Micro-Term Roadmap: From a Language-Learning Roblox Game to the Costlo Simulator
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.1 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Twenty-four-week phased execution plan sequencing a language-learning mechanic, a German-train-modeled North Carolina food-delivery route simulator, rate-model mathematics, and the unified Costlo warehouse simulator, including the macro-to-micro versus micro-to-macro build-order decision matrix and Costlo waste-rate KPI patterns.
---

# MAIJ Micro-Term Roadmap: From a Language-Learning Roblox Game to the Costlo Simulator

## 0. Mission Context

**Venture mission:** *Make foundational learning more engaging by connecting physical books, hands-on exploration, and interactive digital experiences. The project aims to support — not replace — educators while introducing learners to STEAM and aviation-inspired problem-solving. Its immediate focus is a hardware-software MVP, with broader robotics and aviation research pursued through separate development tracks.*

**Brand values:** Human-centered, reliable, inclusive *(inclusive is a placeholder)*.
**The core question:** *"What is the balance?"* — human–machine interaction in AI–human learning.
**MAIJ Studios:** provides adaptable modular simulation-based flight models, control logic, localized decision-making, and sensor pipelines.

## 1. The Micro-Sequencing Logic: Why This Exact Order

```
Month 1–2                    Month 3                    Month 4                    Month 5–6
┌──────────────────────┐    ┌──────────────────────┐    ┌──────────────────────┐    ┌──────────────────────┐
│  Phase 1             │    │  Phase 2             │    │  Phase 3             │    │  Phase 4             │
│  Language-Learning   │───▶│  NC Food-Delivery    │───▶│  Mathematical Rate  │───▶│  Costlo Simulator    │
│  Roblox Game         │    │  Route Simulator     │    │  Formulas            │    │  (warehouse/shopping/│
│  (AI usage ratio)    │    │  (German-train tiers)│    │  (pricing & cost)    │    │   delivery/living/   │
└──────────────────────┘    └──────────────────────┘    └──────────────────────┘    │   procuring)         │
         │                           │                           │                  └──────────────────────┘
         ▼                           ▼                           ▼                             ▲
  AI-scaffolding ratio       Player route data &         Calibrated rate formulas ──────┘
  metric for all future      failure cases feed          power the Costlo
  NPC/assistant systems      the formula inputs          economy engine
```

**Flywheel 1 — AI scaffolding:** Phase 1 measures how much AI assistance produces the best learning outcome without learned helplessness. That calibrated AI-assistance ratio is then reused for every in-game assistant across Phases 2, 3, and 4.
**Flywheel 2 — Human route intuition:** Phase 2's players plan and fly routes on a real NC map, generating thousands of human-chosen routes and failure modes. These become the calibration dataset for Phase 3's cost and rate models — and, down the road, training data for MAIJ's real-world route-planning AI.
**Flywheel 3 — Formula-driven economy:** Phase 3 formalizes per-delivery costs, energy consumption, and perishability into equations. Phase 4 embeds those exact equations as the economy engine of the Costlo simulator.

## 2. Phase 1 (Weeks 1–8): The Language-Learning Roblox Game

**Objective:** Build a compact, adaptable language-learning experience inside Roblox that empirically measures the **AI usage ratio** — the proportion of player actions performed with AI scaffolding (hints, translation, corrective feedback, NPC conversation) — and identifies the ratio that maximizes learning gain without collapsing struggle-driven retention.

$$\text{AUR} = \frac{\text{AI-scaffolded learning interactions}}{\text{Total learning interactions}}$$

* Logged anonymously, game-side only: hint requests, suggestion-acceptance rate, feedback latency, success rate vs AUR across A1/A2/B1 difficulty bands, 48-hour recall, confidence, and abandonment (learned-helplessness watch).
* Scope: polished hub world with 3–5 repeatable quests; AI assistant NPC with zero/partial/full-scaffold help levels; analytics dashboard; optional classroom mode under the agreement-stack rules.
* Assets: voice dialogue stems, quest scripts and corpora, anonymized AUR research logs (CSV).

## 3. Phase 2 (Weeks 9–14): The NC Food-Delivery Route Simulator

**Objective:** A Roblox game with a recognizable NC map whose hubs sit in their real towns, organized on the **German-train route hierarchy** (ICE trunk, RE regional, S-Bahn last-mile), where players plan and execute perishable-food delivery routes from small farms to restaurants.

| Tier | NC stops | Vehicle class | Role |
|---|---|---|---|
| **ICE** | Elizabeth City, Hickory, Lumberton, New Bern, Henderson | RAM (50–250 mi) | Long-range trunk corridors |
| **RE** | Burlington, Sanford, Goldsboro, Tarboro | eVTOL/RAM hybrid | Regional feeds |
| **S-Bahn** | Production hubs surrounding ICE/RE stops | eVTOL (0–50 mi) | Last-mile collection |

* Target producers: **local mom-and-pop farms and farms smaller than 100 acres**.
* Public transportation is treated as **active IFR clearances**; departures, reroutes, and schedules are managed as **simulated AI vectors** in-game.
* Airspace slot scheduling with variable-speed arrivals; energy coupling to vertipads, megawatt charging logs, and battery-turnaround staging.
* Data captured: route sequences, failure cases (dead batteries, expired perishables, wind diversions, bad landing spots), per-arc calibration data.

## 4. Phase 3 (Weeks 15–18): The Mathematical Rate-Simulation Formulas

This phase formalizes the economics with the **1,600–1,750 lb concept load**:

$$C = C_{\text{fixed}} + c_t \cdot t + c_d \cdot d + c_w \cdot w + c_e \cdot E + C_{\text{ins}} + C_{\text{ovh}}$$

* Break-even comparison: drone vs. ground (Amazon ~$63, DroneUp ~$30, ground $6–$10).
* Drone energy model with wind; perishable decay model $V(t) = V_0 \exp(-\lambda_{\text{crop}} t)$; cold-chain binary constraint (meat-inspection rule).
* VRPTW route formulation with simplified heuristic solver.
* Three rate policies: distance-tiered, cost-plus subscription, Costlo-subsidized.
* **Costlo waste-rate KPI pattern to encode:** target waste of **$250 on a $55k weekly sales** department, **$1,800 on a $155k week**, and **$800 on a $176k week** — these define the in-game perishability/pricing tuning targets.
* Deliverables: parameter dictionary (assumed vs. sourced), `maij_rates.py` with tests, sensitivity dashboard.
* Certification reality check: with a 1,600–1,750 lb payload the aircraft cannot fit Part 108 (1,320 lb MTOW max), so the documentation must target Part 135 BVLOS (see the four Part 135 frameworks).

## 5. Phase 4 (Weeks 19–24): The Costlo Simulator

**Objective:** Group the prior phases into a single unified Roblox economy game — **"Costlo"** — across five interlocking systems:

1. **Warehouse:** receiving, storage/picking, cold zones, waste-rate tracking against the KPI targets.
2. **Shopping:** member economy, inventory rotation, checkout throughput.
3. **Delivery (the MAIJ heart):** fleet dispatch (vans + eVTOL/RAM drones) on the German-train NC map using Phase 3's formulas.
4. **Living:** housing, food bills, commute, wage progression stocker → GM; fatigue as human-factors data.
5. **Procuring:** contracted NC farms (<100 acres), crop-calendar seasonality, freshness-at-receipt checks.

## 6. How the Roadmap Feeds the 11-Category Drive F: Structure

| Phase | Weeks | Categories Populated |
|---|---|---|
| 1. Language game | 1–8 | 04, 06, 07, 11 |
| 2. NC route simulator | 9–14 | 02, 03, 05, 08, 10 |
| 3. Rate formulas | 15–18 | 05, 10, 11 |
| 4. Costlo simulator | 19–24 | 01, 02, 03, 05, 06, 10, 11 |
| Real flights (post-24) | 25+ | 02, 09, 10 |

## 7. Data Firewall and Ethical Guardrails

* Game telemetry never touches school or institutional systems.
* Student use follows the agreement stack; parents control home-game continuity.
* **Aviation gating:** the first 24 months of education-track work may use only simulated aviation; real-world flight programs are a strictly separate long-horizon thesis.
* Every cost coefficient labelled sourced or assumed.
* Volatile elements (aircraft type, eVTOL propeller designs, battery mechanisms, operational dates) tracked in an assumptions register.

## 8. Definition of "Done" for the 6-Month Micro-Term

A published language game with an anonymized AUR dataset; an NC route game with hundreds of human route decisions; a validated `maij_rates.py` module; the Costlo simulator unifying warehouse, shopping, delivery, living, and procuring with the documented waste-rate KPIs; an 11-category drive F: whose empty folders are now populated; and one integrated pitch story for the CBYX network, TU Dortmund professors, and future NC pilot partners.

## 9. The Alternative Direction: Macro-to-Micro (Costlo-First)

**Why macro-to-micro works:** one flagship produces better retention and community; language learning is more organic as a Costlo cashier role; delivery needs the warehouse context; the formulas govern the real economy.

**The trade-off:** five interlocking systems risk a solo founder-student never shipping; a small game first stress-tests the production pipeline.

**The decision matrix:**

| Priority | Recommended Direction |
|---|---|
| Publish research; fast standalone proof-points; clean data; tight scope | **Micro-to-Macro** (Language → Routes → Formulas → Costlo) |
| Build one viral, high-retention Roblox flagship; social roleplay | **Macro-to-Micro** (Costlo shell → Delivery job → Formulas → Language quests) |
| Best of both | **Dual-Track** |

Whichever direction you choose, the four modules and their data contracts are identical — only the assembly order changes.
