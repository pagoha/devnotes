# Git Basics (Beginner → Practical Guide)

> DevNotes Repository
> This guide is designed for complete beginners and builds the foundation for version control using Git.

---

## What is Git?

Git is a **distributed version control system** that helps developers:

- track changes in files over time
- collaborate safely with others
- revert mistakes easily

Think of it like a **history book** for your code.

---

## Why Git Matters

- **Collaboration:** Multiple developers can work on the same project without overwriting each other’s work.
- **Safety:** Mistakes can be reverted without losing all progress.
- **Organization:** Keep track of features, bug fixes, and releases systematically

---

## Core Concepts

### Repository (Repo)

A **repository** is a project folder tracked by Git.

- Local repo → on your machine
- Remote repo → on GitHub or other platforms

### Commit

A **commit** is a snapshot of your project at a point in time.

- Think of it as a **save point** in a game.

### Branch

A **branch** is a separate line of development.

- Main branch = `main` (default)
- Feature branch = `feature/login` (example)

### Remote

A **remote** is a version of your repo hosted on a server like GitHub.

- Default remote name: `origin`

---

## Getting Started (Local Git Install)

> These instructions assume Git is installed locally on your computer. If you need Git, install it here: <https://git-scm.com/downloads>

1. **Open terminal/PowerShell** on your computer
2. **Navigate to your project folder:**

```bash
cd path/to/your/project
```

1. **Initialize a local repository:**

```bash
git init
```

1. **Check the status:**

```bash
git status
```

1. **Stage files for commit:**

```bash
git add .
```

1. **Commit changes:**

```bash
git commit -m "Initial commit"
```

1. **Add a remote GitHub repository:**

```bash
git remote add origin https://github.com/yourusername/yourrepo.git
```

1. **Push to remote repository:**

```bash
git push -u origin main
```

---

## Common Commands

| Command | Purpose |
| --------- | --------- |
| `git status` | Check the state of your repo, see changed files |
| `git add <file>` | Stage changes to prepare for a commit |
| `git commit -m "message"` | Save changes with a descriptive message |
| `git push` | Upload committed changes to a remote repo |
| `git pull` | Fetch and merge changes from the remote repo |
| `git log` | Show commit history |
| `git branch` | List or manage branches |
| `git checkout -b <branch>` | Create and switch to a new branch |
| `git merge <branch>` | Merge a branch into the current branch |

---

## Working with Branches

1. **Create a new branch:**

```bash
git checkout -b feature/your-feature
```

1. **Switch branches:**

```bash
git checkout main
```

1. **Merge a branch:**

```bash
git merge feature/your-feature
```

---

## Best Practices for Beginners

- Write **clear commit messages**
- Commit **small, logical chunks**
- Pull before pushing to avoid conflicts
- Use branches for **features or experiments**
- Never commit sensitive info (passwords, API keys)

---

## Next Steps

Once comfortable with Git basics:

- Integrate with **VS Code** using the Source Control panel
- Learn **GitHub workflows**, pull requests, and collaboration
- Combine with your Docker and Kubernetes projects to track changes systematically

---

This document is intended as a **living guide** — it can grow as you add more advanced Git workflows, tips, and VS Code integration advice.
