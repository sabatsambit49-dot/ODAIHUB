@echo off
title Launch Main Educational Portal
echo ============================================================
echo   Starting Main Educational Portal (Frontend 3000 + Backend 8000)
echo ============================================================
echo.

cd /d "%~dp0"

echo [*] Starting Backend API on http://localhost:8000...
start "Main Portal Backend (8000)" cmd /k "cd /d %~dp0backend && python run_backend.py"

timeout /t 3 /nobreak >nul

echo [*] Starting Frontend UI on http://localhost:3000...
start "Main Portal Frontend (3000)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo [DONE] Both servers have been launched in separate windows!
echo - Frontend URL: http://localhost:3000/
echo - Backend API Docs: http://localhost:8000/api/docs
echo.
pause
