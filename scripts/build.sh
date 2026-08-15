#!/usr/bin/env bash
# Build the static site into ./site
set -euo pipefail
cd "$(dirname "$0")/.."

mkdocs build --strict
