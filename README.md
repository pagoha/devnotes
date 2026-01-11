# DevNotes 📘

![CI](https://github.com/pagoha/devnotes/actions/workflows/ci.yml/badge.svg) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

DevNotes is a curated developer knowledge base for storing notes, cheat sheets, and reusable code snippets.  
It is designed as a lightweight, GitHub-friendly repository that demonstrates clean structure, beginner-friendly documentation, and CI integration.

------------------------------------------------------------------------

## 📑 Table of Contents

- [Features](#-features)
- [Project Structure](#-project-structure)
- [Example Notes](#-example-notes)
- [Scripts](#-scripts)
- [Continuous Integration](#-continuous-integration)
- [How to Contribute](#-how-to-contribute)
- [Why This Project Exists](#-why-this-project-exists)
- [License](#-license)

------------------------------------------------------------------------

## 🚀 Features

- 📚 Organized developer notes (Git, Git + VS Code, Docker, Kubernetes, GitHub)
- 🧩 Reusable code snippets
- 🛠 PowerShell helper scripts for consistent note creation
- ✅ Continuous Integration with GitHub Actions
- 📂 Clean, scalable project structure
- ✨ Beginner-friendly step-by-step guides for Git, VS Code, Docker, and Kubernetes

------------------------------------------------------------------------

## 📁 Project Structure

```
devnotes/
├── .github/          # GitHub Actions workflows
├── .vscode/          # VS Code workspace settings
├── notes/            # Developer notes (Markdown)
│   ├── docker.md
│   ├── kubernetes.md
│   ├── git-basics.md
│   ├── git-with-vscode.md
│   └── vscode.md
├── scripts/          # PowerShell helper scripts
├── snippets/         # Reusable code snippets
├── .gitignore
├── cspell.json
├── markdownlint.json
└── README.md
```

------------------------------------------------------------------------

## 🧠 Example Notes

- Git basics and workflows (`git-basics.md`)
- Git + VS Code workflow (`git-with-vscode.md`)
- VS Code setup, extensions, and workspace settings (`vscode.md`)
- Docker usage and Compose with `.env` examples (`docker.md`)
- Kubernetes beginner guide (`kubernetes.md`)

------------------------------------------------------------------------

## ⚙️ Scripts

PowerShell helper script for creating new notes:

### Create a new note

```powershell
.\scripts\new_note.ps1 <topic>
```

This command will create a new Markdown file in the `notes` directory with consistent naming and front-matter.

------------------------------------------------------------------------

## ✅ Continuous Integration

This repository uses **GitHub Actions** to automatically validate repository structure, Markdown linting, and spell checking on every push and pull request.

------------------------------------------------------------------------

## 📝 How to Contribute

1. **Fork the repository** and clone it locally:

```bash
git clone https://github.com/yourusername/devnotes.git
```

1. **Create a new branch** for your changes:

```bash
git checkout -b feature/your-feature-name
```

1. **Add or update notes** in the `notes/` folder.
2. **Run validation** to match CI checks:

```powershell
./scripts/validate.ps1
```

1. **Stage, commit, and push** your changes:

```bash
git add .
git commit -m "docs: add/update note <topic>"
git push origin feature/your-feature-name
```

1. **Open a pull request** on GitHub to merge your changes.

------------------------------------------------------------------------

## 📌 Why This Project Exists

This project serves as:

- A learning tool for Git & GitHub
- Beginner-friendly step-by-step guides for Docker and Kubernetes
- A VS Code workflow demonstration
- A portfolio-ready example repository

------------------------------------------------------------------------

## ⚙️ Requirements / Prerequisites

- Git installed locally: <https://git-scm.com/downloads>
- Visual Studio Code installed: <https://code.visualstudio.com/>
- Access to your own GitHub repository
- PowerShell (for running scripts)
- Node.js (if using CLI linting/spell-check)

------------------------------------------------------------------------

## 📄 License

MIT License
