# AutoFirmwareCompilation

In this repo there are scripts or usefull information for speed up the compilation of the fw of all boards.

## How to use
The script buildAllBoards.bat compiles the fw of EMS, MC2PLUS, MC4PLUS and AMC and copy the hex files in the `icub-firmware-build` folder.

> [!Note]
> Currently the AMC board needs two libs to compile by hand(IPAL and HAL). So the script compiles them also.

> [!Note]
> The `icub-firmaware` folder and `icub-firmware-build` should stay at the same level as the folder tree.

> [!Note]
> The scripts run the Keil IDE from the default installation location: `C:\Keil_v5\UV4\UV4.exe`


The user can specify the path to the `icub-firmware` repo by the option `-b path_to_icub-firmware`.

In addition, the script logs the output of the compilation in the log files. Please check them before pushing the hex files.


### 🚧 This is the first attempt to automatize the fw compilation. Any suggestions or contributions are welcome!!!!
