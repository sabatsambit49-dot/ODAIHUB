@echo off
setlocal enabledelayedexpansion
title Push Main Educational Portal to GitHub
echo ============================================================
echo   Main Educational Portal - Push to GitHub
echo ============================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Git is not installed or not in your PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

cd /d "%~dp0"

REM Check if backend is running on port 8000 and warn user
netstat -ano | find "8000" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo [!] WARNING: Backend server is running on port 8000.
    echo     The database file may be locked.
    echo     It is SAFE to push - the database is excluded by .gitignore.
    echo.
)

if not exist ".git" (
    echo [*] Initializing new Git repository...
    git init
    git branch -M main
)

git remote get-url origin >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [!] No remote repository is configured.
    set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/repo.git): "
    if "!REPO_URL!"=="" (
        echo [ERROR] No URL provided. Aborting.
        pause
        exit /b 1
    )
    git remote add origin !REPO_URL!
    echo [*] Added remote origin: !REPO_URL!
) else (
    for /f "tokens=*" %%a in ('git remote get-url origin') do set CURRENT_REMOTE=%%a
    echo [*] Current remote: !CURRENT_REMOTE!
)

REM Remove database from tracking if it was previously tracked
git rm -r --cached database/ >nul 2>nul
git rm -r --cached frontend/node_modules/ >nul 2>nul

set /p COMMIT_MSG="Enter commit message (Press Enter for: 'Update Main Educational Portal'): "
if "!COMMIT_MSG!"=="" set COMMIT_MSG=Update Main Educational Portal

echo.
echo [*] Staging all files (database and node_modules excluded by .gitignore)...
git add .

echo [*] Committing changes...
git commit -m "!COMMIT_MSG!"
if %ERRORLEVEL% neq 0 (
    echo [!] Nothing new to commit, or commit failed.
)

echo [*] Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================
    echo [SUCCESS] Successfully pushed Main Educational Portal!
    echo To run locally: double-click start_all.bat
    echo ============================================================
) else (
    echo.
    echo [!] Push failed. Remote has new commits. Choose an option:
    echo [1] Force push (WARNING: Overwrites remote GitHub with your local files)
    echo [2] Pull remote changes first, then push
    echo [3] Cancel
    set /p CHOICE="Choose option (1/2/3): "
    if "!CHOICE!"=="1" (
        echo [*] Force pushing...
        git push -u origin main --force
    ) else if "!CHOICE!"=="2" (
        echo [*] Pulling remote changes...
        git pull origin main --rebase --allow-unrelated-histories
        echo [*] Now pushing...
        git push -u origin main
    ) else (
        echo [*] Cancelled. No changes pushed.
    )
)

echo.
echo [*] NOTE: The database (database/edutrack.db) is NOT pushed to GitHub.
echo     This is intentional - keep your database local or use a cloud DB in production.
echo.
pause
