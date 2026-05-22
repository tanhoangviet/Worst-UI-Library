#!/usr/bin/env bash
set -euo pipefail
mkdir -p dist

python3 scripts/build_bundle.py

cp library.luau main.lua
if command -v darklua >/dev/null 2>&1; then
  darklua process library.luau dist/library.min.lua --format dense >/dev/null 2>&1 || true
  cp dist/library.min.lua main.lua 2>/dev/null || true
fi

echo "Built: library.luau, main.lua, dist/library.readable.luau, dist/library.executor.lua, dist/library.min.lua(optional)"
