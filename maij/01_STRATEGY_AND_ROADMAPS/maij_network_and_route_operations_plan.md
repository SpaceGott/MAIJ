---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-OPS-001
TITLE: MAIJ Network and Route Operations Plan
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Operational plan for the German-train-modeled route network: ICE/RE/S-Bahn stop mapping across North Carolina, eVTOL/RAM vehicle-class assignment, the simulated-AI-vector schedule system, target farm criteria (<100 acres), vertipad and charging infrastructure, and the simulation-to-reality transfer path.
---

# MAIJ Network and Route Operations Plan

## 1. Network Concept: the German-Train Hierarchy

MAIJ routes are organized exactly like Germany's ICE, RE, and S-Bahn tiers:

| Tier | NC stops | Vehicle class | Role |
|---|---|---|---|
| **ICE** | Elizabeth City, Hickory, Lumberton, New Bern, Henderson | RAM (50–250 mi) | Long-range trunk corridors connecting regions |
| **RE** | Burlington, Sanford, Goldsboro, Tarboro | eVTOL/RAM hybrid | Regional feeds between ICE stops |
| **S-Bahn** | Production hubs in towns surrounding ICE/RE stops | eVTOL (0–50 mi) | Last-mile collection from farms to hubs |

Target producers are **local mom-and-pop farms and farms smaller than 100 acres**, where delivery economics benefit most from aerial consolidation.

## 2. Schedule and Dispatch: Simulated AI Vectors

* Public transportation is treated as **active IFR clearances** in the simulation.
* Departures are calculated, reroutes issued, and schedules managed as a **simulated AI vector** inside the game before live operations.
* Airspace slot scheduling with variable-speed arrivals decouples demand from fixed timetables.
* Decentralized route economics and community airspace deconfliction are trained as part of neural control inside MAIJ Studios.

## 3. Infrastructure Coupling

* Dedicated **vertipads** at hubs; **megawatt charging logs** and battery-turnaround staging per CAMP-MAIJ-001.
* Airport **microgrid peak-load** planning, thermal management, and localized microgrid demand profiling.
* Volatile elements (aircraft type, eVTOL propeller designs, battery mechanisms, operational dates) tracked in an assumptions register.

## 4. Simulation-to-Reality Transfer

The in-game route simulator doubles as the dispatcher qualification device (TRN-MAIJ-001) and as the calibration source for real-world route economics, closing the flywheel from PLN-MAIJ-STR-001.
