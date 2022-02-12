Dismount-DiskImage -ImagePath "Y:\en_sql_server_2016_standard_with_service_pack_1_x64_dvd_9540929.iso"





Resume:
The PowerShell named "SQLConfig_Automator.ps1" will read the "SQLCoreInstallParms.tx" 
to execute the install command.
All those files must be in the target server in de drive Y:\


1 - Insert the parameters for installation within the file "SQLCoreInstallParms.tx"
 1.1 - Review the Drive Letter in the .ps1 file. It can be F or G. Change to the letter where windows mounted it.
2 - Execute the "file SQLConfig_Automator.ps1" in the Target Server from the Drive Y:\
3 - The installation will start.
4 - Wait the progress and the installation should finish successfully.
5 - Dismount-DiskImage -ImagePath "Y:\en_sql_server_2016_standard_with_service_pack_1_x64_dvd_9540929.iso"
6 - Mounted disk can cahnge to G or F
7 - set-executionpolicy unrestricted if PowerShell Does not RUN
