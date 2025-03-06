
@echo off
setlocal

set "default_path=C:\Users\vgaggero\Documents\WORKSPACE"

if "%~1"=="-p" (
  set "user_path=%~2"
  echo User path provided: %user_path%
) else (
  set "user_path=%default_path%"
  echo No user path provided, using default path: %user_path%
)


set "pjoj_EMS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\proj\ems4rd.diagnostic2ready.uvprojx"
set "pjoj_MC2PLUS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\proj\mc2plus.diagnostic2ready.uvprojx"
set "pjoj_MC4PLUS_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\proj\mc4plus.diagnostic2ready.uvprojx"
set "pjoj_AMC_LIB_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\libs\lowlevel\stm32hal\proj\stm32hal.h7.uvprojx"
set "pjoj_AMC_LIB_IPAL_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\libs\highlevel\abslayer\ipal\ipal-lwip-h7.uvprojx"
set "pjoj_AMC_path=%user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\proj\amc-icc.uvprojx"



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


echo Compilations Done!!!


COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\amc\application\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\AMC
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\ems004\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\EMS\bin\application
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc2plus\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\MC2PLUS\bin\application
COPY %user_path%\icub-firmware\emBODY\eBcode\arch-arm\board\mc4plus\appl\v2\bin\*.hex %user_path%\icub-firmware-build\ETH\MC4PLUS\bin\application


echo Copy Done!!!



echo Premere un tasto per continuare...
pause > nul

endlocal