<!--
  DevNotes Repository
  File: ai-cheatsheet.md
  Location: devnotes/notes/ai-cheatsheet.md

  Purpose:
  A quick-reference guide for AI and LLM concepts, tools, and terminology.
  This file is meant to take someone with ZERO AI experience
  and give them a foundation to understand key ideas and common tools.
-->

# AI & LLM Cheatsheet (Beginner → Confident Reference)

> This guide is written for people who have **never worked with AI before**.
> It explains core concepts in plain English, covers popular tools and APIs, and includes a glossary of common terms.
> Use this as a **quick lookup reference** or a jumping-off point for deeper learning.

---

## What Is AI/LLM? (In Simple Terms)

### Artificial Intelligence (AI)

AI is software that can **learn from data** and make decisions or predictions without being explicitly programmed for every scenario.

Think of it like:

- Traditional software: "If this happens, do exactly that" (rigid)
- AI: "Learn from examples, then make decisions when you see something similar" (flexible)

### Large Language Models (LLMs)

An **LLM** is a type of AI trained on massive amounts of text data.

It's learned patterns about:

- How words relate to each other
- How to answer questions
- How to explain concepts
- How to write code

**Common LLMs you can use:**

- GPT models from OpenAI
- Claude models from Anthropic
- Gemini models from Google
- Llama and other open-weight models from Meta and the open-source community

Model names change quickly. Treat examples in this note as a snapshot and
check each provider's official docs before choosing a production model.

---

## Why Developers Use AI/LLMs

| Use Case | Example |
|----------|---------|
| Code generation | "Write a function to validate email addresses" |
| Debugging | "Why does this code throw an error?" |
| Documentation | "Write README.md for this project" |
| Learning | "Explain how async/await works" |
| Summarization | "Summarize this long document" |
| Brainstorming | "Give me 5 ideas for a landing page" |
| Content generation | "Write 3 social media posts about my product" |

---

## Core Concepts (You Need to Know These)

### Token

A **token** is a chunk of text that an LLM processes.

- Roughly 4 characters = 1 token
- "Hello world" ≈ 2-3 tokens
- Longer text = more tokens
- **More tokens = Higher cost and slower responses**

### Prompt

A **prompt** is the instruction or question you give to an AI model.

Example prompts:

- "Write a Python function to sort a list"
- "Explain Docker to a beginner"
- "Fix this bug: [code]"

### Model

A **model** is the trained AI system.

Different models have different strengths:

- general-purpose models for everyday writing, coding, and Q&A
- reasoning models for harder planning, math, and multi-step problems
- multimodal models for text, images, audio, or video
- embedding models for search and similarity
- open-weight models for local, private, or self-hosted workflows

### Temperature (Creativity Setting)

Temperature controls how creative/random the AI's responses are.

| Temperature | Behavior | Use Case |
|------------|----------|----------|
| 0.0 (Low) | Predictable, consistent | Facts, code, precise output |
| 0.5–0.7 (Medium) | Balanced | Most tasks |
| 1.0+ (High) | Creative, random | Brainstorming, creative writing |

### Context Window

The **context window** is how much text the model can "see" at once.

- Different models support different context sizes
- Larger window = can process longer documents
- Bigger is not always better; larger prompts can cost more and be slower

### Embedding

An **embedding** is a way to represent text as numbers.

- Used for finding similar content
- Powers search features in AI apps
- Enables RAG (see below)

### RAG (Retrieval-Augmented Generation)

**RAG** combines search + AI:

1. Search a database for relevant documents
2. Give those documents to the AI
3. AI answers based on the documents

*Use case:* Chatbots that answer questions about your specific company docs.

---

## Popular LLM APIs & Services

### OpenAI

**Models:** GPT family, reasoning models, embeddings, image/audio models  
**Best for:** General-purpose tasks, coding, multimodal apps, agents  
**Cost:** Pay-per-token, varies by model and feature  
**Access:** <https://platform.openai.com>

### Anthropic Claude

**Models:** Claude family  
**Best for:** Long-form content, analysis, reasoning  
**Cost:** Pay-per-token, varies by model  
**Access:** <https://claude.ai> or API

### Google Gemini

**Models:** Gemini family  
**Best for:** Multimodal (text + images + video)  
**Cost:** Free tier and paid API options may vary  
**Access:** <https://makersuite.google.com>

### Open-Source Models (Run Locally)

**Examples:** Llama, Mistral, Qwen, other open-weight models  
**Best for:** Privacy, no API costs, customization  
**Requires:** Local hardware or self-hosted server  
**Tool:** Ollama (easy local setup)

---

## Common Tools & Frameworks

| Tool | Purpose |
|------|---------|
| **LangChain** | Build apps with LLMs, chain multiple steps together |
| **LlamaIndex** | Index and query your own documents with AI |
| **OpenAI Playground** | Test prompts without coding |
| **Hugging Face** | Repository of open-source models |
| **Ollama** | Run open-source LLMs locally (Mac/Linux/Windows) |
| **Vercel AI SDK** | JavaScript library for building AI apps |
| **LiteLLM** | Use multiple LLM providers with one interface |

---

## Quick API Example (Python)

### OpenAI Responses API

```python
from openai import OpenAI

client = OpenAI(api_key="your-api-key")

response = client.responses.create(
    model="gpt-5.5",
    input="Explain Docker to a beginner"
)

print(response.output_text)
```

> Check the OpenAI model docs before running this example. Model IDs change,
> and your account may not have access to every model.

### Anthropic Claude

```python
from anthropic import Anthropic

client = Anthropic()

message = client.messages.create(
    model="claude-3-sonnet-20240229",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Explain Kubernetes to a beginner"}
    ]
)

print(message.content[0].text)
```

---

## Choosing a Model (Quick Reference)

| Need | Look For |
|------|----------|
| Everyday writing or coding | General-purpose model |
| Hard planning or multi-step logic | Reasoning model |
| Image, audio, or video input | Multimodal model |
| Search over your own docs | Embedding model + RAG |
| Private local experimentation | Open-weight model |
| Lowest cost | Smaller or faster model tier |

Avoid choosing only by brand name. Match the model to your task, budget,
latency needs, privacy requirements, and available tools.

---

## Use Case Examples

### Code Generation

**Prompt:**

```
Write a Python function that takes a list of numbers 
and returns only the even numbers sorted in ascending order.
```

### Debugging

**Prompt:**

```
I'm getting this error: TypeError: 'NoneType' object is not subscriptable

Here's my code: [paste code]

Why does this happen and how do I fix it?
```

### Documentation

**Prompt:**

```
Write a README.md for a Python project that:
- Converts CSV files to JSON
- Validates data types
- Outputs to a specified directory
```

### Learning

**Prompt:**

```
Explain how async/await works in JavaScript. 
Use a simple real-world analogy to help me understand.
```

---

## Glossary

| Term | Definition |
|------|-----------|
| **API** | Application Programming Interface — a way to communicate with an AI service |
| **Attention** | Mechanism that helps LLMs understand which parts of text are most important |
| **Baseline** | Default performance to compare your AI results against |
| **Beam Search** | Strategy for generating multiple possible responses |
| **Bias** | When an AI model shows systematic favoritism or unfairness |
| **Context** | The information you provide to help the AI understand your request |
| **Fine-tuning** | Training a model on your specific data to improve performance |
| **Hallucination** | When an AI generates plausible-sounding but false information |
| **Inference** | Running a model to get predictions or responses |
| **Model Weights** | Internal parameters learned during training |
| **Prompt Engineering** | Crafting effective prompts to get better AI responses |
| **Temperature** | Parameter controlling randomness/creativity in responses |
| **Token** | Small unit of text (roughly 4 characters) that LLMs process |
| **Tokenizer** | Tool that breaks text into tokens |
| **Training** | Process of teaching a model using data |

---

## Next Steps

Once comfortable with these concepts:

- **Master prompt engineering** → Read `notes/prompt-engineering.md`
- **Build an app** → Start with OpenAI API, Claude, or Gemini
- **Use LangChain** → Chain multiple AI calls together
- **Explore RAG** → Index your own documents for AI to search
- **Run locally** → Try Ollama with Llama 2 for privacy

---

## Resources

- **OpenAI Docs:** <https://platform.openai.com/docs>
- **Anthropic Claude Docs:** <https://docs.anthropic.com>
- **Hugging Face:** <https://huggingface.co>
- **LangChain Docs:** <https://python.langchain.com>
- **Ollama:** <https://ollama.ai>
