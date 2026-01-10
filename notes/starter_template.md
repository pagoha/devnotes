<!-- 
  DevNotes Repository
  This template is part of the DevNotes repo.
  Place all notes in the `notes/` folder.
  Use this file as a starter template for new devnotes files.
-->

# DevNotes Starter Template

> This is a starter template for your devnotes.  
> Use it to create new notes in the `notes/` folder.  
> It includes clean spelling, intentional lint triggers for CLI testing, and structured sections.

---

## Summary

Write a brief overview of the topic here.

- Keep key points clear.
- Long lines here are allowed to intentionally trigger MD013 for testing purposes in CLI.
- Include the purpose, context, or any background info relevant to the note.

---

## Key Commands / Code Snippets

```bash
# Example command block
git status
npm run lint:all
docker ps -a
```

```yaml
# YAML example for CI/CD configuration
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
```

- Use fenced code blocks for commands, scripts, or code examples.
- Keep code formatting consistent.

---

## Tips & Tricks

- Include workflow tips, shortcuts, or best practices.
- Nested lists to test MD007 (indentation):

- Item 1
  - Nested item 1
  - Nested item 2
- Item 2

---

## References / Links

- [VS Code](https://code.visualstudio.com/)  
- [GitHub Docs](https://docs.github.com/)  
- [Docker Docs](https://docs.docker.com/)  

---

## Markdownlint Testing

- **Long line warning (MD013)**: This line is intentionally very very very very very very very very very very very very long to trigger MD013 for CLI testing.  
- **Multiple blank lines (MD012)**:  

- **Header style (MD003)**: Using ATX headers.  
- **Ordered lists (MD029)**: Numbered lists are indented properly.

---

## Notes

- Optional section for side notes, reminders, or ideas.  
- Add new sections as needed for future devnotes topics.

---

## How to Use This Template

1. **Copy this file** and rename it for your new note, e.g.:  

   ```text
   notes/docker.md
   notes/git.md
   notes/vscode.md
   ```

2. **Edit your new file** — fill in the summary, code snippets, tips, and references.  
3. **Check lint and spell** using CLI:  

   ```bash
   npm run lint:all
   ```

4. **Commit and push** your new note when ready.  
5. **Optional:** Keep this starter-template.md untouched for future notes.
