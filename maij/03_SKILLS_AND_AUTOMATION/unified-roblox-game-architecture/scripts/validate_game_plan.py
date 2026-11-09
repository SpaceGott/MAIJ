#!/usr/bin/env python3
"""Validate a game-architecture-plan.md file against required sections and consistency rules."""
import sys, re
from pathlib import Path

REQUIRED_HEADINGS = [
    "Game Identity", "Module Inventory", "Flywheel Graph",
    "Build-Order Decision", "Folder Taxonomy", "Data Firewall",
    "Timeline",
]

def check(plan_text):
    errors, warnings = [], []
    for h in REQUIRED_HEADINGS:
        if not re.search(r"^#{1,3}\s.*" + re.escape(h), plan_text, re.M):
            errors.append(f"Missing required section: {h}")
    # Flywheel check: at least one flywheel row
    if not re.search(r"\|\s*Flywheel", plan_text) and not re.search(r"Producer.*Artifact.*Consumer", plan_text):
        warnings.append("No flywheel graph table detected — modules may be isolated.")
    # Build-order check
    if not re.search(r"(Micro-to-Macro|Macro-to-Micro|Dual-Track)", plan_text):
        errors.append("Build-Order Decision must declare Micro-to-Macro, Macro-to-Micro, or Dual-Track.")
    # Check for placeholder markers
    placeholders = re.findall(r"\[TODO:[^\]]*\]", plan_text)
    if placeholders:
        warnings.append(f"{len(placeholders)} unresolved [TODO: ...] placeholder(s).")
    # Category naming sanity: categories should start with NN_
    cats = re.findall(r"(0\d|1\d)_[A-Za-z0-9_]+", plan_text)
    if not cats:
        warnings.append("No NN_Name category folders found in Folder Taxonomy section.")
    return errors, warnings

def main():
    if len(sys.argv) < 2:
        print("Usage: validate_game_plan.py <path-to-game-architecture-plan.md>")
        sys.exit(2)
    p = Path(sys.argv[1])
    if not p.is_file():
        print(f"Error: {p} is not a file"); sys.exit(2)
    errors, warnings = check(p.read_text(encoding="utf-8"))
    for w in warnings:
        print(f"WARN: {w}")
    for e in errors:
        print(f"ERROR: {e}")
    if errors:
        sys.exit(1)
    print("OK: game architecture plan is structurally valid.")

if __name__ == "__main__":
    main()
