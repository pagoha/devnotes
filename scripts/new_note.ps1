param (
    [Parameter(Mandatory=$true)]
    [string]$NoteName
)

$path = "notes\$NoteName.md"

if (Test-Path $path) {
    Write-Host "Note already exists."
    exit 1
}

"# $NoteName Notes`n" | Out-File $path
Write-Host "Created $path"
