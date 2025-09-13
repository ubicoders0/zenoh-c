@echo off
setlocal enabledelayedexpansion

rem === Configure paths ===
set PREFIX=C:\cmake_ext_libs\zenoh-c
set BUILD_DIR=%CD%\build

rem === Configure & build (Visual Studio 2022, x64) ===
cmake -S . -B "%BUILD_DIR%" -G "Visual Studio 17 2022" -A x64 -DCMAKE_INSTALL_PREFIX="%PREFIX%"
cmake --build "%BUILD_DIR%" --config Release

rem === Install to the prefix (copies headers/DLLs/libs) ===
cmake --install "%BUILD_DIR%" --config Release

echo.
echo Installed zenoh-c to: %PREFIX%
echo   - Headers: %PREFIX%\include
echo   - DLLs:    %PREFIX%\bin
echo   - Libs:    %PREFIX%\lib
