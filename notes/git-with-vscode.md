# Git + VS Code Workflow (Beginner → Practical Guide)

> DevNotes Repository
> This guide builds on `notes/git-basics.md` and shows how to integrate Git with Visual Studio Code for version control, using your own GitHub repository as an example.

---

## Prerequisites

Before starting, ensure you have:

- **Git installed locally**: [https://git-scm.com/downloads](https://git-scm.com/downloads)
- **Visual Studio Code installed**: [https://code.visualstudio.com/](https://code.visualstudio.com/)
- A **GitHub account**: [https://github.com/](https://github.com/)
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
git switch -c feature/kubernetes-guide
```

1. Switch branches:

```bash
git switch main
```

1. Merge changes:

```bash
git merge feature/kubernetes-guide
```

> VS Code also shows conflicts visually with color-coded indicators.

---

## Modern Git Commands (`switch` and `restore`)

Older Git tutorials commonly use `git checkout` for multiple tasks.

Modern Git versions separate commands more clearly:

| Command       | Purpose                      |
| ------------- | ---------------------------- |
| `git switch`  | Switching branches           |
| `git restore` | Restoring local file changes |

### Examples

Switch branches:

```bash
git switch main
```

Create and switch to a new branch:

```bash
git switch -c feature/my-feature
```

Restore local file changes:

```bash
git restore notes/docker.md
```

Unstage a file:

```bash
git restore --staged notes/docker.md
```

> `git checkout` still works and is commonly seen in older tutorials, but `switch` and `restore` are clearer for beginners and modern workflows.

---

## Git Diff & History

- **Diff view**: click a changed file to see line-by-line differences
- **GitLens extension** (optional, by Eric Amodio): [https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- View commit history in terminal:

```bash
git log --oneline --graph --all
```

---

## Stashing Changes

If you need to switch branches but have uncommitted changes:

```bash
git stash
git switch main
git stash pop
```

In VS Code, stash options are also available via the Source Control menu.

---

## Pulling & Syncing

Always **pull changes before pushing** to avoid conflicts:

```bash
git pull origin main
```

VS Code also shows a **Sync Changes button** to pull + push in one click.

---

## Cleaning Up After a Pull Request Merge

After your pull request (PR) is merged into `main` on GitHub:

1. Switch back to `main` locally:

```bash
git switch main
```

1. Pull the latest merged changes:

```bash
git pull origin main
```

1. Delete your local feature branch:

```bash
git branch -d feature/my-feature
```

### View Local Branches

```bash
git branch
```

### View Local + Remote Branches

```bash
git branch -a
```

> The `*` symbol indicates your currently active branch.

---

## Integrating VS Code Settings and Extensions (Optional)

Refer to `notes/vscode.md` for recommended extensions and workspace settings, including:

- Markdown All in One
- markdownlint
- Code Spell Checker (cSpell)
- GitLens
- PowerShell
- YAML
- Prettier

This helps maintain consistency with DevNotes automation and CI workflows.

---

## Best Practices

- Commit frequently with descriptive messages
- Use feature branches instead of working directly on `main`
- Pull before pushing
- Resolve conflicts visually in VS Code
- Leverage `.gitignore` to avoid committing unnecessary files
- Keep branches focused on a single feature or change
- Delete merged feature branches to keep your repository organized

---

## Example: Typical Feature Branch Workflow

1. Start from the latest `main` branch:

```bash
git switch main
git pull origin main
```

1. Create a new feature branch:

```bash
git switch -c feature/my-update
```

1. Make changes and commit them:

```bash
git add .
git commit -m "docs: update Git workflow guide"
```

1. Push branch to GitHub:

```bash
git push -u origin feature/my-update
```

1. Open a Pull Request (PR) on GitHub

2. After the PR is merged:

```bash
git switch main
git pull origin main
git branch -d feature/my-update
```

---

## Recommended Learning Order

1. Git Basics (`git-basics.md`)
2. Git + VS Code Workflow (`git-with-vscode.md`)
3. DevNotes repository practical examples
4. Advanced Git workflows (pull requests, rebasing, branching strategies)

---

## Links & Resources

- [Git Documentation](https://git-scm.com/doc)
- [VS Code Git Guide](https://code.visualstudio.com/docs/editor/versioncontrol)
- [GitHub Docs](https://docs.github.com/en)
- [GitLens VS Code Extension](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
