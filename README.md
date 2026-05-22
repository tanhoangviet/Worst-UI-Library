# Worst-UI-Library

TitanUI-style UI Library cho Roblox/Luau, hỗ trợ executor (Delta/Synapse X style), code open-source, build bundle 1 file chạy trực tiếp.

## Điểm chính
- Multi-module source (dễ đọc, dễ sửa).
- Build ra **1 file standalone** (không require external file/module khi chạy).
- Tương thích executor tốt hơn với `gethui`, `syn.protect_gui`, `CoreGui`, `PlayerGui` fallback.
- Có 2 output:
  - `library.luau`: readable/open-source bundle.
  - `main.lua`: phiên bản compact/minified nhẹ để phát hành.

## Build
```bash
./build.sh
```

## Dùng nhanh
```lua
local Library = loadstring(readfile("library.luau"))()
Library:CreateWindow("TitanUI Library")
```

hoặc:
```lua
local Library = loadstring(readfile("main.lua"))()
Library:CreateWindow("TitanUI Library")
```
