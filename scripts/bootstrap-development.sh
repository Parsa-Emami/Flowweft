#!/usr/bin/env bash
set -euo pipefail

# Run from the repository root after verifying the GitHub owner/module namespace.
# This script intentionally performs source bootstrap only; infrastructure credentials are never generated.

composer create-project laravel/laravel:^13.0 apps/control-plane
python3 -m venv services/inference/.venv
mkdir -p services/inference/src/flowweft_inference pipelines/zeek
echo "Add a locked Python dependency file before the first dependency-bearing commit."

printf "\nBootstrap command sequence completed. Review generated files, pin/lock dependencies, then run repository validation before commit.\n"
