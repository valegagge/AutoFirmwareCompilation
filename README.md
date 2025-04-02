# AutoFirmwareCompilation

In this repo there are scripts or usefull information for speed up the compilation of the fw of all boards.

## How to use the script `buildAllBoards.bat`
The script buildAllBoards.bat compiles the fw of EMS, MC2PLUS, MC4PLUS and AMC and copies the hex files in the `icub-firmware-build` folder.

> [!Note]
> Currently, the AMC board needs two libs to compile by hand(IPAL and HAL). So the script compiles them also.

> [!Note]
> The `icub-firmaware` folder and `icub-firmware-build` should stay at the same level as the folder tree.

> [!Note]
> The scripts run the Keil IDE from the default installation location: `C:\Keil_v5\UV4\UV4.exe`


The user can specify the _absolute_ path to the `icub-firmware` repo by the option `-p "absolute_path_to_icub-firmware" `.

In addition, the script logs the output of the compilation in the log files. Please check them before pushing the hex files.


### Possible errors
In case the provided path is wrong, the output of the script says something like this
```
ERROR: EMS compilation failed with error code 15
```
Please check that you provided the _absolute_ correct path

-----------------------------------------
## How update the version of each FW
Currently isn't possible to automate the fw version's increment.

Personally, I search the `EOMTHEEMSAPPLCFG_VERSION_MINOR` in `icub-firmware` folder by Vcode and increment the version and update the date by hand.
For AMC I search `theApplication_Config`.
For  AMC2C I search `constexpr embot::app::icc::Signature signature __attribute__((section(".ARM.__at_0x08100800")))` 


### 🚧 This is the first attempt to automate the fw compilation. Any suggestions or contributions are welcome!!!!
