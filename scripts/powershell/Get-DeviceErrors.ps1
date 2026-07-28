<#
.SYNOPSIS
    Finds Windows devices reporting errors.

.DESCRIPTION
    Lists Plug and Play devices with a non-zero problem code.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-DeviceErrors.ps1

.NOTES
    Read-only. Does not modify device configuration.

    Run PowerShell as Administrator if Windows restricts access
    to device information.
#>

Get-PnpDevice -PresentOnly |
Where-Object { $_.Problem -ne 0 } |
Select-Object `
    Status,
    Class,
    FriendlyName,
    InstanceId,
    Problem |
Format-Table -AutoSize