
@echo off
setlocal

:: By default, use parent folder of this script as default_path
for %%a in ("%~dp0..") do set "default_path=%%~fa"

if "%~1"=="-p" (
  set "user_path=%~2"
  echo User path provided: %user_path%
) else (
  set "user_path=%default_path%"
  echo No user path provided, using default path: %user_path%
)

:: Automatically detect the UV4.exe out of possible default installation paths

echo Percorso utente usato: %percorso_utente%

if exist "C:\Keil_v5\UV4\UV4.exe" (
    set "UV4_PATH=C:\Keil_v5\UV4\UV4.exe"
) else (
    if exist "%LOCALAPPDATA%\Keil_v5\UV4\UV4.exe" (
        set "UV4_PATH=%LOCALAPPDATA%\Keil_v5\UV4\UV4.exe"
    ) else (
        echo "UV4.exe not found."
    )
)

echo "Detected Keil's UV4 at %UV4_PATH%"

set "pjoj_EMS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\proj\ems4rd.diagnostic2ready.uvprojx"
set "pjoj_MC2PLUS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\proj\mc2plus.diagnostic2ready.uvprojx"
set "pjoj_MC4PLUS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\proj\mc4plus.diagnostic2ready.uvprojx"
set "pjoj_AMC_LIB_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\libs\lowlevel\stm32hal\proj\stm32hal.h7.uvprojx"
set "pjoj_AMC_LIB_IPAL_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\libs\highlevel\abslayer\ipal\ipal-lwip-h7.uvprojx"
set "pjoj_AMC_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\proj\amc-icc.uvprojx"



set "out_path=%CD%"



echo EMS compilation starts...
%UV4_PATH% -o %out_path%\ems.log -j0 -b %pjoj_EMS_path%
set err=%errorlevel%
if %err%==0 (
    echo EMS compilation successful.
) else (
    if %err%==1 (
        echo WARNING: EMS compilation produced warnings.
        echo Compilation log:
        type "%out_path%\ems.log"
    ) else (
        echo ERROR: EMS compilation failed with error code %err%.
        echo Compilation log:
        type "%out_path%\ems.log"
        exit /b %err%
    )
)


echo MC2PLUS compilation starts...
%UV4_PATH% -o %out_path%\mc2plus.log -j0 -b %pjoj_MC2PLUS_path%
set err=%errorlevel%
if %err%==0 (
    echo MC2PLUS compilation successful.
) else (
    if %err%==1 (
        echo WARNING: MC2PLUS compilation produced warnings.
        echo Compilation log:
        type "%out_path%\mc2plus.log"
    ) else (
        echo ERROR: MC2PLUS compilation failed with error code %err%.
        echo Displaying log file:
        type "%out_path%\mc2plus.log"
        exit /b %err%
    )
)

echo MC4PLUS compilation starts...
%UV4_PATH% -o %out_path%\mc4plus.log -j0 -b %pjoj_MC4PLUS_path%
set err=%errorlevel%
if %err%==0 (
    echo MC4PLUS compilation successful.
) else (
    if %err%==1 (
        echo WARNING: MC4PLUS compilation produced warnings.
        echo Compilation log:
        type "%out_path%\mc4plus.log"
    ) else (
        echo ERROR: MC4PLUS compilation failed with error code %err%.
        echo Compilation log:
        type "%out_path%\mc4plus.log"
        exit /b %err%
    )
)

echo AMC compilation starts...
%UV4_PATH% -o %out_path%\amc_lib.log -j0 -b %pjoj_AMC_LIB_path%
set err=%errorlevel%
if %err%==0 (
    echo AMC_LIB compilation successful.
) else (
    if %err%==1 (
        echo WARNING: AMC_LIB compilation produced warnings.
        echo Compilation log:
        type "%out_path%\amc_lib.log"
    ) else (
        echo ERROR: AMC_LIB compilation failed with error code %err%.
        echo Compilation log:
        type "%out_path%\amc_lib.log"
        exit /b %err%
    )
)

%UV4_PATH% -o %out_path%\amc_lib_ipal.log -j0 -b %pjoj_AMC_LIB_IPAL_path%
set err=%errorlevel%
if %err%==0 (
    echo AMC_LIB_IPAL compilation successful.
) else (
    if %err%==1 (
        echo WARNING: AMC_LIB_IPAL compilation produced warnings.
        echo Compilation log:
        type "%out_path%\amc_lib_ipal.log"
    ) else (
        echo ERROR: AMC_LIB compilation failed with error code %err%.
        echo Compilation log:
        type "%out_path%\amc_lib_ipal.log"
        exit /b %err%
    )
)

%UV4_PATH% -o %out_path%\amc.log -j0 -b %pjoj_AMC_path%
set err=%errorlevel%
if %err%==0 (
    echo AMC compilation successful.
) else (
    if %err%==1 (
        echo WARNING: AMC compilation produced warnings.
        echo Compilation log:
        type "%out_path%\amc.log"
    ) else (
        echo ERROR: AMC compilation failed with error code %err%.
        echo Compilation log:
        type "%out_path%\amc.log"
        exit /b %err%
    )
)

echo Compilations Done!!!


COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\AMC
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\EMS\bin\application
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\MC2PLUS\bin\application
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\MC4PLUS\bin\application


echo Copy Done!!!



echo Premere un tasto per continuare...
pause > nul

endlocal