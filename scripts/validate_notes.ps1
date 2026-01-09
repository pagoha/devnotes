<#
.SYNOPSIS
  Validate DevNotes repository locally: Markdown linting + spell checking.
.DESCRIPTION
  Lints all Markdown files in notes/ and snippets/ folders,
  and checks spelling using cspell. Reports issues without modifying files.
#>

# Ensure Node.js is installed for markdownlint-cli and cspell
# You can install globally once: npm install -g markdownlint-cli cspell

Write-Host "🔹 Validating repository structure..."
if (-Not (Test-Path README.md)) { Write-Host "❌ README.md missing" }
if (-Not (Test-Path notes)) { Write-Host "❌ notes/ folder missing" }
if (-Not (Test-Path snippets)) { Write-Host "❌ snippets/ folder missing" }
if (-Not (Test-Path scripts)) { Write-Host "❌ scripts/ folder missing" }
Write-Host "✅ Repository structure check complete.`n"

Write-Host "🔹 Linting Markdown files..."
try {
    markdownlint "notes/**/*.md" "snippets/**/*.md"
    Write-Host "✅ Markdown linting complete.`n"
} catch {
    Write-Host "⚠️ Markdown linting found issues.`n"
}

Write-Host "🔹 Running spell check..."
try {
    cspell "notes/**/*.md" "snippets/**/*.md"
    Write-Host "✅ Spell check complete.`n"
} catch {
    Write-Host "⚠️ Spell check found issues.`n"
}

Write-Host "🎉 Local validation finished!"
