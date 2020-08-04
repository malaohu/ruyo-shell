ÿ?
@echo off&color 1f&mode con cols=52 lines=28
cls
echo.
echo.====================================================
echo.   ¡¡     Windows 10 ÊÚÈ¨»¥»» 
echo.====================================================
echo.
echo.           [1]   ×ª   Ô¶³Ì×ÀÃæ   ÊÚÈ¨
echo.
echo.           [2]   ×ª  ×¨Òµ¹¤×÷Õ¾  ÊÚÈ¨
echo.
echo.           [3]   ×ª    Æó  Òµ    ÊÚÈ¨
echo.
echo.           [4]   ×ª    ½ÌÓý°æ    ÊÚÈ¨
echo.
echo.           [5]   ×ª    ×¨Òµ°æ    ÊÚÈ¨
echo.
echo.
choice /C:1234567890 /N /M "--ÇëÑ¡Ôñ: [ÍË³öÖ±½Ó¹Ø±Õ±¾´°¿Ú]"
if errorlevel 5 (set "os=10" & set "key=VK7JG-NPHTM-C97JM-9MPGT-3V66T")
if errorlevel 4 (set "os=10" & set "key=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY")
if errorlevel 3 (set "os=10" & set "key=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C")
if errorlevel 2 (set "os=10" & set "key=DXG7C-N36C4-C4HTG-X4T3X-2YV77")
if errorlevel 1 (set "os=10" & set "key=NJCF7-PW8QT-3324D-688JX-2YV66")
cls
echo.
if "%os%"=="2019" goto ser2019
if EXIST "%windir%\BrandingN" (
  ren "%windir%\Branding" "BrandingS"
  ren "%windir%\BrandingN" "Branding"
)
goto instkey
:ser2019
if EXIST "%windir%\BrandingS" (
  ren "%windir%\Branding" "BrandingN"
  ren "%windir%\BrandingS" "Branding"
)
:instkey
cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %key%
exit
