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
You can launch `update_version.py` for update the fw version and the build date iteractively.
See a brief description directly on the [script](https://github.com/valegagge/AutoFirmwareCompilation/blob/c6e38b30b02ec8499204ec5a361216b803e54eab/update_versions.py#L5).
For run the script you just need to write the command in your bash: `pytho3n update_version.py`.



### 🚧 This is the first attempt to automate the fw compilation. Any suggestions or contributions are welcome!!!!
