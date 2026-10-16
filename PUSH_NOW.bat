@echo off
title Push to GitHub - institute-directory
echo ============================================================
echo   Pushing to: https://github.com/odaihub/institute-directory
echo ============================================================
echo.
echo All files are already committed and ready.
echo A GitHub login window may pop up - sign in when prompted.
echo.
cd /d "%~dp0"
git push origin main --force
echo.
if %ERRORLEVEL% equ 0 (
    echo ============================================================
    echo  SUCCESS! Pushed to GitHub successfully!
    echo  Visit: https://github.com/odaihub/institute-directory
    echo ============================================================
) else (
    echo ============================================================
    echo  Push failed. Try these steps:
    echo  1. Open GitHub Desktop and push from there
    echo  2. OR run: git push origin main --force
    echo     in this folder's terminal
    echo ============================================================
)
echo.
pause
