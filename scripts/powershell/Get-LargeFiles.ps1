```powershell
<#
.SYNOPSIS
    Finds the largest files under a specified path.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-LargeFiles.ps1

.NOTES
    Read-only. Does not modify, move, or delete files.

    Change $Path and $Top below as needed.
#>

# Change these values
$Path = "C:\Users"
$Top = 25

Get-ChildItem $Path -Force -File -Recurse -ErrorAction SilentlyContinue |
Sort-Object Length -Descending |
Select-Object -First $Top `
    FullName,
    @{Name = "SizeGB"; Expression = {
        [math]::Round($_.Length / 1GB, 2)
    }} |
Format-Table -AutoSize
```

**Example:**

```powershell
$Path = "C:\Users"
$Top = 50
```
