# Visual Studio Code on Windows (2026): Install Types, Context Menu Integration, and Troubleshooting

**Author:** Paul Agoha  

> This guide explains the *2026* reality of installing VS Code on Windows 11, why **“Open with Code”** sometimes goes missing, how Windows 11’s **modern vs classic** context menus work, and step‑by‑step fixes that **preserve your extensions and settings**.

---

## Table of contents
- [Visual Studio Code on Windows (2026): Install Types, Context Menu Integration, and Troubleshooting](#visual-studio-code-on-windows-2026-install-types-context-menu-integration-and-troubleshooting)
  - [Table of contents](#table-of-contents)
  - [Quick answers](#quick-answers)
  - [Install types in 2026 (User vs System)](#install-types-in-2026-user-vs-system)
  - [Where VS Code stores your data (safe during reinstall)](#where-vs-code-stores-your-data-safe-during-reinstall)
  - [Windows 11 context menus: modern vs classic](#windows-11-context-menus-modern-vs-classic)
  - [Symptoms \& root causes](#symptoms--root-causes)
  - [Fix paths (choose one)](#fix-paths-choose-one)
    - [Path A — Keep modern menu; install **System** version](#path-a--keep-modern-menu-install-system-version)
    - [Path B — Prefer classic menu globally (one‑click)](#path-b--prefer-classic-menu-globally-oneclick)
    - [Path C — Manual registration (advanced)](#path-c--manual-registration-advanced)
  - [Post‑install verification checklist](#postinstall-verification-checklist)
  - [Cleanup after migrating from User → System](#cleanup-after-migrating-from-user--system)
  - [FAQ](#faq)
  - [Appendix: Commands \& Registry snippets](#appendix-commands--registry-snippets)
    - [Download (official)](#download-official)
    - [Show classic menu by default (toggle)](#show-classic-menu-by-default-toggle)
    - [Verify settings \& extensions locations](#verify-settings--extensions-locations)
    - [References](#references)

---

## Quick answers
- **Where to download the System installer?** Use the official download page and pick **Windows → System Installer (x64)**.  citeturn28search7turn28search10
- **Will I lose my extensions/settings if I uninstall?** No. They live under `%APPDATA%\Code\User` and `%USERPROFILE%\.vscode\extensions`, not in the app folder.  citeturn28search19turn28search22
- **Why is “Open with Code” only under _Show more options_?** Because Windows 11’s **modern** menu surfaces curated/signed handlers; legacy verbs show in the classic fallback.  citeturn28search25turn28search26
- **Can I force “Open with Code” to the modern top‑level?** Not reliably with registry alone; it requires a packaged/signed Explorer command handler (app vendor change).  citeturn28search13turn28search18

---

## Install types in 2026 (User vs System)

VS Code offers two Windows installers:

| Type | Path | Elevation | Who gets it | Modern menu eligibility |
|---|---|---|---|---|
| **User Setup** | `%LOCALAPPDATA%\Programs\Microsoft VS Code` | No | Current user | *Legacy verbs only* → appears under **Show more options** |
| **System Installer** | `C:\Program Files\Microsoft VS Code` | Yes | All users | Eligible for modern menu (subject to Windows surfacing rules) |

**Why it matters:** the **System** installer registers machine‑scope shell integration that the Windows 11 modern menu can discover; the **User** installer registers per‑user legacy verbs that appear in the **classic** menu.  citeturn28search7turn28search10

> Official docs: *“VS Code provides both Windows user and system level setups … User setup installs under Local AppData; System setup installs under Program Files (all users).”*  citeturn28search7

---

## Where VS Code stores your data (safe during reinstall)
- **User settings, keybindings, snippets, profiles:** `%APPDATA%\Code\User`  
- **Extensions:** `%USERPROFILE%\.vscode\extensions`  
These locations are **not deleted** by a normal uninstall/reinstall.  citeturn28search19turn28search22

**Optional backup before uninstall:**
```powershell
code --list-extensions > $env:USERPROFILE\vscode-extensions.txt
```

---

## Windows 11 context menus: modern vs classic
Windows 11 ships a **modern (XAML)** context menu and keeps the **classic** menu behind **Show more options**.

- **Modern menu:** surfaces a *curated* set of commands from packaged apps or signed Explorer command handlers.  
- **Classic menu:** shows legacy shell verbs (e.g., `…\Directory\shell`), accessed via **Show more options** or `Shift+F10`.  citeturn28search25turn28search26

Developers targeting the modern menu implement/register **`IExplorerCommand`**; discovery differs from legacy verb registration.  citeturn28search13

---

## Symptoms & root causes
- “Open with Code” missing entirely → installer options unchecked, broken registration, or Store build.  citeturn28search2
- Present only under **Show more options** → expected for legacy verbs and most non‑packaged Win32 apps.  citeturn28search26
- Appears in left pane but not right pane → FolderView caching/verb filtering; fix by explicit `Folder` registration (see Path C).  *(Behavior consistent with Win11’s view‑specific menus).*  citeturn28search26

---

## Fix paths (choose one)

### Path A — Keep modern menu; install **System** version
1) **Uninstall** current VS Code (Settings → Apps → Installed apps → Visual Studio Code → Uninstall).  
2) **Install** from the official page → **Windows → System Installer (x64)**. During setup, check:  
   - **Add “Open with Code” to Windows Explorer**  
   - Add to PATH  
3) **Reboot** to reload Explorer’s machine‑scope handlers.  citeturn28search7turn28search10

**Result:** “Open with Code” appears consistently (modern menu may still choose to place it under classic in some builds; that’s by design of Windows 11’s curated surfacing).  citeturn28search25

---

### Path B — Prefer classic menu globally (one‑click)
If you want one‑click access to **all** legacy verbs:

```cmd
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```
Restart Explorer or reboot. To revert, delete that key.  citeturn28search26turn28search33

**Effect:** Windows shows the **classic** context menu by default; “Open with Code” returns to first‑level right‑click (Win10‑style).  citeturn28search26

---

### Path C — Manual registration (advanced)
If folder *background* shows “Open with Code” but folder *items* don’t, add explicit `Folder`/`Directory` verbs (System install assumed):

```powershell
# Run PowerShell as Administrator
$exe = "C:\\Program Files\\Microsoft VS Code\\Code.exe"

# Folder objects (right pane items)
New-Item "HKLM:\\Software\\Classes\\Folder\\shell\\VSCode" -Force | Out-Null
Set-ItemProperty "HKLM:\\Software\\Classes\\Folder\\shell\\VSCode" -Name "MUIVerb" -Value "Open with Code"
Set-ItemProperty "HKLM:\\Software\\Classes\\Folder\\shell\\VSCode" -Name "Icon" -Value $exe
New-Item "HKLM:\\Software\\Classes\\Folder\\shell\\VSCode\\command" -Force | Out-Null
Set-ItemProperty "HKLM:\\Software\\Classes\\Folder\\shell\\VSCode\\command" -Name "(Default)" -Value "`"$exe`" `"%1`""

# Directory objects (optional; complements Folder)
New-Item "HKLM:\\Software\\Classes\\Directory\\shell\\VSCode" -Force | Out-Null
Set-ItemProperty "HKLM:\\Software\\Classes\\Directory\\shell\\VSCode" -Name "MUIVerb" -Value "Open with Code"
Set-ItemProperty "HKLM:\\Software\\Classes\\Directory\\shell\\VSCode" -Name "Icon" -Value $exe
New-Item "HKLM:\\Software\\Classes\\Directory\\shell\\VSCode\\command" -Force | Out-Null
Set-ItemProperty "HKLM:\\Software\\Classes\\Directory\\shell\\VSCode\\command" -Name "(Default)" -Value "`"$exe`" `"%1`""
```
Restart Explorer. *(This targets legacy/classic surfacing; modern menu promotion remains curated by Windows.)*  citeturn28search2

> Tip: If you previously had a **User Setup**, remove leftover HKCU verbs to avoid conflicts.

```powershell
Remove-Item "HKCU:\\Software\\Classes\\Directory\\shell\\VSCode" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "HKCU:\\Software\\Classes\\Folder\\shell\\VSCode" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "HKCU:\\Software\\Classes\\Directory\\Background\\shell\\VSCode" -Recurse -Force -ErrorAction SilentlyContinue
```

---

## Post‑install verification checklist
- **VS Code scope:**
  ```powershell
  where code
  # Expect: C:\\Program Files\\Microsoft VS Code\\bin\\code.cmd
  ```
- **Modern vs classic:** Right‑click a folder → if not on first menu, choose **Show more options**; it should be there.  citeturn28search26
- **Settings/Extensions present:** confirm theme, extensions, keybindings intact. Locations: `%APPDATA%\Code\User`, `%USERPROFILE%\.vscode\extensions`.  citeturn28search19turn28search22

---

## Cleanup after migrating from User → System
If you see duplicate/odd entries, remove the stale **HKCU** command left by the User installer:

```powershell
Get-ChildItem HKCU:\Software\Classes\Directory\shell | Where-Object { $_.Name -match "Code|VSCode" }
# If found, remove it:
Remove-Item "HKCU:\\Software\\Classes\\Directory\\shell\\VSCode" -Recurse -Force
```
Then restart Explorer:
```powershell
taskkill /IM explorer.exe /F
start explorer.exe
```
*(Prevents conflicts between per‑user and machine‑scope verbs.)*

---

## FAQ
**Q: Will a simple reinstall (without uninstall) fix modern‑menu surfacing?**  
**A:** No. Running the **User** installer again does an in‑place update with the same scope. To gain machine‑scope handlers, uninstall **User** setup and install the **System** setup.  citeturn28search7

**Q: Can VS Code be promoted to the top‑level modern menu via registry only?**  
**A:** No. The modern menu is curated and favors packaged apps or signed ExplorerCommand handlers. Legacy verbs remain in **Show more options** by design.  citeturn28search13turn28search25

**Q: Is there a supported way to always see the classic menu?**  
**A:** Yes. Add the `{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}` per‑user registry key (see Path B) to make the classic menu default; remove the key to revert.  citeturn28search26

**Q: What about Store or winget installs?**  
**A:** Store packages are sandboxed and often lack classic verb registrations. Prefer the official **System Installer** for full shell integration on dev machines.  citeturn28search12

---

## Appendix: Commands & Registry snippets

### Download (official)
- **https://code.visualstudio.com/download** → Windows → **System Installer (x64)**.  citeturn28search7

### Show classic menu by default (toggle)
```cmd
:: Enable classic
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

:: Disable classic (restore modern)
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```
citeturn28search26

### Verify settings & extensions locations
- `%APPDATA%\Code\User`  
- `%USERPROFILE%\.vscode\extensions`  citeturn28search19turn28search22

---

### References
- **VS Code on Windows (official docs)** – install paths, User vs System setup  
  https://code.visualstudio.com/docs/setup/windows  citeturn28search7
- **VS Code docs (repo, updated for 1.108)**  
  https://github.com/Microsoft/vscode-docs/blob/main/docs/setup/windows.md  citeturn28search10
- **Settings & configuration storage**  
  https://code.visualstudio.com/docs/configure/settings  citeturn28search19
- **Unsaved/backup & user data locations (community references)**  
  https://superuser.com/questions/1225368/visual-studio-code-unsaved-files-location  citeturn28search22
- **Windows 11 modern vs classic context menu**  
  https://www.howtogeek.com/759449/how-to-get-full-context-menus-in-windows-11s-file-explorer/  citeturn28search26
- **Restore legacy (classic) menu toggle**  
  https://learn.microsoft.com/en-gb/answers/questions/2287432/(article)-restore-old-right-click-context-menu-in  citeturn28search25
- **Explorer command handlers (IExplorerCommand)**  
  https://learn.microsoft.com/en-us/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommand  citeturn28search13
- **Add/restore “Open with Code” via installer or registry (practical)**  
  https://www.winhelponline.com/blog/restore-open-with-vs-code-context-menu/  citeturn28search2

---
