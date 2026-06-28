param (
    [Parameter(Mandatory=$true)]
    [string]$NoteName
)

$path = "notes\$NoteName.md"
$templatePath = "notes\starter-template.md"

if (Test-Path $path) {
    Write-Host "Note already exists."
    exit 1
}

if (-Not (Test-Path $templatePath)) {
    Write-Host "Starter template not found at $templatePath"
    exit 1
}

$content = Get-Content -Raw -Path $templatePath
$content = $content -replace '# DevNotes Starter Template', "# $NoteName Notes"

$content | Out-File -FilePath $path -Encoding utf8
Write-Host "Created $path from starter template."
