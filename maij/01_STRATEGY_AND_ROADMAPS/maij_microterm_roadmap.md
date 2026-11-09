---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-STR-001
TITLE: MAIJ Micro-Term Roadmap: From a Language-Learning Roblox Game to the Costlo Simulator
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Twenty-four-week phased execution plan sequencing a language-learning mechanic, a North Carolina food-delivery route simulator, rate-model mathematics, and the unified Costlo warehouse simulator, including the macro-to-micro versus micro-to-macro build-order decision matrix.
---

# MAIJ Micro-Term Roadmap: From a Language-Learning Roblox Game to the Costlo Simulator

A concrete, phased micro-roadmap for the first six months of the short-term mission, breaking the sequence into four tightly coupled builds: a **language-learning Roblox game** (measuring the optimal AI-usage ratio), an **NC food-delivery route simulator**, the **mathematical rate-simulation formulas**, and finally the unified **Costlo (Costco-style) simulator** encompassing warehouse, shopping, delivery, living, and procuring systems.

---

## 1. The Micro-Sequencing Logic: Why This Exact Order

Each phase earns the right to the next. Skipping steps produces an economy simulation without economic math, or economic math without gameplay data to calibrate it:

```
Month 1–2                    Month 3                    Month 4                    Month 5–6
┌──────────────────────┐    ┌──────────────────────┐    ┌──────────────────────┐    ┌──────────────────────┐
│  Phase 1             │    │  Phase 2             │    │  Phase 3             │    │  Phase 4             │
│  Language-Learning   │───▶│  NC Food-Delivery    │───▶│  Mathematical Rate  │───▶│  Costlo Simulator    │
│  Roblox Game         │    │  Route Simulator     │    │  Formulas            │    │  (warehouse/shopping/│
│  (AI usage ratio)    │    │  (regional map)      │    │  (pricing & cost)    │    │   delivery/living/   │
└──────────────────────┘    └──────────────────────┘    └──────────────────────┘    │   procuring)         │
         │                           │                           │                  └──────────────────────┘
         ▼                           ▼                           ▼                             ▲
  AI-scaffolding ratio       Player route data &         Calibrated rate formulas ──────┘
  metric for all future      failure cases feed          power the Costlo
  NPC/assistant systems      the formula inputs          economy engine
```

**Flywheel 1 — AI scaffolding:** Phase 1 measures how much AI assistance produces the best learning outcome without learned helplessness. That calibrated AI-assistance ratio is then reused for every in-game assistant across Phases 2, 3, and 4 (dispatch copilot, planner assistant, shopping assistant).

**Flywheel 2 — Human route intuition:** Phase 2's players plan and fly routes on a real NC map, generating thousands of human-chosen routes and failure modes. These become the calibration dataset for Phase 3's cost and rate models — and, down the road, training data for MAIJ's real-world route-planning AI.

**Flywheel 3 — Formula-driven economy:** Phase 3 formalizes per-delivery costs, energy consumption, and perishability into equations. Phase 4 embeds those exact equations as the economy engine of the Costlo simulator.

---

## 2. Phase 1 (Weeks 1–8): The Language-Learning Roblox Game

### Objective

Build a compact, adaptable language-learning experience inside Roblox that empirically measures the **AI usage ratio** — the proportion of player actions performed with AI scaffolding (hints, translation, corrective feedback, NPC conversation) — and identifies the ratio that maximizes *learning gain* without collapsing *struggle-driven retention*.

### The Research Metric: AI-Usage Ratio (AUR)

Define the per-session metric:

$$\text{AUR} = \frac{\text{AI-scaffolded learning interactions}}{\text{Total learning interactions}}$$

Instruments to log anonymously (game-side only, never school-linked):

* Hint requests per task, acceptance rate of suggested answers, and corrective-feedback response latency
* Task success rate vs. AUR across three difficulty bands (A1/A2/B1-style vocabulary quests)
* 48-hour recall rate on previously scaffolded vs. unscaffolded items
* Player-reported confidence and session abandonment (to catch learned helplessness)

### Build Scope

* A small, polished hub world (a village/academy) with 3–5 repeatable quests: a marketplace ordering quest, a direction-asking quest, and a mini-story NPC conversation
* An AI assistant NPC (rule-based first; API-backed later on Ubuntu) with three selectable help levels: **zero-scaffold** (raw retry), **partial-scaffold** (hints and partial sentences), **full-scaffold** (complete suggested responses)
* Telemetry hooks: every quest attempt logs quest ID, scaffold level, latency, outcome, and AUR to a simple analytics dashboard
* Optional classroom mode under your existing agreement-stack rules: teacher-controlled sessions, game-only state, no school-system join of any telemetry

### Assets Generated (feeds drive F: `04_Audio_and_Voiceovers`, `06_Branding_and_Graphics`, `07_Documentation_and_Text_Data`, `11_Model_Zoo_and_Benchmarks`)

* Voice-recorded dialogue stems for dialogue audio data
* Quest scripts and bilingual vocabulary corpora (text training data)
* Anonymized AUR research logs (CSV) — your first publishable learning-science artifact

---

## 3. Phase 2 (Weeks 9–14): The NC Food-Delivery Route Simulator

### Objective

A Roblox game with a recognizable map of North Carolina whose hubs sit in their real towns, where players plan and execute perishable-food delivery routes from small farms to restaurants. The game's economy and perishability clocks produce real, logged route data.

### NC Map and Hub Architecture

| Hub / Town | Real-World Role in MAIJ Thesis | Game Role |
|---|---|---|
| **Raleigh** | State capital, major restaurant demand cluster | Primary demand hub |
| **Durham** | Triangle demand cluster, university market | Demand hub |
| **Greensboro / Winston-Salem** | Piedmont farming hinterland access | Mixed supply/demand hub |
| **Charlotte** | Largest NC market, Zipline precedent city | Mega demand hub |
| **Greenville / Kinston** | Eastern NC agricultural core (produce, swine/poultry) | Primary farm-supply hub |
| **Wilmington** | Coastal demand, port logistics precedent | Demand hub |
| **Asheville** | Mountain farming, altitude/wind challenges | Advanced-difficulty hub |
| **ECSU / Elizabeth City** | Aviation-science context, your own school | Easter-egg pilot academy hub |

Nodes connect through a simplified network of **farms (supply), hubs (aggregation), and restaurants (demand)**. Delivery arcs have distance, travel time, and per-arc wind/weather modifiers.

### Gameplay Loop

1. **Morning (the "day before"):** review tomorrow's orders, plot routes on the NC map, assign mixed fleet (vans and concept cargo drones)
2. **Flight/drive execution:** pilot the drone or watch autonomous dispatch; handle wind events and battery/fuel limits
3. **Delivery:** landing-zone confirmation at the restaurant; perishability clock checks (meat and produce lose value with time)
4. **End of day:** revenue, fuel/battery cost, perishability loss, on-time rating; unlock new hubs and drone upgrades

### Data Captured (feeds drive F: `05_Structured_Data_and_Labels`, `10_Telemetry_and_Operations_Data`)

* Player-chosen route sequences (node orders, vehicle assignments)
* Failure cases: dead batteries, expired perishables, wind diversions, bad landing spots
* Per-arc time/energy observations that become calibration data for Phase 3

---

## 4. Phase 3 (Weeks 15–18): The Mathematical Rate-Simulation Formulas

This phase formalizes the economics so the game — and eventually MAIJ's real pricing — can simulate rates correctly.

### 4.1 Per-Delivery Cost Model

$$C = C_{\text{fixed}} + c_t \cdot t + c_d \cdot d + c_w \cdot w + c_e \cdot E + C_{\text{ins}} + C_{\text{ovh}}$$

| Symbol | Meaning | Example Unit |
|---|---|---|
| $C$ | total cost of one delivery | $/flight |
| $C_{\text{fixed}}$ | amortized aircraft capital cost per flight | $/flight (≈ $1.67 from your earlier drone economics) |
| $c_t$ | planner/supervisor labor cost per minute | $/min (one planner supervising many aircraft) |
| $t$ | flight/travel duration | min |
| $c_d$ | distance-variable wear/maintenance | $/km |
| $d$ | route distance | km |
| $c_w$ | payload-capacity cost | $/kg |
| $w$ | payload mass | kg |
| $c_e$ | energy cost per kWh | $/kWh |
| $E$ | energy consumed | kWh |
| $C_{\text{ins}}$ | insurance allocation per flight | $/flight |
| $C_{\text{ovh}}$ | landing-zone, data-link, regulatory overhead | $/flight |

**Break-even comparison:** compare $C_{\text{drone}}$ against $C_{\text{ground}}$ for each arc. An arc is drone-economical when $C_{\text{drone}}(d,w) < C_{\text{ground}}(d,w)$ — your earlier research found Amazon drone delivery at ≈ $63, DroneUp at ≈ $30 with a < $7 goal, against $6–10 ground delivery. The model must reproduce those published baselines.

### 4.2 Drone Energy Consumption Model

The energy per flight depends on payload, airspeed, and wind:

$$P(w, v) = P_{\text{hover}}(w) \cdot \frac{t_{\text{hover}}}{t} + \left( P_{\text{parasitic}}(v) + P_{\text{induced}}(w, v) \right) \cdot \frac{t_{\text{cruise}}}{t}$$

$$E = P(w, v) \cdot t$$

Where the relative airspeed $v_{\text{rel}} = v - v_{\text{wind}}\cos\theta$ captures headwind/tailwind effects from the Phase 2 weather model. This is what makes winter flights out of the Blue Ridge cost more than summer Piedmont flights — a real physical effect that changes the rate table.

### 4.3 Perishable Shelf-Life Decay (Value Model)

Delivered product value decays with time and temperature:

$$V(t) = V_0 \cdot \exp\!\bigl(-\lambda_{\text{crop}}(T) \cdot t\bigr)$$

Meat carries an additional cold-chain binary constraint: if log temperature $T > T_{\text{safe}}$ for more than $\tau_{\text{crit}}$ minutes, the delivery fails regulatory acceptance (NC Department of Agriculture meat-inspection rule). This converts food safety into a hard constraint on the route planner.

### 4.4 Route Formulation (the Vehicle Routing Problem)

Minimize total delivery cost subject to capacity, time windows, and energy:

$$\min \sum_{k} \sum_{i,j} C_{ijk} \cdot x_{ijk}$$

$$\text{s.t.} \quad \sum_{i} w_i \le W_k, \quad a_j \le \text{arrival}_j \le b_j, \quad E_k \le E_{\text{battery}} \quad (\text{+ cold-chain constraint})$$

The game ships a simplified heuristic solver (greedy nearest-demand-with-window), while your Linux toolchain later runs professional solvers (OR-Tools, VRPy).

### 4.5 Rate / Pricing Policy

Three revenue models to simulate:

1. **Distance-tiered rate:** $R(d) = R_{\text{base}} + r \cdot d$
2. **Cost-plus subscription:** monthly farm membership plus per-delivery margin $\mu \cdot C$
3. **Costlo-subsidized rate:** deliveries free/discounted for members; Costco's real model (membership fees fund the low-margin logistics)

### Deliverables of Phase 3 (feeds drive F: `05_Structured_Data_and_Labels`, `10_Telemetry_and_Operations_Data`, `11_Model_Zoo_and_Benchmarks`)

* A parameter dictionary (CSV) of all cost coefficients, sourced and labelled as assumed vs. sourced
* The formula suite as executable Python module (`maij_rates.py`) with unit tests
* A sensitivity dashboard: tornado chart of which variable (wind, energy price, supervisor ratio, payload) most changes the per-delivery rate

---

## 5. Phase 4 (Weeks 19–24): The Costlo Simulator

### Objective

Group the prior phases into a single unified Roblox economy game — **"Costlo"** — that simulates the full lifecycle of a Costco-style membership retailer across five interlocking systems.

### The Five Systems

```
┌─────────────────────────────────────────────────────────────┐
│                    COSTLO SIMULATOR                         │
│                                                             │
│   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   │
│   │ 1. WAREHOUSE │──▶│ 2. SHOPPING  │──▶│ 3. DELIVERY  │   │
│   │ receiving    │   │ member econ  │   │ mixed fleet  │   │
│   │ storage/pick │   │ inventory    │   │ routes (from │   │
│   └──────────────┘   └──────────────┘   │  Phase 2-3)  │   │
│          ▲                              └──────────────┘   │
│          │                                      │           │
│   ┌──────────────┐                      ┌──────────────┐   │
│   │ 5. PROCURING │                      │ 4. LIVING    │   │
│   │ farm orders  │                      │ player life  │   │
│   │ NC farms     │                      │ expenses     │   │
│   │ freshness    │                      │ housing/car  │   │
│   └──────────────┘                      └──────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

**1. Warehouse system:** pallet receiving bays, high-bay storage, forklifting, bulk-break, and cross-docking; shrinkage/spoilage events; cold-storage zones with temperature tracking.

**2. Shopping system:** member economy (free/basic/executive tiers mirroring Costco), inventory rotation, private-label vs. branded goods, bakery and rotisserie mini-economies, checkout throughput.

**3. Delivery system (the MAIJ heart):** fleet dispatch (vans + cargo drones), route planning on the NC-style map using Phase 3's cost and energy formulas, landing-zone confirmation, perishability clocks, same-day vs next-day windows.

**4. Living system:** player life outside the store — housing costs, food bills, car/commute, wage progression from stocker to warehouse GM; player fatigue affecting job performance (human-factors data).

**5. Procuring system:** contracted NC farms supplying produce and inspected meat, crop-calendar-driven seasonality, price negotiation, freshness-at-receipt checks, and emergency re-order logistics.

### Economy Engine

Every number inside Costlo is driven by Phase 3's formulas:

* Per-delivery fee charged to members uses the rate policy ($R$) minus delivery cost ($C$)
* Spoilage uses the perishable decay model ($V(t)$)
* Fleet expansion ROI uses the break-even drone-vs-ground model
* Warehouse labor uses the supervisory-ratio math from Phase 3

### Assets Generated (feeds drive F: `01_3D_and_CAD_Models`, `02_Drone_and_Simulation_Imagery`, `03_Video_Footage_and_Simulations`, `05_Structured_Data_and_Labels`, `06_Branding_and_Graphics`, `10_Telemetry_and_Operations_Data`, `11_Model_Zoo_and_Benchmarks`)

* 3D assets: warehouse racking, forklifts, pallets, drones, farm props (exported to .blend/.glb)
* Gameplay telemetry: warehouse throughput, shopping baskets, delivery logs, procurement contracts (CSV)
* Branding: "Costlo" logo kit, store signage, private-label packaging graphics
* Benchmark scenarios: 10 standardized logistics scenarios used to test economy-balancing patches

---

## 6. How the 24-Week Micro-Roadmap Feeds the 11-Category Drive F: Structure

| Phase | Weeks | Categories Populated on F: | Data Artifact |
|---|---|---|---|
| 1. Language game | 1–8 | 04, 06, 07, 11 | Voice stems, quest corpora, AUR research logs, assistant recipes |
| 2. NC route simulator | 9–14 | 02, 03, 05, 08, 10 | Sim captures, video clips, route tables, NC node coordinates, failure logs |
| 3. Rate formulas | 15–18 | 05, 10, 11 | Parameter dictionaries, energy/cost models (Python), sensitivity dashboards |
| 4. Costlo simulator | 19–24 | 01, 02, 03, 05, 06, 10, 11 | 3D models, imagery, video, economy logs, branding, benchmark scenarios |
| Real flights (post-24) | 25+ | 02, 09, 10 | Camera calibrations, thrust curves, flight telemetry, GoPro aerials |

Notice how folders **08–11** (pre-created empty by the migration script) begin filling organically by Week 10–14 — your short-term gaps close automatically as you build, not as a separate data project.

---

## 7. Data Firewall and Ethical Guardrails (Non-Negotiable)

Applying your own school-to-sky framework:

* **Game telemetry never touches school systems.** AUR logs, route logs, and Costlo data are game-side analytics with no roster links, no school email, and no school SSO.
* **Student/classroom use of Phase 1** follows the agreement stack: superintendent discovery note → Design-Partner MOA → authorized pilot contract with privacy/security exhibits; parents control home-game continuity.
* **Aviation gating:** real-world free-flying drones are deliberately absent from the first 24 months of the education track. The simulations in Phases 2 and 4 *are* the aviation product for this phase — fully virtual, fully measurable, fully safe.
* **Rate-model transparency:** every cost coefficient in Phase 3 is labelled *sourced* (with URL) or *assumed* — never present assumptions as facts.

---

## 8. Definition of "Done" for the 6-Month Micro-Term

At Week 24 you should be able to hand someone:

1. A published Roblox language game with an anonymized AUR research dataset
2. An NC-themed route-planning game whose telemetry shows hundreds of human route decisions
3. A validated Python rate-model module reproducing published drone-vs-ground baselines
4. The Costlo simulator unifying warehouse, shopping, delivery, living, and procuring
5. An external drive F: whose 11 categories are now genuinely populated — including the four categories that started empty today
6. One integrated short-term story you can pitch to the CBYX network, TU Dortmund professors, and future NC pilot partners



---

## 9. The Alternative Direction: Macro-to-Micro (Costlo-First)

There is a compelling counter-argument, rooted in systems architecture and Roblox platform economics, for building **macro-to-micro** instead — starting with Costlo and nesting the other systems inside it:

    MACRO                                                        MICRO
    [Costlo world container] -> [Delivery module] -> [Economy math] -> [Language quests]
     (warehouse/shopping/        (NC routes as a      (rate formulas    (cashier, farm
      living/procuring shell)     Costlo job)          governing the     procurement, and
                                                       store economy)    multilingual quests
                                                                         measuring AUR)

**Why macro-to-micro works:**
1. **One flagship, one audience:** building three separate games fragments player attention; one rich world with roleplay depth produces better retention, community, and Roblox algorithm performance.
2. **Language learning is more organic inside a world:** practicing a new language as a Costlo cashier, receiving a farm shipment, or helping an NPC customer embeds the AI-usage-ratio experiment inside real roleplay rather than a standalone educational game.
3. **Delivery already needs a warehouse context:** routes make far more sense with a Costlo receiving bay as their origin and store members as their destination.
4. **Rate formulas have a real economy to govern:** the per-delivery cost and perishable-decay models become the actual rules of the Costlo simulation, not a separate theory.

**The trade-off (why micro-to-macro was proposed first):**
* Costlo has five interlocking systems - a solo founder-student risks scope creep and never shipping
* Isolating the AI-usage ratio in a clean standalone experiment produces cleaner publishable data
* A small game first stress-tests your Lua/Roblox production pipeline

**The decision matrix:**

| Priority | Recommended Direction |
|---|---|
| Publish research; fast standalone proof-points; clean data; tight scope alongside coursework | **Micro-to-Macro** (Language -> Routes -> Formulas -> Costlo) |
| Build one viral, high-retention Roblox flagship; social roleplay; organic AI-assistant contexts | **Macro-to-Micro** (Costlo shell -> Delivery job -> Formulas -> Language quests) |
| Best of both: design the macro Costlo blueprint, ship the language mechanic first as a testbed | **Dual-Track** |

Whichever direction you choose, the four modules and their data contracts are identical - only the assembly order changes.
