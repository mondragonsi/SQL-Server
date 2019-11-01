Resume:
The PowerShell named "SQLConfig_Automator.ps1" will read the "SQLCoreInstallParms.tx" 
to execute the install command.
All those files must be in the target server in de drive Y:\


1 - Insert the parameters for installation within the file "SQLCoreInstallParms.tx"
 1.1 - Review the Drive Letter in the .ps1 file. It can be F or G. Change to the letter where windows mounted it.
2 - Execute the "file SQLConfig_Automator.ps1" in the Target Server from the Drive Y:\
3 - The installation will start.
4 - Wait the progress and the installation should finish successfully.
