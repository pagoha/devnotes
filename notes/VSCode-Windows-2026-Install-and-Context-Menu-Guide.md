# Visual Studio Code on Windows (2026)

**Install Types, Context Menu Integration, and Troubleshooting**
*Author: Paul Agoha*

**Last updated:** January 2026

This guide explains installing VS Code on Windows 11 in 2026, why “Open with Code” often only appears after “Show more options” in the modern context menu, how modern vs classic menus behave, and reliable fixes — all without losing your extensions or settings.

> **Important 2026 note:** Recent versions (notably v1.103+) introduced temporary bugs where even checked context menu options during install failed to register properly. These were widely reported in August 2025 and mostly fixed via repair/reinstall in later patches. The core advice below still applies fully.

## Table of Contents

- [Quick Answers](#quick-answers)
- [Install Types (User vs System Installer)](#install-types-user-vs-system-installer)
- [Where Your Data Lives (Safe During Reinstall)](#where-your-data-lives-safe-during-reinstall)
- [Windows 11 Context Menus: Modern vs Classic](#windows-11-context-menus-modern-vs-classic)
- [Common Symptoms & Causes](#common-symptoms--causes)
- [Fix Options (Pick One)](#fix-options-pick-one)
  - [Path A: Switch to System Installer (Recommended)](#path-a-switch-to-system-installer-recommended)
  - [Path B: Force Classic Menu Globally (Easiest)](#path-b-force-classic-menu-globally-easiest)
  - [Path C: Manual Registry Fix (Advanced)](#path-c-manual-registry-fix-advanced-when-needed)
- [Post-Install Verification](#post-install-verification)
- [Cleanup After User → System Migration](#cleanup-after-user--system-migration)
- [FAQ](#faq)
- [Appendix: Useful Commands & Snippets](#appendix-useful-commands--snippets)

## Quick Answers

- **Best download for full shell integration?**
  Official site → <https://code.visualstudio.com/download> → **Windows** → **System Installer** (x64)

- **Lose extensions/settings on uninstall?**
  No — they live in:
  `%APPDATA%\Code\User` (settings, keybindings, snippets, profiles)
  `%USERPROFILE%\.vscode\extensions` (extensions)

- **Why only under “Show more options”?**
  VS Code registers legacy shell verbs. Windows 11's modern (curated) context menu prefers packaged/signed handlers. Even the System installer often lands in the classic submenu.

- **Force top-level modern menu via registry?**
  Not reliably — requires native IExplorerCommand support that VS Code stable doesn't fully implement yet.

## Install Types (User vs System Installer)

| Feature                  | User Installer                                      | System Installer                                      |
|--------------------------|-----------------------------------------------------|-------------------------------------------------------|
| **Default?**             | Yes (recommended by Microsoft for most users)       | No                                                    |
| **Location**             | `%LOCALAPPDATA%\Programs\Microsoft VS Code`         | `C:\Program Files\Microsoft VS Code`                  |
| **Admin required?**      | No                                                  | Yes                                                   |
| **Scope**                | Current user only                                   | All users                                             |
| **Updates**              | Seamless background (no elevation)                  | Requires elevation                                    |
| **Context menu**         | Legacy verbs → usually "Show more options"          | Machine-wide → better chance, but often still legacy  |
| **Recommended for**      | Single-user, smooth updates                         | Multi-user machines, max integration                  |

During install, check these boxes (very important):

- [ ] Add “Open with Code” to Explorer file context menu
- [ ] Add “Open with Code” to Explorer directory context menu
- [ ] Add to PATH (recommended)

## Where Your Data Lives (Safe During Reinstall)

These folders survive normal uninstall/reinstall:

- Settings/keybindings/snippets/profiles: `%APPDATA%\Code\User`
- Extensions: `%USERPROFILE%\.vscode\extensions`

Quick backup (optional):

```powershell
code --list-extensions > "$env:USERPROFILE\vscode-extensions.txt"
```

## Windows 11 Context Menus: Modern vs Classic

- **Modern** (default): Slim, curated list — only strongly signed/packaged commands appear here by default.
- **Classic** (legacy): Full old-school menu — shown after “Show more options” or Shift + right-click.

VS Code (even System install) typically uses legacy registration → ends up in classic.

## Common Symptoms & Causes

| Symptom | Likely Cause |
| --------- | -------------- |
| Missing entirely | Option unchecked / Store version / broken registration / v1.103 bug |
| Only in “Show more options” | Expected behavior for legacy verbs (most common in 2026) |
| Shows on folder background but not files | Incomplete Folder/Directory registration |
| Disappeared after update | Known bug in v1.103 (Aug 2025) — repair/reinstall usually resolves |

## Fix Options (Pick One)

### Path A: Switch to System Installer (Recommended)

1. Uninstall VS Code (Settings > Apps > Installed apps > Uninstall).
2. Download **System Installer (x64)** from <https://code.visualstudio.com/download>.
3. Run as admin → check all context menu + PATH options.
4. Complete install → restart PC (or Explorer: `taskkill /IM explorer.exe /F && start explorer.exe`).

Gives the cleanest official integration (still often requires "Show more options").

### Path B: Force Classic Menu Globally (Easiest)

Run in Command Prompt (no admin needed):

```cmd
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
```

Restart Explorer (or reboot).

→ Full Windows 10-style context menu becomes default — “Open with Code” appears immediately.

**Revert:**

```cmd
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```

### Path C: Manual Registry Fix (Advanced when needed)

Run PowerShell **as Administrator**:

```powershell
$exe = "C:\Program Files\Microsoft VS Code\Code.exe"

# For files/folders
New-Item -Path "HKLM:\Software\Classes\*\shell\Open with Code" -Force
Set-ItemProperty -Path "HKLM:\Software\Classes\*\shell\Open with Code" -Name "MUIVerb" -Value "Open with Code"
Set-ItemProperty -Path "HKLM:\Software\Classes\*\shell\Open with Code" -Name "Icon" -Value $exe

New-Item -Path "HKLM:\Software\Classes\*\shell\Open with Code\command" -Force
Set-ItemProperty -Path "HKLM:\Software\Classes\*\shell\Open with Code\command" -Name "(Default)" -Value "`"$exe`" `"%1`""

# For directories (folders themselves)
New-Item -Path "HKLM:\Software\Classes\Directory\shell\Open with Code" -Force
Set-ItemProperty -Path "HKLM:\Software\Classes\Directory\shell\Open with Code" -Name "MUIVerb" -Value "Open with Code"
Set-ItemProperty -Path "HKLM:\Software\Classes\Directory\shell\Open with Code" -Name "Icon" -Value $exe

New-Item -Path "HKLM:\Software\Classes\Directory\shell\Open with Code\command" -Force
Set-ItemProperty -Path "HKLM:\Software\Classes\Directory\shell\Open with Code\command" -Name "(Default)" -Value "`"$exe`" `"%1`""
```

Restart Explorer afterwards.

**Clean old User install leftovers (if switching):**

```powershell
Remove-Item "HKCU:\Software\Classes\*\shell\Open with Code" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "HKCU:\Software\Classes\Directory\shell\Open with Code" -Recurse -Force -ErrorAction SilentlyContinue
```

## Post-Install Verification

- Run in terminal: `where code` → should point to `C:\Program Files\Microsoft VS Code\bin\code.cmd`
- Right-click files/folders → check both modern and classic menus
- Open VS Code → confirm extensions, themes, settings are intact

## Cleanup After User → System Migration

Check for stale entries:

```powershell
Get-ChildItem HKCU:\Software\Classes\*\shell | Where-Object { $_.Name -match "Code" }
```

Remove found items (example):

```powershell
Remove-Item "HKCU:\Software\Classes\Directory\shell\Open with Code" -Recurse -Force
```

Restart Explorer.

## FAQ

**Q: Does reinstall fix modern menu placement?**
A: Usually no — stick with System install + Path B for reliable access.

**Q: Store or winget version?**
A: Avoid for full shell integration — sandboxed, often misses context menus.

**Q: Recent bugs in 2025/2026?**
A: Yes — v1.103 (Aug 2025) broke context menu registration for many. Repair via installer, reinstall, or downgrade temporarily.

## Appendix: Useful Commands & Snippets

**Force classic menu (Path B):**

```cmd
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f
```

**Official resources:**

- <https://code.visualstudio.com/docs/setup/windows>
- <https://github.com/microsoft/vscode/issues> (search "context menu" for latest bugs)
