@echo off
color 0F
title Monke Mod Manager 2.0

:init
if exist "C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag\" (
    set "gt_path=C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag"
    echo Gorilla Tag found at %gt_path%
) else (
    set /p gt_path=Gorilla Tag not found. Please enter the path to GorillaTag.exe: 
    if not exist "%gt_path%\" (
        echo Invalid path. Please try again.
        pause
        goto init
    )
)

:menu
cls
echo =============================
echo     Monke Mod Manager 2.0  
echo         by IhopGT          
echo =============================
echo.
echo Gorilla Tag path is set to %gt_path%
echo.
echo 1. BepInEx
echo 2. Utilla
echo 3. IIStupidMenu
echo 4. WalkSim
echo 5. All Mods
echo 6. Change Color
echo 7. MOST OP MENU EVER
echo 8. Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto bepinex
if "%choice%"=="2" goto utilla
if "%choice%"=="3" goto iistupidmenu
if "%choice%"=="4" goto walksim
if "%choice%"=="5" goto allmods
if "%choice%"=="6" goto changecolor
if "%choice%"=="7" goto mostopmenu
if "%choice%"=="8" goto exit
goto menu

:bepinex
echo BepInEx selected.
set "bep_url=https://github.com/IhopGT/Bepinexc/releases/download/modding/Bepinex.1.zip"
set "bep_dest=%cd%\BepInEx.zip"

echo Downloading BepInEx...
powershell -command "& {Invoke-WebRequest -Uri '%bep_url%' -OutFile '%bep_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading BepInEx. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %bep_dest%

echo Extracting BepInEx to %gt_path%...
powershell -command "& {Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%bep_dest%', '%gt_path%')}"
if %errorlevel% neq 0 (
    echo Error extracting BepInEx. Please check the zip file and destination path.
    pause
    goto menu
)
echo Extraction completed.

cls
echo PLEASE START GAME BEFORE CONTINUING
pause

goto menu

:utilla
echo Utilla selected.
set "plugins_folder=%gt_path%\BepInEx\plugins"
set "utilla_url=https://github.com/IhopGT/Bepinexc/releases/download/modding/Utilla.dll"
set "utilla_dest=%plugins_folder%\Utilla.dll"

echo Checking if Plugins folder exists...
if not exist "%plugins_folder%" (
    echo Plugins folder does not exist. Creating folder...
    mkdir "%plugins_folder%"
    if %errorlevel% neq 0 (
        echo Error creating Plugins folder. Please check permissions.
        pause
        goto menu
    )
    echo Plugins folder created successfully.
)

echo Downloading Utilla...
powershell -command "& {Invoke-WebRequest -Uri '%utilla_url%' -OutFile '%utilla_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading Utilla. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %utilla_dest%

pause
goto menu

:iistupidmenu
echo IIStupidMenu selected.
set "plugins_folder=%gt_path%\BepInEx\plugins"
set "iis_url=https://github.com/iiDk-the-actual/iis.Stupid.Menu/releases/download/4.3.0/iis_Stupid_Menu.dll"
set "iis_dest=%plugins_folder%\iis_Stupid_Menu.dll"

echo Checking if Plugins folder exists...
if not exist "%plugins_folder%" (
    echo Plugins folder does not exist. Creating folder...
    mkdir "%plugins_folder%"
    if %errorlevel% neq 0 (
        echo Error creating Plugins folder. Please check permissions.
        pause
        goto menu
    )
    echo Plugins folder created successfully.
)

echo Downloading IIStupidMenu...
powershell -command "& {Invoke-WebRequest -Uri '%iis_url%' -OutFile '%iis_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading IIStupidMenu. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %iis_dest%

pause
goto menu

:walksim
echo WalkSim selected.
set "plugins_folder=%gt_path%\BepInEx\plugins"
set "walksim_url=https://github.com/IhopGT/Bepinexc/releases/download/modding/walksim.dll"
set "walksim_dest=%plugins_folder%\walksim.dll"

echo Checking if Plugins folder exists...
if not exist "%plugins_folder%" (
    echo Plugins folder does not exist. Creating folder...
    mkdir "%plugins_folder%"
    if %errorlevel% neq 0 (
        echo Error creating Plugins folder. Please check permissions.
        pause
        goto menu
    )
    echo Plugins folder created successfully.
)

echo Downloading WalkSim...
powershell -command "& {Invoke-WebRequest -Uri '%walksim_url%' -OutFile '%walksim_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading WalkSim. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %walksim_dest%

pause
goto menu

:allmods
echo All Mods selected.
set "allmods_url=https://github.com/IhopGT/Bepinexc/releases/download/modding/All.Mods.zip"
set "allmods_dest=%cd%\All_Mods.zip"

echo Downloading All Mods...
powershell -command "& {Invoke-WebRequest -Uri '%allmods_url%' -OutFile '%allmods_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading All Mods. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %allmods_dest%

echo Extracting All Mods to %gt_path%\BepInEx\plugins...
powershell -command "& {Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%allmods_dest%', '%gt_path%\BepInEx\plugins')}"
if %errorlevel% neq 0 (
    echo Error extracting All Mods. Please check the zip file and destination path.
    pause
    goto menu
)
echo Extraction completed.

pause
goto menu

:changecolor
cls
echo Change Color selected.
echo 1. Red
echo 2. Green
echo 3. Blue
echo 4. Black
echo.
set /p color_choice=Select a color: 

if "%color_choice%"=="1" color 4F
if "%color_choice%"=="2" color 2F
if "%color_choice%"=="3" color 1F
if "%color_choice%"=="4" color 0F

goto menu

:mostopmenu
echo MOST OP MENU EVER selected.
set "plugins_folder=%gt_path%\BepInEx\plugins"
set "nyx_url=https://github.com/IhopGT/nxy-menu/releases/download/dffg/NYX.Menu.dll"
set "nyx_dest=%plugins_folder%\NYX.Menu.dll"

echo Checking if Plugins folder exists...
if not exist "%plugins_folder%" (
    echo Plugins folder does not exist. Creating folder...
    mkdir "%plugins_folder%"
    if %errorlevel% neq 0 (
        echo Error creating Plugins folder. Please check permissions.
        pause
        goto menu
    )
    echo Plugins folder created successfully.
)

echo Downloading MOST OP MENU EVER...
powershell -command "& {Invoke-WebRequest -Uri '%nyx_url%' -OutFile '%nyx_dest%'}"
if %errorlevel% neq 0 (
    echo Error downloading MOST OP MENU EVER. Please check your internet connection.
    pause
    goto menu
)
echo Download completed to %nyx_dest%

pause
goto menu

:exit
echo Exiting...
pause
exit
