<!--
  DevNotes Repository
  File: vscode-copilot-chat.md
  Location: devnotes/notes/vscode-copilot-chat.md

  Purpose:
  A practical guide to using GitHub Copilot Chat in VS Code.
  This file teaches developers how to set up and use chat effectively
  for coding, debugging, and learning workflows.
-->

# Copilot Chat in VS Code (Setup → Productive Workflows)

> This guide is written for developers who want to **use AI chat while coding**.
> It covers setup, key features, workflows, and pro tips to get the most out of Copilot Chat.

---

## What Is Copilot Chat?

Copilot Chat is an **AI assistant built into VS Code** that helps you:

- Explain code you're reading
- Generate new code based on requirements
- Debug errors and understand why they happen
- Answer questions while you code
- Refactor and improve existing code

Think of it as a **knowledgeable teammate in your editor** who can answer questions instantly without leaving VS Code.

---

## Installation & Setup

### Prerequisites

- **VS Code** installed (<https://code.visualstudio.com/>)
- **GitHub account** (free or paid)
- **GitHub Copilot access** through an individual, business, enterprise, or
  education plan

### Step 1: Install the Extension

1. Open VS Code
2. Go to **Extensions** (`Ctrl+Shift+X`)
3. Search for **"GitHub Copilot"**
4. Click **Install**

Copilot Chat is part of the GitHub Copilot experience in VS Code.

### Step 2: Sign In

1. After installing, click the **Copilot icon** in the activity bar (left sidebar)
2. Click **"Sign in with GitHub"**
3. Authorize the extension in your browser
4. Return to VS Code — you're ready to chat!

### Step 3: Verify It Works

1. Open a code file (any language)
2. Open the Chat panel: **`Ctrl+Shift+I`** or click the **Chat icon** in the sidebar
3. Type: `"explain this file"` and press **Enter**
4. Chat should respond within seconds

> Shortcut names can change by VS Code version, operating system, and keyboard
> layout. If a shortcut does not work, open the Command Palette and search for
> the Copilot command by name.

---

## Chat Interface Overview

### Sidebar Chat

**Access:** `Ctrl+Shift+I` or click the **Chat icon** in the activity bar

- Main chat window
- Persistent conversation thread
- Good for long discussions
- Can reference your entire codebase

### Inline Chat

**Access:** `Ctrl+I` (with code selected)

- Quick chat within your editor
- Appears above your code
- Perfect for quick questions or edits
- Results can be applied directly to code

### Quick Chat

**Access:** `Ctrl+Alt+I`

- Minimal popup chat
- Even faster for quick questions
- Same functionality, different UI

---

## Common Workflows

### Workflow 1: Explain Code You're Reading

**Scenario:** You're reviewing someone else's code and don't understand it.

**Steps:**

1. Select the code block
2. Press `Ctrl+I` (Inline Chat)
3. Type: `"Explain what this code does"`
4. Read the explanation
5. Ask follow-ups if needed: `"Why use recursion instead of a loop?"`

**Result:** Understand code faster without searching Google.

---

### Workflow 2: Generate Code from Description

**Scenario:** You need to write a function but want help.

**Steps:**

1. Open Chat: `Ctrl+Shift+I`
2. Type: `"Write a Python function that validates email addresses and returns True/False"`
3. Copilot generates code
4. Copy and paste into your file
5. Adjust as needed

**Result:** Faster coding with less boilerplate.

---

### Workflow 3: Debug an Error

**Scenario:** Your code throws an error and you don't know why.

**Steps:**

1. Copy the error message
2. Open Chat: `Ctrl+Shift+I`
3. Type:

   ```
   I'm getting this error:
   [paste error]
   
   Here's my code:
   [paste relevant code]
   
   What's wrong and how do I fix it?
   ```

4. Copilot explains the issue and suggests fixes
5. Apply the fix to your code

**Result:** Faster debugging, learn why the error happened.

---

### Workflow 4: Refactor Code

**Scenario:** You want to clean up messy code.

**Steps:**

1. Select the code
2. Press `Ctrl+I`
3. Type: `"Refactor this to be more readable and follow Python best practices"`
4. Review the suggestion
5. Click **Accept** or edit further

**Result:** Cleaner, more maintainable code.

---

### Workflow 5: Write Tests

**Scenario:** You have code but no tests.

**Steps:**

1. Select the function/class
2. Press `Ctrl+I`
3. Type: `"Write unit tests for this function using pytest"`
4. Copilot generates test cases
5. Copy them to your test file

**Result:** Better test coverage, faster TDD workflow.

---

## Slash Commands

Slash commands are **shortcuts** that tell Copilot what to do.

| Command | What It Does | Example |
|---------|-------------|---------|
| `/explain` | Explain selected code | `/explain` (with code selected) |
| `/generate` | Generate code from description | `/generate a function to sort an array` |
| `/fix` | Fix selected code | `/fix` (with error or bad code) |
| `/doc` | Generate documentation | `/doc` (with function selected) |
| `/test` | Generate tests | `/test` (with code selected) |
| `/clear` | Clear chat history | `/clear` |

**Example Usage:**

```
Type: /fix
Copilot will analyze selected code and suggest fixes
```

---

## Pro Tips for Better Prompts

### Tip 1: Include Context

Instead of:

```
Write a function
```

Do:

```
Write a Python function that takes a list of numbers
and returns only the even numbers, sorted in ascending order.
```

### Tip 2: Paste Your Code

When debugging or asking for help:

```
My Node.js code:
[paste code]

This is what happens:
[describe behavior or error]

How do I fix it?
```

### Tip 3: Ask for Explanations

Don't just accept code — understand it:

```
Here's your suggested fix. Why is this approach better than my original?
```

### Tip 4: Reference Files

Tell Copilot to look at specific files:

```
@src/utils/helpers.ts: Can you review this for security issues?
```

### Tip 5: Specify Output Format

```
Generate TypeScript code (not JavaScript)
Write it as a named export
Include JSDoc comments
```

---

## Real-World Examples

### Example 1: Debug a TypeError

```
Error: Cannot read property 'map' of undefined

Code:
const result = data.items.map(item => item.name);

Why is this happening and how do I fix it?
```

**Copilot explains:** `data` or `data.items` is undefined. Suggests null checks or optional chaining (`data?.items?.map(...)`).

### Example 2: Generate a Form Validator

```
/generate

Create a JavaScript function that validates a form with:
- email field (must be valid email)
- password field (min 8 characters, 1 uppercase, 1 number)
- confirm password (must match password)

Return an object with field names and error messages
```

**Copilot generates:** Working validator with regex patterns and error handling.

### Example 3: Understand Docker Concepts

```
I'm reading a Dockerfile but don't understand some lines.
Here's the file:

[paste Dockerfile]

What does each FROM, RUN, and EXPOSE line do?
```

**Copilot explains:** Each instruction's purpose and why it's used.

---

## Keyboard Shortcuts (Cheat Sheet)

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+I` | Open Chat (common Windows/Linux binding) |
| `Ctrl+I` | Inline Chat (common Windows/Linux binding) |
| `Ctrl+Alt+I` | Quick Chat (if enabled in your keymap) |
| `Tab` | Accept suggestion |
| `Escape` | Close chat |
| `Enter` | Send message |
| `Shift+Enter` | New line in message |

Use **File > Preferences > Keyboard Shortcuts** to confirm or customize these
bindings on your machine.

---

## Common Pitfalls & Solutions

### Pitfall 1: Chat Says "Code Not Found"

**Problem:** Copilot can't understand your code.

**Solution:** Paste the complete function, not just fragments. Include imports/dependencies.

### Pitfall 2: Suggestion Doesn't Compile

**Problem:** Generated code has syntax errors.

**Solution:** Ask Copilot to fix it: `"This code doesn't compile. Here's the error: [error]. Fix it."`

### Pitfall 3: Vague Responses

**Problem:** Chat gives generic advice instead of specific solutions.

**Solution:** Be more specific. Include constraints, language, framework, and context.

### Pitfall 4: Chat Forgets Context

**Problem:** Chat doesn't remember earlier questions.

**Solution:** Repeat key context or start a new chat if needed.

---

## When to Use Each Chat Type

| Situation | Use |
|-----------|-----|
| Quick question while editing | Inline Chat (`Ctrl+I`) |
| Long discussion or back-and-forth | Sidebar Chat (`Ctrl+Shift+I`) |
| Need it super fast | Quick Chat (`Ctrl+Alt+I`) |
| Asking about a specific file | Chat with `@filename` reference |
| Explaining selected code | Inline Chat (`Ctrl+I`) + `/explain` |

---

## Next Steps

- **Start using it:** Try Inline Chat on your next code review
- **Experiment:** Use `/doc` and `/test` commands on existing code
- **Master prompts:** Use your prompt engineering knowledge (see `notes/prompt-engineering.md`)
- **Share with team:** Show teammates how it speeds up development
- **Explore advanced features:** Check GitHub Copilot docs for VS Code extensions integration

---

## Resources

- **GitHub Copilot Docs:** <https://docs.github.com/en/copilot>
- **VS Code Copilot Chat Guide:** <https://code.visualstudio.com/docs/copilot/copilot-chat>
- **Copilot Tips & Tricks:** <https://github.com/features/copilot>
