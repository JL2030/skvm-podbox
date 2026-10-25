@echo off
setlocal
cd /d "%~dp0"

if exist "build-sim\rockboxui.exe" goto :runexe
if exist "build-sim\rockboxui" goto :runbin

where make >nul 2>&1
if errorlevel 1 goto :notool

echo Building simulator...
call bash build-sim.sh
if exist "build-sim\rockboxui" goto :runbin
if exist "build-sim\rockboxui.exe" goto :runexe
goto :end

:runexe
start "" "build-sim\rockboxui.exe"
goto :end

:runbin
start "" "build-sim\rockboxui"
goto :end

:notool
echo No toolchain (make) found on PATH.
echo Use the pre-built firmware: rockbox-ipodvideo-5g.zip
echo Or install MSYS2/WSL and run: bash build-sim.sh
start "" .
pause

:end
