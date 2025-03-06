
@echo off
setlocal

set "percorso_default=C:\Users\vgaggero\Documents\WORKSPACE"

if "%~1"=="-p" (
  set "percorso_utente=%~2"
  echo Percorso utente fornito: %percorso_utente%
) else (
  set "percorso_utente=%percorso_default%"
  echo Nessun percorso utente fornito, utilizzo del percorso predefinito: %percorso_utente%
)



set "pjoj_EMS_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\proj\ems4rd.diagnostic2ready.uvprojx"
set "pjoj_MC2PLUS_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\proj\mc2plus.diagnostic2ready.uvprojx"
set "pjoj_MC4PLUS_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\proj\mc4plus.diagnostic2ready.uvprojx"
set "pjoj_AMC_LIB_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\libs\lowlevel\stm32hal\proj\stm32hal.h7.uvprojx"
set "pjoj_AMC_LIB_IPAL_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\libs\highlevel\abslayer\ipal\ipal-lwip-h7.uvprojx"
set "pjoj_AMC_path=%percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\proj\amc-icc.uvprojx"



set "out_path=%CD%"



echo EMS compilation starts...
C:\Keil_v5\UV4\UV4.exe -o %out_path%\ems.log -b %pjoj_EMS_path% 

echo MC2PLUS compilation starts...
C:\Keil_v5\UV4\UV4.exe -o %out_path%\mc2plus.log -b %pjoj_MC2PLUS_path%

echo MC4PLUS compilation starts...
C:\Keil_v5\UV4\UV4.exe -o %out_path%\mc4plus.log -b %pjoj_MC4PLUS_path%

echo AMC compilation starts...
C:\Keil_v5\UV4\UV4.exe -o %out_path%\amc_lib.log -b %pjoj_AMC_LIB_path%
C:\Keil_v5\UV4\UV4.exe -o %out_path%\amc_lib_ipal.log -b %pjoj_AMC_LIB_IPAL_path%
C:\Keil_v5\UV4\UV4.exe -o %out_path%\amc.log -b %pjoj_AMC_path%


echo "Compilations Done!!!"


COPY %percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\bin\*.hex %percorso_utente%\icub-firmware-build\ETH\AMC
COPY %percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\bin\*.hex %percorso_utente%\icub-firmware-build\ETH\EMS\bin\application
COPY %percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\bin\*.hex %percorso_utente%\icub-firmware-build\ETH\MC2PLUS\bin\application
COPY %percorso_utente%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\bin\*.hex %percorso_utente%\icub-firmware-build\ETH\MC4PLUS\bin\application


echo "Copy Done!!!"



echo Premere un tasto per continuare...
pause > nul

endlocal