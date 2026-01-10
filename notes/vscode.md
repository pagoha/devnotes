# VSCode Setup Guide

## 🎯 Purpose

This guide explains how to configure Visual Studio Code for working with the **DevNotes** repository. It covers recommended extensions, workspace settings, Markdown linting, spell checking, and productivity workflows that keep contributions consistent with the repo’s automation and CI checks.

---

## 🧩 Recommended Extensions

These extensions align with DevNotes’ focus on Markdown, documentation quality, and lightweight scripting.

| Extension | Purpose |
| ---------- | --------- |
| **Markdown All in One** | Enhances Markdown editing, shortcuts, TOC generation |
| **markdownlint** | Enforces the repo’s `markdownlint.json` rules |
| **Code Spell Checker (cSpell)** | Matches the repo’s spell‑check workflow |
| **GitLens** | Improves Git history visibility across notes |
| **PowerShell** | Required for running scripts in `/scripts` |
| **YAML** | Helpful for editing GitHub Actions workflows |
| **Prettier** (optional) | Consistent formatting for code snippets |

To prompt contributors to install these automatically, create a `.vscode/extensions.json` file:

```json
{
  "recommendations": [
    "yzhang.markdown-all-in-one",
    "davidanson.vscode-markdownlint",
    "streetsidesoftware.code-spell-checker",
    "eamodio.gitlens",
    "ms-vscode.powershell",
    "redhat.vscode-yaml",
    "esbenp.prettier-vscode"
  ]
}
```

---

## ⚙️ Workspace Settings

These settings help maintain consistency across notes and scripts.

Create `.vscode/settings.json`:

```json
{
  "editor.wordWrap": "on",
  "editor.formatOnSave": true,
  "files.trimTrailingWhitespace": true,

  // Markdown
  "markdownlint.config": "./markdownlint.json",
  "markdown.preview.breaks": true,

  // Spell checking
  "cSpell.enabled": true,
  "cSpell.words": ["DevNotes"],

  // PowerShell
  "powershell.codeFormatting.addWhitespaceAroundPipe": true
}
```

---

## 🧪 Linting & Spell Check

Your CI pipeline validates:

- Markdown formatting (`markdownlint`)
- Spelling (`cspell`)

To match CI locally, run:

```powershell
./scripts/validate.ps1
```

This ensures your notes pass the same checks before pushing.

---

## 📝 Creating New Notes

Use the provided script to generate a properly structured note:

```powershell
./scripts/new_note.ps1 <topic>
```

This enforces consistent naming and front‑matter across the repo.

---

## 📦 VS Code Tasks (Optional but Helpful)

You can add tasks to streamline common actions.

Create `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Validate Notes",
      "type": "shell",
      "command": "./scripts/validate.ps1",
      "problemMatcher": []
    },
    {
      "label": "New Note",
      "type": "shell",
      "command": "./scripts/new_note.ps1",
      "args": ["example"],
      "problemMatcher": []
    }
  ]
}
```

This allows:

- **Ctrl+Shift+B** → Run validation
- **Command Palette → Run Task → New Note**

---

## 🐙 Git Workflow Tips

DevNotes is documentation‑first, so a lightweight Git workflow works best:

- Use small, focused commits
- Prefer descriptive commit messages
- Keep note titles and filenames consistent
- Use branches for reorganizing or large additions

VS Code’s Git UI is ideal for this style of repo.

---

## 🧭 Repo Navigation

Key directories:

| Folder | Purpose |
| -------- | --------- |
| `notes/` | Main Markdown notes |
| `snippets/` | Reusable code examples |
| `scripts/` | PowerShell automation |
| `.github/workflows/` | CI configuration |

Start in:

- `notes/` when writing content
- `scripts/` when extending automation
- `.github/workflows/` when modifying CI

---

## 🚀 Optional Enhancements

If you want to elevate the contributor experience further:

- Add a **Dev Container** for consistent tooling
- Add a **Markdown preview stylesheet** for custom branding
- Add VS Code **snippets** for note templates
- Add a **pre‑commit hook** that runs your validation script
