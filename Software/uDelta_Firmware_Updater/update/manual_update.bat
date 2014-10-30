@echo off
echo TEENSYLU FIRMWARE UPLAODER 
echo from
echo                    _   _               _____          _     
echo   ___  /\/\   ___ ^| ^|_(_) ___  _ __   /__   \___  ___^| ^|__  
echo  / _ \/    \ / _ \^| __^| ^|/ _ \^| '_ \    / /\/ _ \/ __^| '_ \ 
echo ^|  __/ /\/\ \ (_) ^| ^|_^| ^| (_) ^| ^| ^| ^|  / / ^|  __/ (__^| ^| ^| ^|
echo  \___\/    \/\___/ \__^|_^|\___/^|_^| ^|_^|  \/   \___^|\___^|_^| ^|_^|
     
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo =====================
echo Firmware upload:
echo =====================
echo 1: BASE
echo 2: BED without LCD / LIT CHAUFFANT SANS LCD
echo 3: LCD
echo 4: BED + LCD / LIT CHAUFFANT + LCD
set /p input="Firmware? "
if %input%==1 set fm="uDelta_Base_v1.00.hex"
if %input%==2 set fm="uDelta_bed_v1.00.hex"
if %input%==3 set fm="uDelta_LCD_v0.9.hex"
if %input%==4 set fm="uDelta_LCD_bed_v0.9.hex"
echo ---------------------
echo Updater will upload the file: %fm%
echo ---------------------
echo Remove the jumper close to the main chip and press reset on your board,
echo it will switch to programming mode 
echo //fr: Enlevez le cavalier proche de la teensylu et appuyez sur le bouton Reset
pause
echo =============PORT SCANNER=================
for /f "tokens=4" %%A in ('mode^|findstr "COM[0-99]"') do ( 
echo %%A 
)

echo ===========================================
echo CAUTION! Write down your portname using the format "COMX" where X is your port number
echo fr: ECRIVEZ VOTRE PORT SOUS LA FORME "COMX" X etant le numero de port

set /p input="PORT: "
avrdude.exe avrdude.conf -v -v -v -v -pat90usb1286 -cavr109 -P\\.\%input% -b115200 -D -Uflash:w:firmwares_emt\uDelta_LCD_bed_v0.9.hex:i 

echo 001001 
echo PS: Do not forget to restore the jumper and press reset to switch to normal mode
echo PS: //fr: oubliez pas de remettre le cavalier et rappuyer sur reset...
echo Enjoy!
pause