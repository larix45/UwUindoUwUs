@echo off
net session
if %errorlevel% EQU 2 goto not_administartor_rights

echo This script will make your windows look UwU... 
echo if you want to make your system UwUn't run "UwUindoUwUs.bat /d"

if "%1"=="/d" goto uwunt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\UwU"
if %errorlevel% EQU 0 goto uwu_alredy
rem 0 is equal to this system is UwU alredy 

rem copy existing wallpeper location to config file
mkdir "%appdata%\UwU\old_config"
reg query "HKCU\Control Panel\Desktop" /v "Wallpaper" | findstr :\ > "%appdata%\UwU\old_config\wallpaper.cfg"







rem downlaoding stuff

rem Comic Sans MS
curl https://www.freebestfonts.com/download?fn=586 --output comic.ttf
copy comic.ttf C:\Windows\Fonts

mkdir "%appdata%\UwU"
curl https://wallpaperaccess.com/full/2108551.jpg --output "%appdata%\UwU\wallpeper.jpg"

rem export registry in case of faliure
reg export HKLM registry.hklm.reg
reg export HKCU registry.hkcu.reg

rem registry tweaks

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold Italic (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Italic (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Light (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semibold (TrueType)" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Symbol (TrueType)" /t REG_SZ /f


reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI" /t REG_SZ /d "Comic Sans MS" /f



reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d  "%appdata%\UwU\wallpeper.jpg" /f
rem deleating not needed stuff
del comic.ttf

rem add registry key sugesting tahat this system is UwU
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\UwU" /v "isUwU" /t REG_SZ /d "Yes"


rem rebooting
cls
echo You will now be loged out 
pause
shutdown /l
exit


:uwunt
rem read  wallpeper location from config file and set it in registry
set /p wallpaper_old_config=<"%appdata%\UwU\old_config\wallpaper.cfg"
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d %wallpaper_old_config:~27% /f
rem undo changes
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI (TrueType)" /t REG_SZ /d "segoeui.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold (TrueType)" /t REG_SZ /d "segoeuin.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold Italic (TrueType)" /t REG_SZ /d "segoeuibi.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Italic (TrueType)" /t REG_SZ /d "segoeuii.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Light (TrueType)" /t REG_SZ /d "segoeuil.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semibold (TrueType)" /t REG_SZ /d "seguisb.ttf" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Symbol (TrueType)" /t REG_SZ /d "seguisym.ttf" /f


reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI" /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\UwU" /f
cls
echo You will now be loged out 
pause
shutdown /l
exit


:uwu_alredy
cls
echo This system is alredy UwU, if you want to make it UwUn't run %0 /d
pause
exit

:not_administartor_rights
echo \n
echo This script needs administartor rights to make your system UwU. Run it as administrotor.
echo \n
pause