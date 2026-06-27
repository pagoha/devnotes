<#
.SYNOPSIS
  Validate DevNotes repository locally: Markdown linting + spell checking.
.DESCRIPTION
  Lints all Markdown files in notes/ and snippets/ folders,
  and checks spelling using cspell. Reports issues without modifying files.
#>

# Ensure Node.js is installed for markdownlint-cli and cspell
# You can install globally once: npm install -g markdownlint-cli cspell

Write-Host "Validating repository structure..."
$missingRequiredPath = $false

if (-Not (Test-Path README.md)) {
    Write-Host "Missing README.md"
    $missingRequiredPath = $true
}

if (-Not (Test-Path notes)) {
    Write-Host "Missing notes/ folder"
    $missingRequiredPath = $true
}

if (-Not (Test-Path snippets)) {
    Write-Host "Missing snippets/ folder"
    $missingRequiredPath = $true
}

if (-Not (Test-Path scripts)) {
    Write-Host "Missing scripts/ folder"
    $missingRequiredPath = $true
}

if ($missingRequiredPath) {
    exit 1
}

Write-Host "Repository structure check complete.`n"

Write-Host "Linting Markdown files..."
try {
    npm run lint:md
    Write-Host "Markdown linting complete.`n"
} catch {
    Write-Host "Markdown linting found issues.`n"
    exit 1
}

Write-Host "Running spell check..."
try {
    npm run lint:spell
    Write-Host "Spell check complete.`n"
} catch {
    Write-Host "Spell check found issues.`n"
    exit 1
}

Write-Host "Local validation finished!"
