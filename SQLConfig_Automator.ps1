$Global:NextDriveLetter = $null

function Get-NextDriverLetter 
{


$DriveList = Get-PSDrive -PSProvider filesystem | foreach({($_.Root).Replace(":\","")})
$AllDrives = [char[]]([int][char]'E'..[int][char]'Z')
$NextDriveLetter = ($AllDrives | Where-Object { $DriveList -notcontains $_ } | Select-Object -First 1) + ":"

cls

Write-Host 'Next Drive letter is: ' $NextDriveLetter
$Global:NextDriveLetter = $NextDriveLetter


}


function InstallSQLServerInstance
{

Y:

#Initialize Variables
$VALUE_OPTION='[OPTIONS]'

$OPTION_ACTION='ACTION'
$VALUE_ACTION='"Install"'

$OPTION_IACCEPTSQLSERVERLICENSETERMS='IAcceptSQLServerLicenseTerms'
$VALUE_IACCEPTSQLSERVERLICENSETERMS='"True"'

$OPTION_SUPPRESSPRIVACYSTATEMENTNOTICE='SUPPRESSPRIVACYSTATEMENTNOTICE'
$VALUE_SUPPRESSPRIVACYSTATEMENTNOTICE='"False"'

$OPTION_IACCEPTROPENLICENSETERMS='IACCEPTROPENLICENSETERMS'
$VALUE_IACCEPTROPENLICENSETERMS='"False"'

$OPTION_ENU='ENU'
$VALUE_ENU='"True"'

$OPTION_UpdateEnabled='UpdateEnabled'
$VALUE_UpdateEnabled='"True"'

$OPTION_USEMICROSOFTUPDATE='USEMICROSOFTUPDATE'
$VALUE_USEMICROSOFTUPDATE='"False"'

$OPTION_FEATURES='FEATURES'
$VALUE_FEATURES='"SQLENGINE"'

$OPTION_UpdateSource='UpdateSource'
$VALUE_UpdateSource='"MU"'

$OPTION_HELP='HELP'
$VALUE_HELP='"False"'

$OPTION_INDICATEPROGRESS='INDICATEPROGRESS'
$VALUE_INDICATEPROGRESS='"False"'

$OPTION_X86='X86'
$VALUE_X86='"False"'

$OPTION_INSTANCENAME='INSTANCENAME'
$VALUE_INSTANCENAME='"IT01SDA"'

$OPTION_INSTALLSHAREDDIR='INSTALLSHAREDDIR'
$VALUE_INSTALLSHAREDDIR='"D:\Program Files\Microsoft SQL Server"'

$OPTION_INSTALLSHAREDWOWDIR='INSTALLSHAREDWOWDIR'
$VALUE_INSTALLSHAREDWOWDIR='"D:\Program Files (x86)\Microsoft SQL Server"'

$OPTION_INSTANCEID='INSTANCEID'
$VALUE_INSTANCEID='"IT01SDA"'

$OPTION_SQLTELSVCACCT=';SQLTELSVCACCT'
$VALUE_SQLTELSVCACCT='"NT Service\SQLTELEMETRY$MSSQLSERVER"'

$OPTION_SQLTELSVCSTARTUPTYPE='SQLTELSVCSTARTUPTYPE'
$VALUE_SQLTELSVCSTARTUPTYPE='"Automatic"'

$OPTION_INSTANCEDIR='INSTANCEDIR'
$VALUE_INSTANCEDIR='"D:\Program Files\Microsoft SQL Server"'

$OPTION_AGTSVCACCOUNT='AGTSVCACCOUNT'
$VALUE_AGTSVCACCOUNT=''

$OPTION_AGTSVCSTARTUPTYPE='AGTSVCSTARTUPTYPE'
$VALUE_AGTSVCSTARTUPTYPE='"Automatic"'

$OPTION_COMMFABRICPORT='COMMFABRICPORT'
$VALUE_COMMFABRICPORT='"0"'

$OPTION_COMMFABRICNETWORKLEVEL='COMMFABRICNETWORKLEVEL'
$VALUE_COMMFABRICNETWORKLEVEL='"0"'

$OPTION_COMMFABRICENCRYPTION='COMMFABRICENCRYPTION'
$VALUE_COMMFABRICENCRYPTION='"0"'

$OPTION_MATRIXCMBRICKCOMMPORT='MATRIXCMBRICKCOMMPORT'
$VALUE_MATRIXCMBRICKCOMMPORT='"0"'

$OPTION_SQLSVCSTARTUPTYPE='SQLSVCSTARTUPTYPE'
$VALUE_SQLSVCSTARTUPTYPE='"Automatic"'

$OPTION_FILESTREAMLEVEL='FILESTREAMLEVEL'
$VALUE_FILESTREAMLEVEL='"0"'

$OPTION_ENABLERANU='ENABLERANU'
$VALUE_ENABLERANU='"False"'

$OPTION_SQLCOLLATION='SQLCOLLATION'
$VALUE_SQLCOLLATION='"SQL_Latin1_General_CP1_CI_AS"'

$OPTION_SQLSVCACCOUNT='SQLSVCACCOUNT'
$VALUE_SQLSVCACCOUNT=''

$OPTION_SQLSVCINSTANTFILEINIT='SQLSVCINSTANTFILEINIT'
$VALUE_SQLSVCINSTANTFILEINIT='"True"'

$OPTION_SQLSYSADMINACCOUNTS='SQLSYSADMINACCOUNTS'
$VALUE_SQLSYSADMINACCOUNTS='"SAPCORP\GU_DelegationGroup_SQLDBA_Admin" "SAPCORP\GU_DelegationGroup_SQLSYS_Admin"'

$OPTION_SECURITYMODE='SECURITYMODE'
$VALUE_SECURITYMODE='"SQL"'

$OPTION_SQLTEMPDBFILECOUNT='SQLTEMPDBFILECOUNT'
$VALUE_SQLTEMPDBFILECOUNT=''

$OPTION_SQLTEMPDBFILESIZE='SQLTEMPDBFILESIZE'
$VALUE_SQLTEMPDBFILESIZE='"8"'

$OPTION_SQLTEMPDBFILEGROWTH='SQLTEMPDBFILEGROWTH'
$VALUE_SQLTEMPDBFILEGROWTH='"64"'

$OPTION_SQLTEMPDBLOGFILESIZE='SQLTEMPDBLOGFILESIZE'
$VALUE_SQLTEMPDBLOGFILESIZE='"8"'

$OPTION_SQLTEMPDBLOGFILEGROWTH='SQLTEMPDBLOGFILEGROWTH'
$VALUE_SQLTEMPDBLOGFILEGROWTH='"64"'

$OPTION_INSTALLSQLDATADIR='INSTALLSQLDATADIR'
$VALUE_INSTALLSQLDATADIR='"E:\MSSQL"'

$OPTION_SQLBACKUPDIR='SQLBACKUPDIR'
$VALUE_SQLBACKUPDIR='"E:\MSSQL\Backup"'

$OPTION_SQLUSERDBDIR='SQLUSERDBDIR'
$VALUE_SQLUSERDBDIR='"E:\MSSQL\Data"'

$OPTION_SQLUSERDBLOGDIR='SQLUSERDBLOGDIR'
$VALUE_SQLUSERDBLOGDIR='"F:\MSSQL\Log"'

$OPTION_SQLTEMPDBDIR='SQLTEMPDBDIR'
$VALUE_SQLTEMPDBDIR='"T:\MSSQL\TempDB_Data"'

$OPTION_SQLTEMPDBLOGDIR='SQLTEMPDBLOGDIR'
$VALUE_SQLTEMPDBLOGDIR='"U:\MSSQL\TempDB_Log"'

$OPTION_ADDCURRENTUSERASSQLADMIN='ADDCURRENTUSERASSQLADMIN'
$VALUE_ADDCURRENTUSERASSQLADMIN='"False"'

$OPTION_TCPENABLED='TCPENABLED'
$VALUE_TCPENABLED='"1"'

$OPTION_NPENABLED='NPENABLED'
$VALUE_NPENABLED='"0"'

$OPTION_BROWSERSVCSTARTUPTYPE='BROWSERSVCSTARTUPTYPE'
$VALUE_BROWSERSVCSTARTUPTYPE='"Automatic"'

$OPTION_FTSVCACCOUNT='FTSVCACCOUNT'
$VALUE_FTSVCACCOUNT='"NT Service\MSSQLFDLauncher$VALUE_MSSQLSERVER"'

$PATH_TO_READ_PARMS = "Y:\SQLCoreInstallParms.txt"


#Read parms from txt
$ARRAY_PARMS = Get-Content $PATH_TO_READ_PARMS

#Send Parms read to variables
$VALUE_AGTSVCACCOUNT=$ARRAY_PARMS[0]
$VALUE_SQLSVCACCOUNT=$ARRAY_PARMS[1]
$VALUE_SQLTEMPDBFILECOUNT=$ARRAY_PARMS[2]
$NAME_FILE_ISO=$ARRAY_PARMS[3]
$NAME_FILE_CONFIG=$ARRAY_PARMS[4]
$EXEC_SETUP_CMD_READ=$ARRAY_PARMS[5]

$PATH_TO_WRITE = $NAME_FILE_CONFIG

#$NAME_FILE_ISO=Read-Host -Prompt 'Input the SQLServer Installation file name .iso.'
#$VALUE_AGTSVCACCOUNT=Read-Host -Prompt 'Input Agent account name. Domain\User or system account.'
#$VALUE_SQLSVCACCOUNT=Read-Host -Prompt 'Input Account for SQL Server service: Domain\User or system account.'
#$VALUE_SQLSYSADMINACCOUNTS=Read-Host -Prompt 'Input Windows account(s) to provision as SQL Server system administrators.'
#$VALUE_SQLTEMPDBFILECOUNT=Read-Host -Prompt 'Input The number of Database Engine TempDB files. Ex: 4'

#SetUp the Commands and their values
$CMD_OPTION = $VALUE_OPTION
$CMD_ACTION = "$($OPTION_ACTION)=$($VALUE_ACTION)"
$CMD_IACCEPTSQLSERVERLICENSETERMS = "$($OPTION_IACCEPTSQLSERVERLICENSETERMS)=$($VALUE_IACCEPTSQLSERVERLICENSETERMS)"
$CMD_SUPPRESSPRIVACYSTATEMENTNOTICE = "$($OPTION_SUPPRESSPRIVACYSTATEMENTNOTICE)=$($VALUE_SUPPRESSPRIVACYSTATEMENTNOTICE)"
$CMD_IACCEPTROPENLICENSETERMS = "$($OPTION_IACCEPTROPENLICENSETERMS)=$($VALUE_IACCEPTROPENLICENSETERMS)"
$CMD_ENU = "$($OPTION_ENU)=$($VALUE_ENU)"
$CMD_UpdateEnabled = "$($OPTION_UpdateEnabled)=$($VALUE_UpdateEnabled)"
$CMD_USEMICROSOFTUPDATE = "$($OPTION_USEMICROSOFTUPDATE)=$($VALUE_USEMICROSOFTUPDATE)"
$CMD_FEATURES = "$($OPTION_FEATURES)=$($VALUE_FEATURES)"
$CMD_UpdateSource = "$($OPTION_UpdateSource)=$($VALUE_UpdateSource)"
$CMD_HELP = "$($OPTION_HELP)=$($VALUE_HELP)"
$CMD_INDICATEPROGRESS = "$($OPTION_INDICATEPROGRESS)=$($VALUE_INDICATEPROGRESS)"
$CMD_X86 = "$($OPTION_X86)=$($VALUE_X86)"
$CMD_INSTANCENAME = "$($OPTION_INSTANCENAME)=$($VALUE_INSTANCENAME)"
$CMD_INSTALLSHAREDDIR = "$($OPTION_INSTALLSHAREDDIR)=$($VALUE_INSTALLSHAREDDIR)"
$CMD_INSTALLSHAREDWOWDIR = "$($OPTION_INSTALLSHAREDWOWDIR)=$($VALUE_INSTALLSHAREDWOWDIR)"
$CMD_INSTANCEID = "$($OPTION_INSTANCEID)=$($VALUE_INSTANCEID)"
$CMD_SQLTELSVCACCT = "$($OPTION_SQLTELSVCACCT)=$($VALUE_SQLTELSVCACCT)"
$CMD_SQLTELSVCSTARTUPTYPE = "$($OPTION_SQLTELSVCSTARTUPTYPE)=$($VALUE_SQLTELSVCSTARTUPTYPE)"
$CMD_INSTANCEDIR = "$($OPTION_INSTANCEDIR)=$($VALUE_INSTANCEDIR)"
$CMD_AGTSVCACCOUNT = "$($OPTION_AGTSVCACCOUNT)=$($VALUE_AGTSVCACCOUNT)"
$CMD_AGTSVCSTARTUPTYPE = "$($OPTION_AGTSVCSTARTUPTYPE)=$($VALUE_AGTSVCSTARTUPTYPE)"
$CMD_COMMFABRICPORT = "$($OPTION_COMMFABRICPORT)=$($VALUE_COMMFABRICPORT)"
$CMD_COMMFABRICNETWORKLEVEL = "$($OPTION_COMMFABRICNETWORKLEVEL)=$($VALUE_COMMFABRICNETWORKLEVEL)"
$CMD_COMMFABRICENCRYPTION = "$($OPTION_COMMFABRICENCRYPTION)=$($VALUE_COMMFABRICENCRYPTION)"
$CMD_MATRIXCMBRICKCOMMPORT = "$($OPTION_MATRIXCMBRICKCOMMPORT)=$($VALUE_MATRIXCMBRICKCOMMPORT)"
$CMD_SQLSVCSTARTUPTYPE = "$($OPTION_SQLSVCSTARTUPTYPE)=$($VALUE_SQLSVCSTARTUPTYPE)"
$CMD_FILESTREAMLEVEL = "$($OPTION_FILESTREAMLEVEL)=$($VALUE_FILESTREAMLEVEL)"
$CMD_ENABLERANU = "$($OPTION_ENABLERANU)=$($VALUE_ENABLERANU)"
$CMD_SQLCOLLATION = "$($OPTION_SQLCOLLATION)=$($VALUE_SQLCOLLATION)"
$CMD_SQLSVCACCOUNT = "$($OPTION_SQLSVCACCOUNT)=$($VALUE_SQLSVCACCOUNT)"
$CMD_SQLSVCINSTANTFILEINIT = "$($OPTION_SQLSVCINSTANTFILEINIT)=$($VALUE_SQLSVCINSTANTFILEINIT)"
$CMD_SQLSYSADMINACCOUNTS = "$($OPTION_SQLSYSADMINACCOUNTS)=$($VALUE_SQLSYSADMINACCOUNTS)"
$CMD_SECURITYMODE = "$($OPTION_SECURITYMODE)=$($VALUE_SECURITYMODE)"
$CMD_SQLTEMPDBFILECOUNT = "$($OPTION_SQLTEMPDBFILECOUNT)=$($VALUE_SQLTEMPDBFILECOUNT)"
$CMD_SQLTEMPDBFILESIZE = "$($OPTION_SQLTEMPDBFILESIZE)=$($VALUE_SQLTEMPDBFILESIZE)"
$CMD_SQLTEMPDBFILEGROWTH = "$($OPTION_SQLTEMPDBFILEGROWTH)=$($VALUE_SQLTEMPDBFILEGROWTH)"
$CMD_SQLTEMPDBLOGFILESIZE = "$($OPTION_SQLTEMPDBLOGFILESIZE)=$($VALUE_SQLTEMPDBLOGFILESIZE)"
$CMD_SQLTEMPDBLOGFILEGROWTH = "$($OPTION_SQLTEMPDBLOGFILEGROWTH)=$($VALUE_SQLTEMPDBLOGFILEGROWTH)"
$CMD_INSTALLSQLDATADIR = "$($OPTION_INSTALLSQLDATADIR)=$($VALUE_INSTALLSQLDATADIR)"
$CMD_SQLBACKUPDIR = "$($OPTION_SQLBACKUPDIR)=$($VALUE_SQLBACKUPDIR)"
$CMD_SQLUSERDBDIR = "$($OPTION_SQLUSERDBDIR)=$($VALUE_SQLUSERDBDIR)"
$CMD_SQLUSERDBLOGDIR = "$($OPTION_SQLUSERDBLOGDIR)=$($VALUE_SQLUSERDBLOGDIR)"
$CMD_SQLTEMPDBDIR = "$($OPTION_SQLTEMPDBDIR)=$($VALUE_SQLTEMPDBDIR)"
$CMD_SQLTEMPDBLOGDIR = "$($OPTION_SQLTEMPDBLOGDIR)=$($VALUE_SQLTEMPDBLOGDIR)"
$CMD_ADDCURRENTUSERASSQLADMIN = "$($OPTION_ADDCURRENTUSERASSQLADMIN)=$($VALUE_ADDCURRENTUSERASSQLADMIN)"
$CMD_TCPENABLED = "$($OPTION_TCPENABLED)=$($VALUE_TCPENABLED)"
$CMD_NPENABLED = "$($OPTION_NPENABLED)=$($VALUE_NPENABLED)"
$CMD_BROWSERSVCSTARTUPTYPE = "$($OPTION_BROWSERSVCSTARTUPTYPE)=$($VALUE_BROWSERSVCSTARTUPTYPE)"
$CMD_FTSVCACCOUNT = "$($OPTION_FTSVCACCOUNT)=$($VALUE_FTSVCACCOUNT)"

#Writes to File.ini
$CMD_OPTION >> $PATH_TO_WRITE
$CMD_ACTION >> $PATH_TO_WRITE
$CMD_IACCEPTSQLSERVERLICENSETERMS >> $PATH_TO_WRITE
$CMD_SUPPRESSPRIVACYSTATEMENTNOTICE >> $PATH_TO_WRITE
$CMD_IACCEPTROPENLICENSETERMS >> $PATH_TO_WRITE
$CMD_ENU >> $PATH_TO_WRITE
$CMD_UpdateEnabled >> $PATH_TO_WRITE
$CMD_USEMICROSOFTUPDATE >> $PATH_TO_WRITE
$CMD_FEATURES >> $PATH_TO_WRITE
$CMD_UpdateSource >> $PATH_TO_WRITE
$CMD_HELP >> $PATH_TO_WRITE
$CMD_INDICATEPROGRESS >> $PATH_TO_WRITE
$CMD_X86 >> $PATH_TO_WRITE
$CMD_INSTANCENAME >> $PATH_TO_WRITE
$CMD_INSTALLSHAREDDIR >> $PATH_TO_WRITE
$CMD_INSTALLSHAREDWOWDIR >> $PATH_TO_WRITE
$CMD_INSTANCEID >> $PATH_TO_WRITE
$CMD_SQLTELSVCACCT >> $PATH_TO_WRITE
$CMD_SQLTELSVCSTARTUPTYPE >> $PATH_TO_WRITE
$CMD_INSTANCEDIR >> $PATH_TO_WRITE
$CMD_AGTSVCACCOUNT >> $PATH_TO_WRITE
$CMD_AGTSVCSTARTUPTYPE >> $PATH_TO_WRITE
$CMD_COMMFABRICPORT >> $PATH_TO_WRITE
$CMD_COMMFABRICNETWORKLEVEL >> $PATH_TO_WRITE
$CMD_COMMFABRICENCRYPTION >> $PATH_TO_WRITE
$CMD_MATRIXCMBRICKCOMMPORT >> $PATH_TO_WRITE
$CMD_SQLSVCSTARTUPTYPE >> $PATH_TO_WRITE
$CMD_FILESTREAMLEVEL >> $PATH_TO_WRITE
$CMD_ENABLERANU >> $PATH_TO_WRITE
$CMD_SQLCOLLATION >> $PATH_TO_WRITE
$CMD_SQLSVCACCOUNT >> $PATH_TO_WRITE
$CMD_SQLSVCINSTANTFILEINIT >> $PATH_TO_WRITE
$CMD_SQLSYSADMINACCOUNTS >> $PATH_TO_WRITE
$CMD_SECURITYMODE >> $PATH_TO_WRITE
$CMD_SQLTEMPDBFILECOUNT >> $PATH_TO_WRITE
$CMD_SQLTEMPDBFILESIZE >> $PATH_TO_WRITE
$CMD_SQLTEMPDBFILEGROWTH >> $PATH_TO_WRITE
$CMD_SQLTEMPDBLOGFILESIZE >> $PATH_TO_WRITE
$CMD_SQLTEMPDBLOGFILEGROWTH >> $PATH_TO_WRITE
$CMD_INSTALLSQLDATADIR >> $PATH_TO_WRITE
$CMD_SQLBACKUPDIR >> $PATH_TO_WRITE
$CMD_SQLUSERDBDIR >> $PATH_TO_WRITE
$CMD_SQLUSERDBLOGDIR >> $PATH_TO_WRITE
$CMD_SQLTEMPDBDIR >> $PATH_TO_WRITE
$CMD_SQLTEMPDBLOGDIR >> $PATH_TO_WRITE
$CMD_ADDCURRENTUSERASSQLADMIN >> $PATH_TO_WRITE
$CMD_TCPENABLED >> $PATH_TO_WRITE
$CMD_NPENABLED >> $PATH_TO_WRITE
$CMD_BROWSERSVCSTARTUPTYPE >> $PATH_TO_WRITE
$CMD_FTSVCACCOUNT >> $PATH_TO_WRITE

$EXEC_SETUP_CMD_FINAL = "$($EXEC_SETUP_CMD_READ)$('/ConfigurationFile')=$('"')$($NAME_FILE_CONFIG)$('"')$(' /QS')"

Write-Host 'Read the following Parms from .txt'
Write-Host 'Domain\adm account:'$ARRAY_PARMS[0]
Write-Host 'Domain\adm account:'$ARRAY_PARMS[1]
Write-Host 'TempDB Files:'$ARRAY_PARMS[2]
Write-Host 'Install file path iso:'$ARRAY_PARMS[3]
Write-Host 'Config.ini file name:'$ARRAY_PARMS[4]
Write-Host 'Setup Command read:'$ARRAY_PARMS[5]$('"')
Write-Host 'Final Command'$EXEC_SETUP_CMD_FINAL



$Global:NAME_FILE_ISO = $NAME_FILE_ISO


Mount-DiskImage -ImagePath $NAME_FILE_ISO


Write-Host 'Mounting on' $Global:NextDriveLetter

Invoke-Expression $Global:NextDriveLetter
DIR

Write-Host 'iso file path: '$NAME_FILE_ISO
Write-Host 'Ready to install using Command: ' $EXEC_SETUP_CMD_FINAL 

Invoke-Expression $EXEC_SETUP_CMD_FINAL

}

function DismountSqlIso{


#Dismount-DiskImage -ImagePath Y:\SW_DVD9_SQL_Svr_Enterprise_Edtn_2017_64Bit_English_MLF_X21-56962.ISO


Dismount-DiskImage -ImagePath $Global:NAME_FILE_ISO

}



cls

Get-NextDriverLetter
InstallSQLServerInstance
  
$DismountResp = Read-Host "Would you like to Dismount? (y) or (n) " +  $Global:NAME_FILE_ISO


if ($DismountResp -eq 'y' ) 
{
    Write-Host "Dismounting " + $Global:NAME_FILE_ISO
    DismountSqlIso
}
else {
    Write-Host ("CD-ROM kept mounted! Bye")
}
