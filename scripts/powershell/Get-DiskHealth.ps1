```powershell
<#
.SYNOPSIS
    Reports physical disk health and status.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-DiskHealth.ps1

.NOTES
    Read-only. Does not modify disks or storage configuration.

    Run PowerShell as Administrator if Windows restricts access
    to storage information.
#>

Get-PhysicalDisk |
Select-Object `
    FriendlyName,
    MediaType,
    @{Name = "SizeGB"; Expression = {
        [math]::Round($_.Size / 1GB, 2)
    }},
    HealthStatus,
    OperationalStatus |
Format-Table -AutoSize
```
