@echo off
REM DevTinder - Verify Setup Script (Windows)

echo.
echo ========================================
echo DevTinder - Setup Verification Script
echo ========================================
echo.

REM Check Node.js
echo [1/5] Checking Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo Node.js not found
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('node --version') do echo Found %%i
)

REM Check npm
echo.
echo [2/5] Checking npm...
npm.cmd --version >nul 2>&1
if errorlevel 1 (
    echo npm not found
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('npm.cmd --version') do echo Found npm %%i
)

REM Check Backend .env
echo.
echo [3/5] Checking Backend Configuration...
if exist "devTinder-backend\.env" (
    echo Backend .env found
    findstr "MONGO_URI" devTinder-backend\.env >nul 2>&1
    if errorlevel 1 (
        echo MONGO_URI not found in .env
    ) else (
        echo MongoDB URI configured
    )
) else (
    echo Backend .env not found
)

REM Check Frontend .env
echo.
echo [4/5] Checking Frontend Configuration...
if exist "devTinder-frontend\.env" (
    echo Frontend .env found
) else (
    echo Frontend .env not found - using fallback API URL from constants.js
)

REM Check package.json files
echo.
echo [5/5] Checking package.json files...
if exist "devTinder-backend\package.json" (
    echo Backend package.json found
) else (
    echo Backend package.json not found
)

if exist "devTinder-frontend\package.json" (
    echo Frontend package.json found
) else (
    echo Frontend package.json not found
)

echo.
echo ========================================
echo Setup Verification Complete!
echo ========================================
echo.
echo Next Steps:
echo 1. Run: start.bat
echo 2. Open: http://localhost:5173
echo 3. Backend API health: http://localhost:3000
echo.
pause
