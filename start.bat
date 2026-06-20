@echo off
REM DevTinder - Start both Frontend and Backend (Windows)

echo.
echo Starting DevTinder Application...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

REM Start Backend
echo Starting Backend Server...
start cmd /k "cd /d %~dp0devTinder-backend && npm.cmd install && npm.cmd run dev"

REM Wait for backend to start
timeout /t 3 /nobreak

REM Start Frontend
echo Starting Frontend Server...
start cmd /k "cd /d %~dp0devTinder-frontend && npm.cmd install && npm.cmd run dev"

echo.
echo DevTinder is starting in two terminal windows.
echo ----------------------------------------
echo Backend:  http://localhost:3000
echo Frontend: http://localhost:5173
echo ----------------------------------------
echo.
pause
