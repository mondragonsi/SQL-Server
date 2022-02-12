Resume:
The PowerShell named "SQLConfig_Automator.ps1" will read the "SQLCoreInstallParms.tx" 
to execute the install command.
All those files must be in the target server in the drive Y:\


1 - Insert the parameters for installation within the file "SQLCoreInstallParms.tx"
  1.1 Change the instance name and any other parameters in the PS1 file. Example the Data or log path.
2 - Execute the "file SQLConfig_Automator.ps1" in the Target Server from the Drive Y:\
3 - The installation will start.
4 - Wait the progress and the installation should finish successfully.
5 - Dismount-DiskImage -ImagePath "Y:\en_sql_server_2016_standard_with_service_pack_1_x64_dvd_9540929.iso"
6 - Mounted disk can cahnge to G or F
7 - set-executionpolicy unrestricted if PowerShell Does not RUN
