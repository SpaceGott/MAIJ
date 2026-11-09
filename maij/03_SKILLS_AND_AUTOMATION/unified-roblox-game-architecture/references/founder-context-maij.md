# MAIJ Founder Context Corpus

A sourced factual reference distilled from all MAIJ project tasks, the NVIDIA xr-ai fork repository (`SpaceGott/MAIJ`), and the founder's adjacent work streams. Use these facts when writing any MAIJ-related plan, pitch, or simulation document.

---

## 1. Mission and Identity

| Form | Wording |
|---|---|
| **Venture mission (refined)** | "Make foundational learning more engaging by connecting physical books, hands-on exploration, and interactive digital experiences. The project aims to support — not replace — educators while introducing learners to STEAM and aviation-inspired problem-solving. Its immediate focus is a hardware-software MVP, with broader robotics and aviation research pursued through separate development tracks." |
| **Logistics mission (full)** | "Connect North Carolina's small farms to its restaurants and tables through autonomous drone delivery, so local produce and meat arrive fresh, farmers can focus on growing, and every guest can taste where their food comes from. The next generation of pilots and planners begins in the classroom." |
| **Short mission (video card)** | "Autonomous drone delivery of local North Carolina produce and meat, from farm to restaurant." |
| **Working draft** | "Carry fresh North Carolina produce and inspected meat from small farms to restaurants, automatically, on routes that one person plans the day before." |
| **Tagline** | *From a child's hand, to your plate. North Carolina, connected.* |
| **Brand values** | Human-centered, reliable, inclusive *(inclusive is a placeholder)* |
| **MAIJ Studios** | "Provides adaptable modular simulation-based flight models, control logic, localized decision-making, and sensor pipelines." |
| **The core question** | *"What is the balance?"* — with human–machine interaction in AI–human learning. |
| **Domain** | `maij.us` (with Microsoft 365 tenant) |
| **Code repository** | `https://github.com/SpaceGott/MAIJ` — fork of NVIDIA's `xr-ai` |

## 2. Aircraft Classes and Load Profile

| Item | Value | Provenance |
|---|---|---|
| Concept aircraft average load | 1,600–1,750 lbs (3–4 days of produce & supplies) | **Declared requirement** |
| Vegetables | 300 lbs @ 30 lb per case | Declared requirement |
| Dry goods (oil, rice, beans) | 1,000 lbs | Declared requirement |
| Meat | 500 lbs @ 85–120 lb per case | Declared requirement |
| eVTOL class | 0–50 mile range → S-Bahn stop to RE or ICE | Declared requirement |
| RAM class | 50–250 mile range → RE + ICE stop distance | Declared requirement |
| Aircraft price (concept) | ~$25,000 | Assumed (cargo drones span ~$5k–$50k) |
| Amortized capital cost | ~$1.67 per flight | Calculated (10 flights/day × 300 days/yr × 5 yr) |
| Volatile elements (track separately) | Aircraft type & eVTOL propeller designs, battery mechanisms, operational dates | Acknowledged — keep isolated in assumptions registers |

## 3. Economics

| Figure | Value | Provenance |
|---|---|---|
| Amazon drone delivery (2025 projection) | ~$63 per delivery | Sourced |
| DroneUp | ~$30 (goal < $7) | Sourced |
| Comparable drones payloads | Zipline 4–8 lb; Walmart & Amazon cap ~5 lb | Sourced |
| Ground delivery cost | $6–$10 | Sourced |
| Costlo simulation waste targets | $250 waste on $55k weekly sales; $1,800 on $155k; $800 on $176k | Simulation KPI |
| Excluded (snippet-only) | WSJ $13.50-vs-$1.90; PwC $2-by-2034 | **Not verified — do not cite** |

## 4. Regulatory Environment

* **Target certification:** **FAA Part 135 BVLOS**, fleet operations, serving larger/enterprise accounts.
* **Part 108 analysis:** Part 108 caps MTOW at **1,320 lbs including cargo and batteries** — since the payload alone is 1,600–1,750 lbs, Part 108 cannot fit this aircraft, making Part 135 the only available pathway. Part 108's final rule has been at the White House review office since **10 July 2026** — verify before presentations.
* **Permit strategy:** operating permits focused on **rural delivery** with **fast-tracked small fleets**.
* **Technical requirements:** detect-and-avoid (DAA) with **human-equivalent safety**, encrypted **command-and-control (C2)** link resiliency, and **Remote Broadcast ID**.
* **Part 135 documentation set required:** Flight Manual (GOM/FOM), Maintenance Program (CAMP), Training Syllabus, formalized Safety Management System (SMS).
* **NC law:** state UAS rules plus NC Department of Agriculture **meat-inspection** oversight and county health-department receiving rules.
* **Competitors:** Zipline, UPS Flight Forward, Wing, Prime Air, Causey Aviation / Flytrex.
* **Real NC drone operations:** Zipline (Charlotte), Flytrex (Holly Springs & Raeford), UPS (WakeMed Raleigh).

## 5. Network: the German-Train Route Model

Route operations are modeled on the German train system, with public transportation treated as **active IFR clearances**, departures calculated, reroutes issued, and schedules managed as a **simulated AI vector**:

| Tier | NC stops | Role |
|---|---|---|
| **ICE** | Elizabeth City, Hickory, Lumberton, New Bern, Henderson | Long-range trunk network |
| **RE** | Burlington, Sanford, Goldsboro, Tarboro | Regional feeds between ICE stops |
| **S-Bahn** | Produce and meat production hubs in smaller towns surrounding ICE and RE stops, targeting **local mom-and-pop farms and farms smaller than 100 acres** | Last-mile collection from farms to hubs |

Vehicles map to the tiers: **eVTOL** covers 0–50 miles (S-Bahn to RE/ICE); **RAM** covers 50–250 miles (RE + ICE distances).

## 6. Energy and Grid Infrastructure

Airspace slot scheduling and trajectory management with variable-speed arrivals are coupled to airport **microgrid peak loads** and **turnaround power staging**. The infrastructure revision program covers dedicated **vertipads**, **megawatt charging logs**, **battery turnaround logistics**, **thermal management**, and **localized microgrid demand planning**.

## 7. Education Pipeline, Ethics, and Timeline

* The classroom clause is an educational skills pipeline — **never claim that children train the real aircraft's controller**.
* The game-side telemetry and learning data stay strictly firewalled from school/institutional systems (discovery note → Design-Partner MOA → authorized-pilot contract with parent-controlled home-game continuity).
* "Windtunnels" in early notes was corrected to **high tunnels** (hoop houses).
* **Timeline anchor:** the founder's CBYX/PPP fellowship in Germany ends **June 2027** — all physical milestones are scheduled around it. Immediate work is the hardware-software MVP; aviation/robotics research runs on separate tracks.
* **GUI decision:** Pop!_OS 24.04 LTS (NVIDIA) with COSMIC (Rust/libcosmic); Roblox Studio runs via Vinegar on Linux (player blocked by Hyperion anti-cheat); custom GUI is the long-term vision.
