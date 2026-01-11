# Git + VS Code Workflow (Beginner → Practical Guide)

> DevNotes Repository
> This guide builds on `notes/git-basics.md` and shows how to integrate Git with Visual Studio Code for version control, using your own GitHub repository as an example.

---

## Prerequisites

Before starting, ensure you have:

- **Git installed locally**: <https://git-scm.com/downloads>
- **Visual Studio Code installed**: <https://code.visualstudio.com/>
- A **GitHub account**: <https://github.com/>
- **Access to your own GitHub repository**

> If you’re new to Git, read `notes/git-basics.md` first.

---

## Setting Up VS Code for Git

1. **Open VS Code** and ensure the **Git extension** is installed (usually built-in).
2. Confirm Git is recognized by VS Code:
   - Open terminal in VS Code (`Ctrl + ``)
   - Run:

```bash
git --version
```

You should see the installed Git version.

1. Configure Git with your user information:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

---

## Opening Your Project in VS Code

1. Clone your repository (remote example):

```bash
git clone https://github.com/yourusername/your-repo.git
cd your-repo
code .
```

1. Or open an **existing local repository**:
   - In VS Code: `File → Open Folder` → select your project folder
   - VS Code automatically detects the Git repository

---

## Source Control Panel Overview

- Click the **Source Control icon** (or `Ctrl + Shift + G`)
- You’ll see:
  - **Changes** → modified files not staged
  - **Staged Changes** → files ready for commit
  - **Commit message box** → add a descriptive message

### Example Workflow

1. Modify a file (e.g., `notes/docker.md`)
2. Stage changes: click the `+` next to the file in Source Control, or:

```bash
git add notes/docker.md
```

1. Commit changes:

```bash
git commit -m "docs: update Docker guide with .env example"
```

1. Push to remote:

```bash
git push origin main
```

---

## Branching in VS Code

1. Create a new branch:
   - Click the branch indicator in the bottom-left corner → **Create new branch**
   - Name it `feature/kubernetes-guide`

```bash
git checkout -b feature/kubernetes-guide
```

1. Switch branches:

```bash
git checkout main
```

1. Merge changes:

```bash
git merge feature/kubernetes-guide
```

> VS Code also shows conflicts visually with color-coded indicators.

---

## Git Diff & History

- **Diff view**: click a changed file to see line-by-line differences
- **GitLens extension** (optional, by Eric Amodio): <https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens>
- View commit history in terminal:

```bash
git log --oneline --graph --all
```

---

## Stashing Changes

- If you need to switch branches but have uncommitted changes:

```bash
git stash
git checkout main
git stash pop
```

- In VS Code, stash options are also available via the Source Control menu

---

## Pulling & Syncing

- Always **pull changes before pushing** to avoid conflicts:

```bash
git pull origin main
```

- VS Code shows a **Sync Changes button** to pull + push in one click

---

## Integrating VS Code Settings and Extensions (Optional)

Refer to `notes/vscode.md` for recommended extensions and workspace settings, including:

- Markdown All in One
- markdownlint
- Code Spell Checker (cSpell)
- GitLens
- PowerShell, YAML, Prettier

This ensures consistency with DevNotes’ automation and CI workflows.

---

## Best Practices

- Commit frequently with descriptive messages
- Use branches for features or experiments
- Pull before pushing
- Resolve conflicts visually in VS Code
- Leverage `.gitignore` to avoid committing unnecessary files

---

## Example: Updating Your Repository

1. Add a new file `notes/git-with-vscode.md`
2. Stage it in VS Code or terminal:

```bash
git add notes/git-with-vscode.md
```

1. Commit:

```bash
git commit -m "docs: add Git + VS Code workflow guide"
```

1. Push:

```bash
git push origin main
```

> Readers now have a complete workflow from creating a branch, editing files, committing, and pushing changes, all using VS Code with Git integrated.

---

## Recommended Learning Order

1. Git Basics (`git-basics.md`)
2. Git + VS Code workflow (`git-with-vscode.md`)
3. DevNotes repository practical examples
4. Advanced Git workflows (pull requests, rebasing, branching strategies)

---

## Links & Resources

- [Git Documentation](https://git-scm.com/doc)
- [VS Code Git Guide](https://code.visualstudio.com/docs/editor/versioncontrol)
- [GitHub Docs](https://docs.github.com/en)
- [GitLens VS Code Extension](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
