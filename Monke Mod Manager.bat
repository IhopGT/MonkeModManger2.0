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
echo 7. Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto bepinex
if "%choice%"=="2" goto utilla
if "%choice%"=="3" goto iistupidmenu
if "%choice%"=="4" goto walksim
if "%choice%"=="5" goto allmods
if "%choice%"=="6" goto changecolor
if "%choice%"=="7" goto exit
goto menu

:bepinex
echo BepInEx selected.
set "bep_url=https://cdn.discordapp.com/attachments/1223394850737623101/1269675254989455543/Bepinex.zip?ex=66b0ecba&is=66af9b3a&hm=b0bcfeb74f166440dcbb4f0e72f79ff8b97ca802908d6db75c1e3de4ffec0268&"
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
set "utilla_url=https://cdn.discordapp.com/attachments/1172374343012057210/1267245888242450564/Utilla.dll?ex=66afff34&is=66aeadb4&hm=0695ebc98afd487c1a5c6e58bf713452608ddfd8362362465884f07cc1255ac3&"
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
set "iis_url=https://cdn.discordapp.com/attachments/1170117473912238150/1266900371125567521/iis_Stupid_Menu.dll?ex=66b00eea&is=66aebd6a&hm=9e0871b0aee33b3f77fd19d2a1a466d8a1853793f3ebd8f4dde4842b28b99b84&"
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
set "walksim_url=https://cdn.discordapp.com/attachments/1240054326521495573/1267724335158661120/walksim.dll?ex=66afc28a&is=66ae710a&hm=bb59cad1179828ff6f870ef2d1e07efe3b7f7f5ef174aee473e226b3a38eb227&"
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
set "allmods_url=https://cdn.discordapp.com/attachments/1223394850737623101/1269674941872083094/All_Mods.zip?ex=66b0ec6f&is=66af9aef&hm=de6432798f049518e945d8e9e2f2c7b3c272b371535da98d3c4c298b6e39e6f6&"
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

:exit
echo Exiting...
pause
exit
