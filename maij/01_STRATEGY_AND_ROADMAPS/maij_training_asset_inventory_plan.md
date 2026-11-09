---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-DATA-001
TITLE: MAIJ Model-Training Asset Inventory Plan and Data Strategy
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.1 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Data-strategy plan establishing the eleven-category training-asset taxonomy, an honest short-term and long-term gap analysis against the dual-mission (education venture + drone logistics), and milestone data priorities including DAA, C2, load-telemetry, and grid-demand data streams.
---

# MAIJ Model-Training Asset Inventory & Data Strategy Plan

## 1. Dual-Mission Data Compass

MAIJ now carries two missions, each with its own data needs:

* **Venture mission:** *make foundational learning more engaging by connecting physical books, hands-on exploration, and interactive digital experiences; support — not replace — educators; introduce STEAM and aviation-inspired problem-solving. Immediate focus: a hardware-software MVP; broader robotics and aviation research on separate tracks.*
* **Logistics mission:** *autonomous drone delivery of local NC produce and meat from small farms to restaurants, on routes planned the day before.*

**Brand values:** Human-centered, reliable, inclusive *(placeholder)*. **Core question:** *"What is the balance?"* — human–machine interaction in AI–human learning. **MAIJ Studios:** adaptable modular simulation-based flight models, control logic, localized decision-making, sensor pipelines.

## 2. What Is On Your Windows PC Today (Retrospective Harvest)

The PowerShell migration script stages matching media into seven categories:

1. `3D_and_CAD_Models/` — drone concept airframes, payloads, gripper mechanisms, farm structures (.obj/.fbx/.stl/.step/.blend/.glb/.fcstd/.rbxm/.rbxl)
2. `Drone_and_Simulation_Imagery/` — aerial photos, farm/crop shots, hardware photos, sim captures
3. `Video_Footage_and_Simulations/` — recorded flight clips, commercial footage, sim recordings (.mp4/.mov/.webm)
4. `Audio_and_Voiceovers/` — voiceovers, interview audio (.wav/.mp3)
5. `Structured_Data_and_Labels/` — route tables, annotations, dataset files (.csv/.json/.parquet)
6. `Branding_and_Graphics/` — logos (SVG/PNG), storyboards, brochures, slide graphics
7. `Documentation_and_Text_Data/` — mission statements, briefs, scripts, regulatory notes (.md/.pdf/.docx/.pptx)

These seven categories cover roughly 80% of what currently exists — a **retrospective harvest**, not a complete dataset for either mission horizon.

## 3. Short-Term Gap Analysis (0–12 Months): What You Would Be Missing

1. **NC geospatial and airspace data:** DEM/LiDAR (NC OneMap), FAA charts and controlled-airspace polygons around RDU/CLT/GSO, county parcel maps, ICE/RE/S-Bahn stop coordinates, farm and restaurant coordinates, road networks.
2. **Runnable simulation project files** (not just recorded clips): Gazebo worlds of NC farms, PX4 SITL configs, URDFs with sensor locations and noise models, reproducible worlds.
3. **Sensor calibration data:** camera intrinsics/extrinsics, thrust curves, LiDAR calibrations, DAA-sensor aperture calibrations.
4. **Label ontology and annotated datasets:** annotated farm imagery with a versioned taxonomy, segmentation masks for landing zones and crops.
5. **Customer-discovery data:** transcripts/summaries from farm, restaurant, and educator interviews.
6. **A fixed evaluation benchmark:** held-out test set for every model before claims are made.
7. **Simulated AI-vector schedule data:** logs of departure calculations, reroutes, and IFR-style public-transit clearance events.
8. **Costlo waste-rate KPI benchmarks:** the $250/$55k, $1,800/$155k, $800/$176k perishability/price-tuning targets.

## 4. Long-Term Gap Analysis (1–5 Years): What the Certified Missions Need

1. **Time-series flight telemetry:** IMU, GPS, attitude, vibration, motor current at scale — for Part 135 airworthiness trends.
2. **Weather history:** per-arc wind/gust/temperature series for energy-model calibration.
3. **Safety-case data:** hazard logs, FMEA data, encounter-geometry datasets for DAA human-equivalent safety claims.
4. **Cold-chain logs:** per-flight digital temperature streams for NC meat-inspection compliance.
5. **Market/operations tables:** demand seasonality, restaurant purchase patterns, crop calendars.
6. **Sim-to-real bridge datasets:** identical missions flown in simulation and in reality, time-stamped.
7. **Operator-supervision logs:** human interventions, alarm responses, fatigue telemetry — for the one-planner-supervising-many-aircraft model.
8. **Versioned model zoo:** checkpoints, recipes, splits, benchmark datasets.
9. **Load-telemetry profiles:** the 1,600–1,750 lb envelope (300 lb vegetables, 1,000 lb dry goods, 500 lb meat) across eVTOL (0–50 mi) and RAM (50–250 mi) missions.
10. **Encrypted C2 telemetry:** link-health and redundancy data for Part 135 BVLOS compliance.
11. **Grid and infrastructure data:** vertipad megawatt-charging logs, airport microgrid peak-load profiles, battery-turnaround and thermal-management telemetry.

## 5. The Expanded Target Taxonomy (11 Categories on F:)

```
F:\MAIJ_Model_Training_Assets\
├── 01_3D_and_CAD_Models/                   # Airframes, payloads, mechanisms
├── 02_Drone_and_Simulation_Imagery/        # Aerial, farm/crop, hardware photos, sim captures
├── 03_Video_Footage_and_Simulations/       # Flight clips, commercial footage, sim recordings
├── 04_Audio_and_Voiceovers/                # Voiceovers, interviews, sound effects
├── 05_Structured_Data_and_Labels/          # Routes, annotations, datasets
├── 06_Branding_and_Graphics/               # Logos, storyboards, collateral
├── 07_Documentation_and_Text_Data/         # Mission, briefs, regulations, correspondence
├── 08_Geospatial_and_Airspace/            # NC DEMs, LiDAR, FAA charts, farm/restaurant coordinates
├── 09_Simulation_and_Hardware_Environments/ # Gazebo worlds, PX4 configs, URDFs, calibrations, thrust curves
├── 10_Telemetry_and_Operations_Data/       # Flight logs, cold-chain logs, weather, grid profiles
└── 11_Model_Zoo_and_Benchmarks/            # Checkpoints, recipes, ontologies, benchmark test sets
```

The migration script stages the first seven now from Windows files, and pre-creates 08–11 as empty staged homes.

## 6. Data Collection Priorities Mapped to Mission Milestones

| Milestone | Data to Collect First |
|---|---|
| Now (migration) | Stage 01–07; empty-stage 08–11 |
| Landing-zone prototype | Annotated farm imagery (05), Gazebo NC-farm world (09), benchmark images (11) |
| Route-planner prototype | NC DEMs, FAA airspace, ICE/RE/S-Bahn coordinates (08) |
| Hardware flights | Calibrations, thrust curves (09); telemetry logs (10) |
| Demo media | Raw footage originals, voiceover stems (03, 04, 06) |
| Part 107 demos | Telemetry, landing logs, battery discharge data (10) |
| Part 135 BVLOS filing | DAA encounter datasets, encrypted-C2 telemetry, cold-chain streams, grid logs (10, 07) |
| Fleet scale | Continuous telemetry pipeline, weather series, supervision logs (10) |

## 7. The Pop!_OS Toolchain That Makes This Concrete

All 11 categories have first-class tooling on **Pop!_OS 24.04 LTS (NVIDIA)**: QGIS/GDAL (08), Gazebo/PX4/ROS 2 (09), FlightPlot/pymavlink/DuckDB (10), PyTorch+CUDA/YOLO (02, 11), Transformers/vLLM (07, 11), Audacity/Whisper (04), Blender/FreeCAD (01), and Python/Pandas/DVC/MLflow for pipelines — all GPU-accelerated natively.

## 8. Summary Answer

**Short-term:** you would miss geospatial/airspace data for North Carolina, runnable simulation files, sensor calibrations, an ontology, discovery interviews, a fixed benchmark, simulated-AI-vector schedule logs, and Costlo waste-rate KPI benchmarks.
**Long-term:** you would miss flight telemetry, weather history, DAA/C2 safety-case data, cold-chain logs, market tables, sim-to-real datasets, operator-supervision logs, model versioning, the 1,600–1,750 lb load profiles, and grid/charging telemetry.

Stage the seven categories you have today onto drive F:, keep the four new ones as empty homes, and fill them in milestone order once you are on Pop!_OS, where the entire robotics and AI toolchain is native.
