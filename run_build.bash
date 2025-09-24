#!/usr/bin/env bash
set -euo pipefail

# === Configure paths ===
BUILD_DIR="$(pwd)/build/linux-x64"

# === Configure & build (Unix Makefiles, Release) ===
cmake -S . -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release
cmake --build "$BUILD_DIR" -j"$(nproc)"

# === Install to /usr/local (default) ===
sudo cmake --install "$BUILD_DIR"

echo
echo "Installed zenoh-c to: /usr/local"
echo "  - Headers:   /usr/local/include"
echo "  - Shared libs: /usr/local/lib"
echo "  - Executables: /usr/local/bin"
