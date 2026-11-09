# Rate-Formula Toolkit

Reusable mathematical models for delivery-economy simulations. Every model declares units, inputs, and the sourced-versus-assumed provenance of each coefficient.

## 1. Per-Delivery Cost Model

$$C = C_{\text{fixed}} + c_t \cdot t + c_d \cdot d + c_w \cdot w + c_e \cdot E + C_{\text{ins}} + C_{\text{ovh}}$$

| Symbol | Meaning | Example Unit | Provenance rule |
|---|---|---|---|
| $C_{\text{fixed}}$ | amortized aircraft capital cost per flight | $/flight | source: aircraft price ÷ (flights/day × days/yr × years) |
| $c_t$ | supervisor labor per minute | $/min | one planner supervising $N$ aircraft → $c_t = \text{wage}/(N \times 60)$ |
| $c_d$ | distance-variable wear/maintenance | $/km | assumed: 3–5% of aircraft value per 100 flight-hours |
| $c_w$ | payload-capacity cost | $/kg | structural penalty of larger airframe |
| $c_e$ | energy cost | $/kWh | retail electricity or aviation fuel |
| $C_{\text{ins}}$ | insurance per flight | $/flight | quote or assumed 1–3% of revenue |
| $C_{\text{ovh}}$ | data-link, regulatory, landing overhead | $/flight | assumed fixed allocation |

**Break-even:** compare $C_{\text{drone}}$ against $C_{\text{ground}}(d,w) = C_{\text{van}} + c_{\text{driver}} \cdot t_{\text{ground}} + c_{\text{fuel}} \cdot d$. A delivery arc is drone-economical when $C_{\text{drone}} < C_{\text{ground}}$.

**Calibration targets (label as sourced):** Amazon drone delivery ≈ $63 (2025 projection), DroneUp ≈ $30 with a < $7 goal, against $6–10 ground delivery. The model must reproduce those published baselines before live use.

## 2. Drone Energy Consumption Model

$$P(w, v) = P_{\text{hover}}(w) \cdot \frac{t_{\text{hover}}}{t} + \bigl(P_{\text{parasitic}}(v_{\text{rel}}) + P_{\text{induced}}(w, v_{\text{rel}})\bigr) \cdot \frac{t_{\text{cruise}}}{t}$$

$$E = P(w, v) \cdot t$$

with wind correction $v_{\text{rel}} = v - v_{\text{wind}}\cos\theta$ where $\theta$ is the angle between flight heading and wind direction. Output $E$ in kWh; feed to $c_e \cdot E$ in the cost model.

## 3. Perishable Shelf-Life Decay (Value Model)

$$V(t) = V_0 \cdot \exp\!\bigl(-\lambda_{\text{crop}}(T) \cdot t\bigr)$$

Value $V$ is delivered product value; $\lambda_{\text{crop}}$ is the crop-specific decay rate at ambient temperature $T$. For meat, apply a binary cold-chain constraint: if log temperature $T > T_{\text{safe}}$ for more than $\tau_{\text{crit}}$ minutes, regulatory acceptance fails ($V=0$) — the NC Department of Agriculture rule as a hard route constraint.

## 4. Route Formulation (VRPTW)

Minimize total delivery cost subject to capacity, time windows, battery energy, and the cold-chain constraint:

$$\min \sum_{k} \sum_{i,j} C_{ijk} \cdot x_{ijk}$$

$$\text{s.t.} \quad \sum_{i} w_i \le W_k, \quad a_j \le \text{arrival}_j \le b_j, \quad E_k \le E_{\text{battery}} \quad (\text{+ cold-chain constraint})$$

Ship a simplified heuristic in-game (greedy nearest-demand-with-window); run professional solvers (OR-Tools, VRPy) on the Linux toolchain.

## 5. Rate / Pricing Policy

1. **Distance-tiered rate:** $R(d) = R_{\text{base}} + r \cdot d$
2. **Cost-plus subscription:** monthly farm membership plus per-delivery margin $\mu \cdot C$
3. **Costco-style subsidized rate:** deliveries free or discounted for members; membership fees absorb low-margin logistics

## Quality Rules

* Every coefficient must be labelled **sourced** (with URL) or **assumed** in the parameter dictionary.
* Ship the formula suite as a testable Python module (`maij_rates.py`) with unit tests before embedding in a game.
* Re-calibrate quarterly against published benchmarks; log each re-calibration in category 11.
