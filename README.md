# Worst-UI-Library (TitanUI Style)

UI Library cho Roblox/Luau, responsive desktop + mobile, executor-friendly (Delta/Synapse X style), open-source bundle.

## Nâng cấp mới
- UI nhỏ hơn, không còn quá to trên màn hình mobile.
- Auto responsive theo `ViewportSize`.
- Mobile có bottom tab bar, desktop có sidebar.
- API: `CreateWindow(title)`, `Notify(text)`.
- Build ra nhiều bundle:
  - `library.luau` (standalone)
  - `main.lua` (compact)
  - `dist/library.readable.luau`
  - `dist/library.executor.lua`
  - `dist/library.min.lua` (nếu có darklua)

## Build local
```bash
./build.sh
```

## GitHub Actions (auto build + auto commit + deploy docs)
Workflow: `.github/workflows/build-and-deploy.yml`
- Cài `darklua`
- Build bundles
- Upload artifacts
- Auto commit file generated bằng bot action
- Deploy `docs/` lên GitHub Pages

## Examples
- `examples/basic.client.luau`
- `examples/mobile.client.luau`
- `example.client.luau`

## Docs Website
- Local: mở `docs/index.html`
- CI deploy: GitHub Pages từ workflow

## Quick Use
```lua
local Library = loadstring(readfile("library.luau"))()
Library:CreateWindow("TitanUI")
Library:Notify("Hello")
```
