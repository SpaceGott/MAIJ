# Cadence Playbook

Execution patterns proven across the founder's daily and weekly workflow — the dozen-plus weekly "Execute the Next Soul Vault Library Roadmap Week" tasks in the *Wayfarer's Light* MMO project, the evidence-gated Jetson Nano RTX carrier review, and the daily email/agenda automation.

---

## 1. The Weekly Bounded-Task Pattern

Instead of one monolithic "build the game" task, scope weekly tasks with fixed envelopes:

| Element | Rule |
|---|---|
| **Title convention** | "Execute the next [Module/Game] roadmap week" |
| **Scope per week** | exactly one module's must-have scope item + its KPI wiring + one documentation artifact |
| **Cost envelope** | 10–200 agent credits per weekly run; large synthesis tasks (e.g. storyboards) cost 1,500–9,000 credits — budget those deliberately |
| **Commit trailer** | each weekly run produces at least one clean git commit on the feature branch |
| **Category artifact** | each weekly run deposits at least one file into the 11-category taxonomy |

## 2. Evidence-Gated Progress (from the G0–G6 Carrier Pattern)

Adopt the gate pattern used in the hardware lab for any high-risk subsystem (the AI-assistant NPC, the rate formulas, the payment economy):

1. **HOLD by default:** progress is never inferred; it must be proven with uploaded or committed evidence (a playable build, a passing test suite, a collected dataset).
2. **One gate per milestone:** each milestone has exit criteria and a named owner.
3. **Bounded remediation chunks:** if a gate fails, the next task is a focused remediation chunk (up to 120 minutes) rather than an open-ended retry.
4. **No gate skipping:** economy formulas must pass their Python test suite before embedding in the game; the game must emit verified telemetry before claims are made in marketing documents.

## 3. Modular Sequencing Pattern

From the *Wayfarer's Light* experience — where economy interaction systems, combat systems, and non-economy systems were developed as separate, sequenced streams:

1. **Economy first:** build the currency, trade, and inventory spine before combat or quest systems; it gives every other system a resource to work with.
2. **Combat/role mechanics second:** each role (planner, driver, cashier, farmer) has its own interaction spec from `module-spec-template.md`.
3. **Non-gameplay systems third:** UI, telemetry, settings, and tutorials.
4. **Meta-loop last:** the flywheels that connect modules (e.g. delivery telemetry calibrating the rate formulas).

## 4. Continuous Category Population

Never batch asset filing to the end. Every weekly task must:

* deposit its assets into the correct `NN_Name` category folder,
* update the `CHANGELOG.md` of the documentation repository, and
* verify the flywheels — the producer module's output was actually consumed by at least one downstream module.

## 5. Definition-of-Done Checklist

A weekly roadmap task is done when:

- [ ] Playable build committed to the repo (places/modules for Roblox; `.py` modules for formulas)
- [ ] At least one telemetry event verified (KPI measurable)
- [ ] One documentation artifact updated (module spec, README, or formula reference)
- [ ] Assets filed in the 11-category taxonomy with no junk
- [ ] Git commit with a descriptive message
