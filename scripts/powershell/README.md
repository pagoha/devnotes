# PowerShell Scripts

A collection of practical PowerShell scripts for Windows administration, troubleshooting, development, automation, and everyday tasks.

## Categories

- System & Hardware
- Storage & Files
- Networking
- Windows Administration
- Development & Git
- Diagnostics & Troubleshooting
- Automation & Utilities

## Usage

Scripts support two ways to use them:

- **Copy and paste:** Paste the complete code directly into PowerShell.
- **Save and reuse:** Save the code as a `.ps1` file for repeated use.

Scripts identify common customization values near the beginning of the code.

> **Tip:** Start by copying and pasting. Save scripts you use regularly.

## Script Standards

Scripts are:

- Copy/paste-ready
- Easy to modify
- Focused on one task
- Read-only when possible
- Clearly marked when they modify or delete data

## Example

**Folder Size Report**

Finds the largest folders under a specified path.

```powershell
# Change this path
$Path = "C:\Users"

Get-ChildItem $Path -Force -Directory -ErrorAction SilentlyContinue |
ForEach-Object {
    $size = (
        Get-ChildItem $_.FullName -Force -File -Recurse -ErrorAction SilentlyContinue |
        Measure-Object Length -Sum
    ).Sum

    [PSCustomObject]@{
        Folder = $_.FullName
        SizeGB = [math]::Round($size / 1GB, 2)
    }
} |
Sort-Object SizeGB -Descending |
Format-Table -AutoSize
```

## Safety

Scripts are read-only unless stated otherwise.

Review any script before running it with Administrator privileges.

> **Goal:** Small scripts that solve real problems.

````

---

## `Get-FolderSize.ps1`

:::writing{variant="document" id="68413"}
```powershell
<#
.SYNOPSIS
    Reports the size of each immediate subfolder.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-FolderSize.ps1

.NOTES
    Read-only. Does not modify, move, or delete files.

    Change $Path below to the folder you want to analyze.
#>

# Change this path
$Path = "C:\Users"

Get-ChildItem $Path -Force -Directory -ErrorAction SilentlyContinue |
ForEach-Object {
    $size = (
        Get-ChildItem $_.FullName -Force -File -Recurse -ErrorAction SilentlyContinue |
        Measure-Object Length -Sum
    ).Sum

    [PSCustomObject]@{
        Folder = $_.FullName
        SizeGB = [math]::Round($size / 1GB, 2)
    }
} |
Sort-Object SizeGB -Descending |
Format-Table -AutoSize
````

**Example path:**

```powershell
$Path = "D:\Backups"
```
