# AI Verification Prompt Snippets

Use these snippets when you want an AI answer checked before trusting it,
committing it, publishing it, or using it to make a decision.

## General Accuracy Check

```text
Review your previous answer for accuracy.

Please:
- Separate confirmed facts from assumptions.
- Identify anything that may be outdated or uncertain.
- Point out missing context that would change the answer.
- Give a corrected version if you find a problem.
```

## Source-Aware Check

```text
Double-check this answer against reliable sources.

For each important claim:
- Say whether it is supported, unsupported, or uncertain.
- Prefer official documentation or primary sources.
- Include links for claims that depend on current information.
- Do not invent citations.
```

## Code Review Check

```text
Review this code as if it were going into a pull request.

Focus on:
1. Bugs or incorrect behavior
2. Security issues
3. Edge cases
4. Missing tests
5. Simpler or safer alternatives

Return findings first, ordered by severity.
```

## Command Safety Check

```text
Before I run these commands, review them for safety.

Commands:
[paste commands]

Tell me:
- What each command does.
- Whether any command is destructive.
- Whether it changes files, installs packages, or affects Git history.
- A safer alternative if one exists.
```

## Documentation Freshness Check

```text
Review this documentation for outdated claims.

Look for:
- Version-specific model, package, or product names
- Deprecated commands or configuration fields
- Links that may have moved
- Pricing or availability claims
- Steps that depend on a specific operating system

Suggest durable wording where possible.
```

## Hallucination Check

```text
Challenge this answer.

Find:
- Claims that sound plausible but may be false
- Missing caveats
- Overconfident language
- Places where the answer should say "I don't know"

Then rewrite the answer with better uncertainty handling.
```

## Commit-Readiness Check

```text
Review these changes before I commit.

Context:
- Repository purpose: [describe repo]
- Changed files: [paste file list]
- Validation command: [paste command]

Check for:
- Files that should not be committed
- Missing tests or validation
- Broken docs or links
- Inconsistent naming
- A clear commit message
```
