<!--
  DevNotes Repository
  File: prompt-engineering.md
  Location: devnotes/notes/prompt-engineering.md

  Purpose:
  A practical guide to crafting effective prompts for AI/LLM systems.
  This file is meant to take someone from asking random questions to AI,
  to asking strategic, high-quality prompts that get reliable results.
-->

# Prompt Engineering (Beginner → Confident Guide)

> This guide is written for people who want to **get better results from AI**.
> It explains core techniques, provides real examples you can copy and adapt, and builds from basics to advanced strategies.
> Read `notes/ai-cheatsheet.md` first if you're new to AI concepts.

---

## What Is Prompt Engineering?

**Prompt engineering** is the practice of crafting instructions for AI models to get consistent, high-quality responses.

### Why It Matters

| Poor Prompt | Better Prompt | Difference |
|-------------|---------------|-----------|
| "Explain Docker" | "Explain Docker to someone who has never used containers before. Include what Docker is, why it's useful, and one real example" | Clear context, specific audience, structured request |
| "Fix my code" | "This Python function crashes with 'AttributeError'. Here's the code: [paste]. What's wrong and how do I fix it?" | Specific error, code included, clear ask |
| "Write documentation" | "Write a 300-word README section for a Node.js API that: accepts JSON input, validates it, and returns results. Include setup instructions" | Length, context, requirements clear |

---

## Core Principles (Before Techniques)

### 1. **Be Specific**

Vague prompts → Vague results  
Specific prompts → Focused results

❌ Bad: "Tell me about Python"  
✅ Good: "Explain Python's `async/await` with a simple example"

### 2. **Provide Context**

AI needs to know:

- Who you are / what you're building
- What problem you're solving
- What audience you're targeting

❌ Bad: "Write a tutorial"  
✅ Good: "Write a beginner-friendly tutorial for a web developer learning Docker for the first time"

### 3. **Show Structure**

Tell AI what you want by:

- Using bullet points for lists
- Numbering steps
- Defining sections
- Using examples

### 4. **Iterate**

Your first prompt rarely produces the perfect output.

- Ask follow-ups
- Refine based on results
- Build on good responses

---

## Essential Techniques

### 1. Role-Based Prompting

Tell AI to **adopt a role** to change its tone and expertise.

**Example:**

```
You are an experienced DevOps engineer with 10 years of 
Kubernetes experience. Explain how to deploy a Node.js app 
to Kubernetes, assuming the reader is a junior developer.
```

**Why it works:**

- Sets expertise level
- Influences explanation style
- Gives context for how to explain

### 2. Few-Shot Prompting

Show AI **examples** of what you want.

**Example:**

```
I want you to rewrite code comments to be clearer.

Example 1:
Input: // check if user exists
Output: // verify that user account exists in database

Example 2:
Input: // do math
Output: // calculate total cost using price * quantity formula

Now rewrite this comment:
// get the data
```

**Why it works:**

- AI learns your style from examples
- More consistent results
- Saves you from detailed explanations

### 3. Chain-of-Thought Prompting

Ask AI to **think step-by-step** before answering.

**Example:**

```
Solve this problem step by step:

A Docker container is running on port 8080 inside the container.
The host machine exposes port 3000. How do you access the app 
from your browser, and why?

Think through:
1. What happens on the host machine?
2. What happens in the container?
3. How does the mapping work?
4. What's the final URL?
```

**Why it works:**

- Reveals AI's reasoning
- Catches errors earlier
- More thorough answers

### 4. Structured Output Prompting

Request output in a **specific format**.

**Example:**

```
Provide 3 tips for Docker optimization in this format:

## Tip 1: [Title]
**Why:** [explanation]
**Example:** [code or scenario]

## Tip 2: [Title]
**Why:** [explanation]
**Example:** [code or scenario]

## Tip 3: [Title]
**Why:** [explanation]
**Example:** [code or scenario]
```

**Why it works:**

- Predictable output format
- Easy to parse and use
- Enforces consistency

### 5. Constraint-Based Prompting

Give AI **clear limits** (length, complexity, audience).

**Example:**

```
Write a quick explanation of Kubernetes for:
- Audience: Junior web developers (not DevOps)
- Length: 200 words max
- Tone: Friendly and encouraging
- Include: 1 analogy, 3 key concepts, next steps
```

**Why it works:**

- Prevents rambling
- Ensures appropriate depth
- Matches your use case

---

## Real-World Prompting Patterns

### Pattern 1: Code Review

```
Review this code for:
1. Performance issues
2. Security vulnerabilities
3. Readability improvements
4. Best practices violations

Code:
[paste code]

Focus on the most important issues first.
```

### Pattern 2: Learning Explanation

```
Explain [topic] to a [skill level] [profession].

Topic: Kubernetes
Skill level: beginner
Profession: frontend developer

Requirements:
- Use analogies related to web development
- Avoid DevOps jargon
- Include 1 real-world use case
- Keep it under 300 words
```

### Pattern 3: Content Creation

```
Create a [format] about [topic] for [audience].

Format: social media post
Topic: advantages of Docker
Audience: startup founders

Requirements:
- Tone: professional but approachable
- Include 1 surprising benefit
- Add a call-to-action
- Keep it under 280 characters
```

### Pattern 4: Debugging

```
I'm getting this error: [error message]

Context:
- Language: Python
- Framework: FastAPI
- What I was trying to do: [description]

Here's my code:
[paste code]

What's causing this and how do I fix it?
```

### Pattern 5: Refactoring Request

```
Refactor this code to be:
1. More readable
2. More maintainable
3. Follow [language] best practices

Original:
[paste code]

Explain what you changed and why.
```

---

## Best Practices & Tips

### ✅ DO

| Practice | Why |
|----------|-----|
| **Be clear about intent** | "I want to learn" vs "I want to use this in production" changes the response |
| **Include relevant code/context** | Full picture → better answers |
| **Ask for explanations** | "Why?" helps you learn, not just copy |
| **Specify output format** | Markdown, JSON, bullet points — be explicit |
| **Iterate and refine** | First response isn't always perfect |
| **Set constraints** | Length, complexity, audience, tone |
| **Use examples** | Show what good looks like |
| **Give temperature hints** | "Be creative" vs "Be exact" |

### ❌ DON'T

| Mistake | Why It Matters |
|--------|----------------|
| **Assume AI knows your context** | AI only sees what you write |
| **Ask vague questions** | "What should I do?" is too broad |
| **Paste entire projects** | Give minimal reproducible examples |
| **Trust everything** | AI can hallucinate (make things up) |
| **Use complex jargon** | Be clear over clever |
| **Ask for contradictions** | "Be creative but exact" is conflicting |
| **Forget to proofread** | AI output still needs human review |

---

## Common Pitfalls & Solutions

### Pitfall 1: AI Hallucinates (Makes Stuff Up)

**What happens:**

```
Q: "What's the official Docker command to clear all cache?"
A: "docker cache clear" (This command doesn't exist!)
```

**Solution:**

```
Q: "What's the official Docker command to clear all cache? 
   Provide the exact command from Docker documentation."

Follow up: "How do I verify this command exists?"
```

### Pitfall 2: Output Is Too Long

**What happens:**

- AI generates 2000 words when you need 200

**Solution:**

```
"Explain Docker in exactly 150 words or less."
(Be specific with number)
```

### Pitfall 3: AI Oversimplifies

**What happens:**

- Explanation misses important nuances

**Solution:**

```
"Explain Docker storage drivers. Include:
- What problem they solve
- 2-3 common drivers and when to use each
- Performance trade-offs"
```

### Pitfall 4: Response Isn't What You Wanted

**What happens:**

- Tone is off, format is wrong, or depth is wrong

**Solution:**

```
"That's helpful, but I need it more [technical/beginner-friendly/concise].
Here's what I'm looking for: [example of good output]"
```

---

## Prompt Template Library

### Template 1: Code Explanation

```
Explain what this [language] code does:

[paste code]

Assume the reader:
- Knows [language] basics
- Is unfamiliar with [library/concept]
- Learns best with [visual/textual/example-based] explanations

Include:
- What the code does
- Why you'd use it
- Step-by-step walkthrough
```

### Template 2: Architecture Review

```
Review this [architecture/design] for:
1. Scalability
2. Maintainability
3. Security
4. Performance

Architecture:
[description or diagram]

Context:
- Scale: [number of users/requests]
- Team size: [X engineers]
- Constraints: [budget, latency, etc]

Most important concern to optimize for: [priority]
```

### Template 3: Documentation Generator

```
Generate documentation for this [feature/module]:

Name: [name]
Purpose: [one-line description]
Inputs: [what it accepts]
Outputs: [what it returns]
Example usage: [code example]

Include sections:
- Overview
- Quick Start
- Common Use Cases
- Troubleshooting
- Related Resources
```

### Template 4: Interview Prep

```
Prepare me for a [position] interview at a [company].

Topics: [list or ask for suggestions]
Experience level: [junior/mid/senior]
Format: [ask questions, provide answers, explain concepts]

Please:
1. Ask me [N] questions
2. I'll answer
3. You provide feedback and better answers
```

---

## Iteration Example (Real Workflow)

**Round 1: Initial Request**

```
Write a Docker tutorial for beginners.
```

→ Gets generic, too long

**Round 2: Refine**

```
Write a Docker tutorial for someone with web dev experience 
but no DevOps background. 

Length: 500 words max
Include: 1 analogy, 1 real example, 3 key takeaways
```

→ Better but still missing hands-on steps

**Round 3: Get Specific**

```
Write a Docker tutorial (500 words) that:

1. Explains what Docker solves with a web dev analogy
2. Shows the one command to run a pre-built container
3. Shows how to create a simple Dockerfile
4. Walks through running and stopping a container

End with: "Next steps" section

Assume reader: JavaScript developer, no Docker experience
```

→ Perfect! Specific, actionable, right length

---

## Testing Your Prompts

### How to Know If Your Prompt Is Good

- ✅ Output matches your intent exactly
- ✅ No need for major revisions
- ✅ Could give to someone else and get same result
- ✅ Takes you closer to your goal
- ✅ No hallucinations or false information

### Red Flags (Revise Your Prompt)

- ❌ Output is too vague or generic
- ❌ Format doesn't match what you wanted
- ❌ Depth is wrong (too simple or too complex)
- ❌ AI made up information
- ❌ You need extensive follow-ups

---

## Next Steps

- **Build:** Use these prompts in real projects
- **Collect:** Save prompts that work well for you
- **Share:** Contribute your best prompts to your team
- **Measure:** Track which prompts give the best ROI
- **Refine:** Iterate and improve over time

---

## Resources

- **OpenAI Prompt Guide:** <https://platform.openai.com/docs/guides/prompt-engineering>
- **Anthropic Prompt Tips:** <https://docs.anthropic.com/en/docs/build-a-chatbot>
- **Prompt Engineering Guide:** <https://www.promptingguide.ai/>
- **LangChain Prompt Templates:** <https://python.langchain.com/docs/modules/model_io/prompts/>
