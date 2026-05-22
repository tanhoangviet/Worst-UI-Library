# Worst-UI-Library

UI Library Luau (Roblox) theo style TitanUI dark/red, tách module nhiều file và build bundle bằng darklua.

## Features
- Layout giống mockup: topbar, sidebar, dashboard cards, panel performance, quick toggles.
- Kiến trúc module dễ mở rộng.
- API đơn giản: `Library:CreateWindow(title)`.
- Bundle ra 1 file duy nhất (`library.luau` hoặc `main.lua`).

## Cấu trúc
- `src/init.luau`: entry chính.
- `src/core/theme.luau`: color palette + corner radius.
- `src/core/utils.luau`: helper tạo UI instance.
- `src/components/topbar.luau`: search + action buttons.
- `src/components/sidebar.luau`: menu trái + profile.
- `src/components/dashboard.luau`: stat cards + performance + quick toggles.
- `example.client.luau`: ví dụ sử dụng.

## Build
```bash
./build.sh
```
Mặc định output: `library.luau`

Nếu muốn output là `main.lua`:
```bash
./build.sh main.lua
```

## Yêu cầu
- Cần cài darklua trước:
```bash
cargo install darklua
```
