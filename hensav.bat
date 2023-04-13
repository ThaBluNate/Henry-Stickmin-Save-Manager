@echo off
Title Henry Stickmin Save Saver
setlocal enabledelayedexpansion
cd /d "%appdata%\com.innersloth.henry.HenryFlash"

if not exist 7za.exe (
curl -o z.exe 7-zip.org/a/7zr.exe
curl -o z.7z 7-zip.org/a/7z2201-extra.7z
z e z.7z -y -o. 7za.exe&del z.exe&del z.7z
)

md HenSaves&cd HenSaves
cls
echo 1: Save a file
echo 2: Load a file
echo 3: Kill a file
choice /c 123 /n /M "User Choice: "
cls

if %errorlevel%==1 (
set /p Name="Save to filename: "
..\7za a -y -t7z !Name!.hsc "..\Local Store\*.sav" >nul
echo Save complete...
echo Press any key to exit
pause>nul
)

if %errorlevel%==2 (
for /f "delims=" %%a in ('dir /b') do echo %%~na
set /p Name="Load from filename: "
..\7za x -y -o"../Local Store" !Name!.hsc >nul
echo Load complete...
echo Press any key to exit
pause>nul
)

if %errorlevel%==3 (
for /f "delims=" %%a in ('dir /b') do echo %%~na
set /p Name="Delete filename: "
del /f /q !Name!.hsc
echo Deletion complete...
echo Press any key to exit
pause>nul
)