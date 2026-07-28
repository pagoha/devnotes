<#
.SYNOPSIS
    Displays basic Windows system information.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-SystemInfo.ps1

.NOTES
    Read-only. Does not modify system settings.
#>

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem
$Processor = Get-CimInstance Win32_Processor

[PSCustomObject]@{
    ComputerName      = $ComputerSystem.Name
    Manufacturer      = $ComputerSystem.Manufacturer
    Model             = $ComputerSystem.Model
    CPU               = $Processor.Name
    Cores             = $Processor.NumberOfCores
    LogicalProcessors = $Processor.NumberOfLogicalProcessors
    RAM_GB            = [math]::Round(
        $ComputerSystem.TotalPhysicalMemory / 1GB,
        2
    )
    Windows           = $OperatingSystem.Caption
    Version           = $OperatingSystem.Version
    Build             = $OperatingSystem.BuildNumber
    LastBoot          = $OperatingSystem.LastBootUpTime
} |
Format-List