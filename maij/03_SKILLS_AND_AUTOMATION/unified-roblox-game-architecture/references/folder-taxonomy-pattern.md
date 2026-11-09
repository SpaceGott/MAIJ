# The 11-Category Asset Taxonomy Pattern

Use this pattern whenever a multi-concept Roblox simulation game needs a shared folder structure on an external drive or repository so that every module's inputs and outputs support the others.

## Design Rules

1. Every category is **numbered** so the staging structure is deterministic across tools.
2. Every category has a declared **purpose**, **allowed file types**, a **populated-by** phase, and **consumer** modules.
3. Categories 01–07 are harvested retroactively from existing files; categories 08–11 are forward-looking and begin life as **pre-created empty folders** that fill organically as each phase is built.
4. Folders support each other through declared flywheels: every module's output file must land in a category that at least one other module consumes.
5. Never mix game-side data with institutional/student data (data-firewall rule).

## Category Specification

| # | Name | Purpose | File Types | Populated By | Consumed By |
|---|---|---|---|---|---|
| 01 | `01_3D_and_CAD_Models` | Airframes, payloads, mechanisms, props | `.step .blend .fcstd .obj .fbx .stl .glb .rbxm .rbxl` | Existing files → 3D phase | Studio places, sims |
| 02 | `02_Drone_and_Simulation_Imagery` | Aerial, farm/crop, hardware photos, sim captures | `.png .jpg .jpeg .webp .svg` | Existing files → sims | Training datasets, marketing |
| 03 | `03_Video_Footage_and_Simulations` | Flight clips, commercials, sim recordings | `.mp4 .mov .webm` | Existing files → sims | Marketing, multimodal ML |
| 04 | `04_Audio_and_Voiceovers` | Voiceovers, interviews, sound effects | `.wav .mp3 .ogg` | Existing files → voice work | In-game audio, speech ML |
| 05 | `05_Structured_Data_and_Labels` | Routes, annotations, dataset files | `.csv .json .parquet` | Existing files → route sim | Formula calibration, ML |
| 06 | `06_Branding_and_Graphics` | Logos (SVG/PNG), storyboards, collateral | `.svg .png .psd .ai` | Existing files → brand work | Studio UI, marketing |
| 07 | `07_Documentation_and_Text_Data` | Mission, briefs, regulations, correspondence | `.md .pdf .docx .pptx .txt` | Existing files → writing | LLM fine-tune, compliance |
| 08 | `08_Geospatial_and_Airspace` | DEMs, LiDAR, FAA charts, node coordinates | `.geojson .tif .kml .csv .pdf` | Route sim (Phase 2) | Route solver, maps |
| 09 | `09_Simulation_and_Hardware_Environments` | Gazebo worlds, PX4 configs, URDFs, calibrations, thrust curves | `.world .sdf .urdf .param .yaml` | Real-sim transition | Sim-to-real transfer |
| 10 | `10_Telemetry_and_Operations_Data` | Flight logs, cold-chain logs, weather, market tables | `.ulg .csv .json .parquet .db` | Flights & economy sim | Predictive models, FAA evidence |
| 11 | `11_Model_Zoo_and_Benchmarks` | Checkpoints, recipes, ontologies, benchmarks | `.onnx .pt .safetensors .yaml .json` | Training runs | Next-gen autonomy |

## Flywheel Matrix

Every row declares one producer → consumer relationship that justifies the category's existence:

| Producer (Folder) | Output Artifact | Consumer (Folder) | Effect |
|---|---|---|---|
| 02 (imagery) | Annotated farm/landing-zone frames | 05 (labels) | Training-ready detection dataset |
| 02 + 05 | YOLO dataset manifest | 11 (zoo) | Trainable vision model |
| 08 (geospatial) | NC node coordinates & DEMs | 09 (sims) + 05 (routes) | Realistic simulated routes |
| 09 (sims) | Per-arc energy observations | 10 (telemetry) | Formula calibration data |
| 05 + 10 | Calibrated cost coefficients | Phase 3 (formulas) | Executable rate engine |
| Phase 3 formulas | `maij_rates.py` | Phase 4 (economy) | Costlo simulation rules |
| Phase 4 economy | Play-session telemetry | 10 (telemetry) | Market-demand datasets |
| 04 (audio) | Dialogue stems | Phase 1 assistant NPC | Authentic voice experience |
| Phase 1 telemetry | Anonymized AUR research logs | 05 + 07 (data + docs) | Publishable learning-science artifact |

## Lifecycle Rules

* **Audit mode first:** always run the inventory script before copying; review the HTML report so no junk enters the taxonomy.
* **Keep originals:** never downscale images, re-encode video, or flatten parametric CAD during staging.
* **Folder ownership:** one named producer per category; a consumer may only *read*, never write directly into another category's folder.
* **Deprecation:** empty a category only after its producer and consumer relationships are removed from this document; archive the emptied folder under `_archive/<name>_YYYYMMDD/` instead of deleting.
