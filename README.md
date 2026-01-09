# DevNotes 📘

DevNotes is a curated developer knowledge base for storing notes, cheat
sheets, and reusable code snippets.\
It is designed as a lightweight, GitHub-friendly repository that
demonstrates clean structure, documentation, and CI integration.

------------------------------------------------------------------------

## 🚀 Features

-   📚 Organized developer notes (Git, VS Code, GitHub)
-   🧩 Reusable code snippets
-   🛠 PowerShell helper scripts
-   ✅ Continuous Integration with GitHub Actions
-   📂 Clean, scalable project structure

------------------------------------------------------------------------

## 📁 Project Structure

    devnotes/
    ├── README.md
    ├── notes/            # Developer notes (Markdown)
    ├── snippets/         # Reusable code snippets
    ├── scripts/          # Helper scripts (PowerShell)
    ├── .github/          # CI workflows
    └── .gitignore

------------------------------------------------------------------------

## 🧠 Example Notes

-   Git basics and workflows
-   VS Code productivity tips
-   GitHub best practices

------------------------------------------------------------------------

## ⚙️ Scripts

PowerShell helper script for creating new notes.

### Create a new note

``` powershell
.\scripts\new_note.ps1 docker
```

This command will create a new Markdown file in the `notes` directory.

------------------------------------------------------------------------

## ✅ Continuous Integration

This repository uses **GitHub Actions** to automatically validate
repository structure and required files on every push and pull request.

------------------------------------------------------------------------

## 📌 Why This Project Exists

This project serves as:

-   A learning tool for Git & GitHub
-   A VS Code workflow demonstration
-   A portfolio-ready example repository

------------------------------------------------------------------------

## 📄 License

MIT License
