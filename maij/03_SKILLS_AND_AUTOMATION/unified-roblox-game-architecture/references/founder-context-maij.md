# MAIJ Founder Context Corpus

A sourced factual reference distilled from all MAIJ project tasks, the NVIDIA xr-ai fork repository (`SpaceGott/MAIJ`), and the founder's adjacent work streams. Use these facts when writing any MAIJ-related plan, pitch, or simulation document.

---

## 1. Mission and Identity

| Form | Wording |
|---|---|
| **Full mission (slide)** | "Our mission is to connect North Carolina's small farms to its restaurants and tables through autonomous drone delivery, so local produce and meat arrive fresh, farmers can focus on growing, and every guest can taste where their food comes from. The next generation of pilots and planners begins in the classroom." |
| **Short mission (video card)** | "Autonomous drone delivery of local North Carolina produce and meat, from farm to restaurant." |
| **Draft working mission** | "Carry fresh North Carolina produce and inspected meat from small farms to restaurants, automatically, on routes that one person plans the day before." |
| **Tagline** | *From a child's hand, to your plate. North Carolina, connected.* |
| **Domain** | `maij.us` (with Microsoft 365 tenant) |
| **Code repository** | `https://github.com/SpaceGott/MAIJ` — fork of NVIDIA's `xr-ai` |

## 2. Economics (All figures flagged for provenance)

| Figure | Value | Provenance |
|---|---|---|
| Concept aircraft | under 55 lb MTOW, ~20 lb payload | **Assumed** (proposed concept; no source) |
| Aircraft price | ~$25,000 | **Assumed** (commercial cargo drones span ~$5k–$50k) |
| Amortized capital cost | ~$1.67 per flight | **Calculated** (10 flights/day × 300 days/yr × 5 years) |
| Supervisor labor | $t_c \approx$ wage ÷ ($N \times 60$) | **Model** (one planner supervising many aircraft) |
| Amazon drone delivery (2025 projection) | ~$63 per delivery | **Sourced** |
| DroneUp | ~$30 per delivery (goal < $7) | **Sourced** |
| Comparable drones payloads | Zipline 4–8 lb; Walmart & Amazon cap ~5 lb | **Sourced** |
| Ground delivery cost | $6–$10 per delivery | **Sourced** |
| Excluded (snippet-only) | WSJ $13.50-vs-$1.90; PwC $2-by-2034 | **Not verified — do not cite** |

## 3. Regulatory Environment

* **FAA Part 107:** under 55 lb, visual line of sight, daylight, ≤ 400 ft AGL.
* **FAA Part 135:** the only current pathway for paid cargo beyond visual line of sight.
* **FAA Part 108 (BVLOS rulemaking):** not yet law; final rule at the White House review office since **10 July 2026** — verify before any public presentation.
* **North Carolina law:** state UAS rules plus NC Department of Agriculture **meat-inspection** oversight and county health-department receiving rules.
* **Real NC drone operations exist today:** Zipline in Charlotte, Flytrex in Holly Springs and Raeford, UPS medical deliveries at WakeMed in Raleigh.

## 4. Geography and Operations

* **Hub-and-spoke:** hubs placed in their respective NC towns (Triangle/Piedmont/eastern NC corridor) — matches the route simulator's town-hub map.
* **Operating base:** the Raleigh/Durham/Greensboro corridor aligns best with the hub network, restaurant density, NC State drone research, and within three hours of ECSU.
* **Timeline anchor:** the founder's CBYX/PPP fellowship in Germany ends **June 2027** — the fixed milestone that all physical and legal milestones must be scheduled around.

## 5. Education Pipeline and Ethics

* The classroom clause is an **educational skills pipeline** (simulations, small classroom drones, youth academies such as ECSU's Drone Exploration Academy) — **never claim that children train the real aircraft's controller**.
* The game-side telemetry and learning data must stay strictly firewalled from school/institutional systems (applying the school-to-sky agreement stack: discovery note → Design-Partner MOA → authorized pilot contract with parent-controlled home-game continuity).
* "Windtunnels" from early notes was corrected to **high tunnels** (hoop houses) for year-round growing.

## 6. Development Environment Decision

* **Chosen Linux GUI:** **Pop!_OS 24.04 LTS (NVIDIA)** with the COSMIC desktop (Rust/libcosmic), chosen because it ships with NVIDIA drivers pre-bundled and because its GUI stack matches the long-term custom GUI vision.
* **Roblox tooling:** Roblox **Studio** runs inside **Vinegar (Flatpak)** for building, scripting, and publishing all roadmap games natively on Linux; the Roblox **Player** is blocked by Hyperion anti-cheat on Linux (playtests via cloud gaming or a Windows dual-boot).
* **Future custom GUI:** a phased progression from a Tauri MVP dashboard → native libcosmic operations workstation → FAA-style flight-operations shell (see `custom_gui_roadmap.md`).
