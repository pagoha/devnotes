<#
.SYNOPSIS
    Displays active network adapter and IP configuration.

.DESCRIPTION
    Reports active network adapters, link speed, MAC addresses,
    IP addresses, default gateways, and DNS servers.

.USAGE
    Copy and paste the entire script into PowerShell.

    To save for reuse, save this file as:
    Get-NetworkInfo.ps1

.NOTES
    Read-only. Does not modify network settings.
#>

Write-Host "`n=== Network Adapters ===" -ForegroundColor Cyan

Get-NetAdapter |
Where-Object Status -eq "Up" |
Select-Object `
    Name,
    InterfaceDescription,
    Status,
    LinkSpeed,
    MacAddress |
Format-Table -AutoSize

Write-Host "`n=== IP Configuration ===" -ForegroundColor Cyan

Get-NetIPConfiguration |
Where-Object { $_.NetAdapter.Status -eq "Up" } |
Select-Object `
    InterfaceAlias,
    IPv4Address,
    IPv6Address,
    IPv4DefaultGateway,
    DNSServer |
Format-List