@echo off
setlocal
cd /d "%~dp0"

if exist "build-sim\rockboxui.exe" (
    start "" "build-sim\rockboxui.exe"
    goto :eof
)

where bash >nul 2>&1
if %errorlevel%==0 (
    echo Building simulator...
    bash build-sim.sh
    if exist "build-sim\rockboxui" start "" "build-sim\rockboxui"
    goto :eof
)

echo No simulator binary and no bash found.
echo Install Git Bash or MSYS2, then run: bash build-sim.sh
pause
