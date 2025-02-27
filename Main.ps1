#Variables to define the Windows OS / Edition etc to be applied during OSDCloud

$OSName = 'Windows 11 24H2 x64'
$OSEdition = 'Pro'
$OSActivation = 'Retail'
$OSLanguage = 'en-gb'

#Set OSDCloud Vars
$Global:MyOSDCloud = [ordered]@{
    Restart = [bool]$true
    RecoveryPartition = [bool]$true
    OEMActivation = [bool]$true
    WindowsUpdate = [bool]$true
    WindowsUpdateDrivers = [bool]$true
    WindowsDefenderUpdate = [bool]$true
    SetTimeZone = [bool]$true
    ClearDiskConfirm = [bool]$False
    ShutdownSetupComplete = [bool]$false
    SyncMSUpCatDriverUSB = [bool]$true
    ApplyCatalogFirmware = $true
    CheckSHA1 = [bool]$true
}

Write-Host "OSDCloud Variables"
Write-Output $Global:MyOSDCloud

Start-Sleep -Seconds 20

#Launch OSDCloud
Write-Host "Starting OSDCloud" -ForegroundColor Green
write-host "Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage"

Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage -Firmware -Restart

restart-computer
