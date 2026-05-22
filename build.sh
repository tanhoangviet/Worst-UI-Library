#!/usr/bin/env bash
set -euo pipefail

OUTPUT="library.luau"
if [[ "${1:-}" == "main.lua" ]]; then
  OUTPUT="main.lua"
fi

DARKLUA_BIN="$(command -v darklua || true)"
if [[ -z "$DARKLUA_BIN" && -x "$HOME/.cargo/bin/darklua" ]]; then
  DARKLUA_BIN="$HOME/.cargo/bin/darklua"
fi

if [[ -z "$DARKLUA_BIN" ]]; then
  echo "darklua chưa được cài. Cài bằng: cargo install darklua" >&2
  exit 1
fi

"$DARKLUA_BIN" process src/init.luau "$OUTPUT" --config .darklua.json

echo "Bundled thành công -> $OUTPUT"
