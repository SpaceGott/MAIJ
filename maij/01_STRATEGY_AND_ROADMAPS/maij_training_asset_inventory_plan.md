---
MAIJ DOCUMENT IDENTIFIER: PLN-MAIJ-DATA-001
TITLE: MAIJ Model-Training Asset Inventory Plan and Data Strategy
CATEGORY: Strategy & Roadmaps
EFFECTIVE DATE: 2026-11-09
VERSION: 1.0 (Draft)
OWNER: MAIJ Operations
STATUS: DRAFT — FOR INTERNAL USE
SUMMARY: Data-strategy plan establishing the eleven-category training-asset taxonomy, an honest short-term and long-term gap analysis, and milestone data priorities so every game module produces datasets that feed the next.
---

# MAIJ Model-Training Asset Inventory & Data Strategy Plan

A mission-aligned plan to locate, categorize, and organize training assets for the **MAIJ** venture, stage them onto external drive `F:`, and close the short-term and long-term data gaps between where the venture is today and where its mission requires it to be.

---

## 1. The MAIJ Mission as the Data Compass

**MAIJ** (`maij.us`) carries fresh North Carolina produce and inspected meat from small farms to restaurants, automatically, on routes that one person plans the day before. Every data category in this plan exists to train or support one of the AI systems that makes that mission possible:

* **Short-term mission (0–12 months):** prove autonomy prototypes and landing-zone detection under FAA Part 107 (visual line-of-sight, daylight, under 55 lb), produce credible demonstration media and investor/regulatory decks, and run the first controlled pilot deliveries.
* **Long-term mission (1–5 years):** a fleet of autonomous cargo drones flying beyond-visual-line-of-sight under FAA Part 135/Part 108, with one planner supervising many aircraft, automated landing-zone verification, cold-chain-verified meat delivery, predictive route planning, and fleet-dispatch AI.

Because the venture spans aviation, agriculture, logistics, computer vision, and public-facing media, its training data needs are multi-modal: vision, language, audio, geospatial, time-series telemetry, and simulation data.

---

## 2. What Is On Your Windows PC Today (the Retrospective Harvest)

The automated PowerShell migration script (`migrate-to-linux.ps1`) hunts across your scanned user folders using 20+ MAIJ-related keywords and stages matching media into seven categories under `F:\MAIJ_Model_Training_Assets`:

1. `3D_and_CAD_Models/` — drone concept airframes, payloads, gripper mechanisms, farm structures (.obj, .fbx, .stl, .step, .blend, .glb, .fcstd, .rbxm, .rbxl)
2. `Drone_and_Simulation_Imagery/` — aerial photos, farm and crop shots, hardware photos, simulation screenshots
3. `Video_Footage_and_Simulations/` — recorded flight clips, commercial footage, simulation recordings (.mp4, .mov, .webm)
4. `Audio_and_Voiceovers/` — commercial narration, voiceovers, interview audio (.wav, .mp3)
5. `Structured_Data_and_Labels/` — route tables, annotations, dataset files (.csv, .json, .parquet)
6. `Branding_and_Graphics/` — logos (SVG/PNG), storyboards, brochures, slide graphics
7. `Documentation_and_Text_Data/` — mission statements, production briefs, commercial scripts, regulatory notes, correspondence (.md, .pdf, .docx, .pptx)

**Honest assessment:** these seven categories cover roughly 80% of what currently exists on your PC, and they are excellent for *demonstration, branding, and early supervised-learning experiments*. But they are a **retrospective harvest** — what you already made — not a complete dataset for either mission horizon.

---

## 3. Short-Term Gap Analysis (0–12 Months): What You Would Be Missing

If you keep only the seven categories above, the following is missing for your near-term prototypes and demonstrations:

**1. Geospatial and airspace data for North Carolina.** The mission is explicitly geographic: NC small farms to NC restaurants, on routes planned the day before. The current categories contain no GIS layers: NC elevation models (DEM/LiDAR from NC OneMap), FAA sectional charts and controlled-airspace polygons around Raleigh-Durham (RDU), Charlotte (CLT), and Greensboro (GSO), county parcel maps, farm and restaurant coordinates, and road networks. Without this, your route-planning AI has nothing to optimize against.

**2. Runnable simulation environments, not just recorded clips.** The current plan keeps simulation *screenshots and videos* (passive outputs). Training perception and control models requires *generating new synthetic data*, which demands the simulator project files themselves: Gazebo world files, PX4 SITL configuration and parameter sets, ArduPilot configs, AirSim settings, Unreal/Unity environments, drone URDF/SDF models with sensor plugins (camera intrinsics, LiDAR configs, IMU noise profiles), and terrain meshes of NC farmland.

**3. Sensor calibration and hardware characterization data.** Your "Calibration Estimates" project hints at this already: camera intrinsic and extrinsic matrices, IMU Allan-deviation logs, motor-and-propeller thrust curves, battery discharge profiles, and temperature logs. Perception models cannot be trained responsibly without known camera models, and energy-aware route models cannot be trained without real propulsion data.

**4. Annotation and label infrastructure.** `Structured_Data_and_Labels` holds existing label files, but not the ontology they come from: class definitions (e.g. `farm_field`, `crop_row`, `landing_zone`, `tree`, `power_line`, `person`, `vehicle`, `livestock`), annotation guideline documents, and dataset-manifest files with train/val/test splits. Without these, newly collected imagery cannot be turned into reproducible training sets.

**5. Operational text from future customers.** Customer discovery interviews with NC farmers and restaurant operators, meat-inspection checklists from the NC Department of Agriculture, and hospitation/internship correspondence are the highest-value raw material for fine-tuning MAIJ's customer-facing language models. The current categories only capture what was typed, not what was spoken or interviewed.

**6. Evaluation benchmarks and experiment tracking.** A fixed set of difficult test images (low-light landings, cluttered farmyards, power lines at oblique angles) used to score every model version over time; training recipes with exact hyperparameters, seeds, and library versions; and experiment-tracking exports (MLflow/W&B). Weights without recipes are irreproducible.

---

## 4. Long-Term Gap Analysis (1–5 Years): What You Would Be Missing

If you keep only the current categories, the following is missing for a certified, autonomous fleet under FAA Part 135/Part 108:

**1. Time-series flight telemetry (black-box data).** Thousands of hours of real flight logs: GPS, IMU, battery voltage and current, motor RPM, altitude, wind estimates, airspeed, and vibration spectra. This data is the raw fuel for predictive-maintenance models, wind-aware energy models, and the reliability evidence the FAA demands for type certification and BVLOS authorization. Static imagery cannot train these models at all.

**2. Weather and micro-climate time series.** Historical METAR/TAF observations, convective-storm climatology, and low-level wind profiles across the NC Piedmont and coastal plain (from the NC State Climate Office). A "planner that plans the day before" requires demand-plus-weather forecasting models, which are trained on years of tabular weather history, not media assets.

**3. Regulatory compliance and safety-case data.** For Part 135 and Part 108 approvals you need a safety case: hazard logs, failure mode and effects analyses (FMEA), encounter-geometry datasets for sense-and-avoid verification, parachute and flight-termination test data, and human-factors data on how one planner supervises many aircraft. These are training and evidence datasets, not ordinary documents.

**4. Cold-chain and food-safety monitoring data.** MAIJ carries *inspected meat*, which makes temperature-time logs, NC Department of Agriculture compliance records, and restaurant receiving timestamps first-class data. Spoilage-prediction or automated-compliance models cannot exist without continuous cold-chain sensor streams.

**5. Market and operations data.** An NC farm directory with crop calendars (what grows when in NC), restaurant order histories, delivery-time-window constraints, and delivery-fee elasticity data ($7 vs $63 per delivery, from your earlier research). Fleet-dispatch and demand-prediction models are trained on tabular market data, never imagery.

**6. Sim-to-real bridge datasets.** Paired synthetic-versus-real observations with measured domain gaps, domain-randomization recipes, and photorealistic terrain tiles of NC farm country. This is the difference between a model that works in Gazebo and one that lands safely in a Harnett County soybean field at sunset.

**7. Human-in-the-loop supervision logs.** Every route edit made by the one planner, every intervention event, and every dispatch decision is training data for the autonomy copilot that makes "one person supervising many aircraft" possible.

**8. A versioned model zoo with reproducible recipes.** Checkpoints, evaluation splits, training scripts with exact hyperparameters, seeds, and library versions, plus benchmark datasets. A model you cannot retrain is a liability, not an asset.

---

## 5. The Expanded Target Taxonomy (11 Categories on F:)

To close both gaps, the staging layout on drive F: should grow from 7 to 11 categories as you move to Linux:

```
F:\MAIJ_Model_Training_Assets\
│
├── 01_3D_and_CAD_Models/                   # Airframes, payloads, mechanisms (.step/.blend/.fcstd originals)
├── 02_Drone_and_Simulation_Imagery/        # Aerial, farm/crop, hardware photos, sim captures
├── 03_Video_Footage_and_Simulations/       # Flight clips, commercial footage, sim recordings
├── 04_Audio_and_Voiceovers/                # Voiceovers, interviews, sound effects
├── 05_Structured_Data_and_Labels/          # Routes, annotations, datasets (.csv/.json/.parquet)
├── 06_Branding_and_Graphics/               # Logos (SVG/PNG), storyboards, collateral
├── 07_Documentation_and_Text_Data/         # Mission, briefs, regulations, correspondence
├── 08_Geospatial_and_Airspace/            # NC DEMs, LiDAR, FAA charts, farm/restaurant coordinates
├── 09_Simulation_and_Hardware_Environments/ # Gazebo worlds, PX4 configs, URDFs, sensor calibrations, thrust curves
├── 10_Telemetry_and_Operations_Data/       # Flight logs, cold-chain logs, weather history, market tables
└── 11_Model_Zoo_and_Benchmarks/            # Checkpoints, recipes, ontologies, benchmark test sets
```

The migration script creates the first seven now from your Windows files, and pre-creates folders 08–11 as empty staged homes ready to receive the missing data as you build on Linux.

---

## 6. Data Collection Priorities Mapped to Mission Milestones

| Milestone | Data to Collect First |
|---|---|
| **Now (migration)** | Recover and stage the 7 existing categories; empty-stage 08–11 |
| **First landing-zone prototype** | Annotated farm imagery, label ontology (04–05), Gazebo world of an NC farm (09), fixed benchmark images (11) |
| **First route-planner prototype** | NC elevation DEMs, FAA airspace polygons, farm/restaurant coordinate tables (08) |
| **First hardware flights** | Camera calibration matrices, thrust curves (09); flight telemetry logs, GoPro aerial footage (10, 02–03) |
| **First commercial/demo video** | Raw footage in originals, voiceover stems, storyboards (03, 04, 06) |
| **Part 107 demo flights** | Telemetry logs, landing logs, battery discharge data (10) |
| **Part 135/108 application** | Hazard logs, FMEA data, encounter-geometry datasets, cold-chain sensor streams (10, 07) |
| **Fleet scale** | Continuous telemetry pipeline, weather time series, market/operations tables, operator-supervision logs (10) |

---

## 7. The Linux Toolchain That Makes This Concrete

Every one of the 11 categories has first-class tooling on **Ubuntu 24.04 LTS**:

* **Geospatial (08):** QGIS, GDAL, Python geospatial stack (GeoPandas, rasterio, shapely)
* **Simulation (09):** Gazebo Garden/Harmonic, PX4 SITL, ROS 2 (Jazzy Jalisco on Ubuntu 24.04), Isaac Sim
* **Telemetry (10):** FlightPlot, MAVLink/pymavlink parsing scripts, DuckDB/Polars for time-series analysis
* **Vision models (02, 11):** PyTorch + CUDA, Ultralytics YOLOv11/YOLOv8, torchvision
* **Language models (07, 11):** Hugging Face transformers, vLLM/Ollama for local inference, OpenAI and Gemini APIs
* **Audio (04):** Audacity, FFmpeg, Whisper for transcription of interviews
* **3D/CAD (01):** Blender, FreeCAD, MeshLab — all native, GPU-accelerated
* **Data pipelines:** Python, Pandas, JupyterLab, DVC for dataset versioning, MLflow for experiment tracking

---

## 8. Summary Answer to Your Question

**Short-term:** you would be missing geospatial and airspace data for North Carolina, runnable simulation project files (not just recorded clips), sensor calibration data, a label ontology, customer-discovery interview data, and a fixed evaluation benchmark. These are what turn collected media into trainable, reproducible models for your first prototypes and demonstrations.

**Long-term:** you would be missing time-series flight telemetry, weather history, regulatory safety-case data, cold-chain temperature logs, market/operations tabular data, sim-to-real bridge datasets, operator-supervision logs, and a versioned model registry. These are what the FAA, the cold-chain, and the "one planner supervising many aircraft" autonomy require to exist as certified, operating systems.

The practical move is: stage the 7 categories you have today onto drive F:, keep the 4 new categories as empty homes on the drive, and fill them in the order of the milestone table above once you are on Linux, where the entire robotics and AI toolchain is native.
