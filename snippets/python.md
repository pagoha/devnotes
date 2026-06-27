# Python Snippets

Small Python examples and patterns that are useful across DevNotes.

## Confirm Your Python Version

```bash
python --version
```

## Minimal Script Template

```python
def main() -> None:
    print("Hello from DevNotes")


if __name__ == "__main__":
    main()
```

## Read a Text File Safely

```python
from pathlib import Path

path = Path("notes/docker.md")

if path.exists():
    content = path.read_text(encoding="utf-8")
    print(content[:500])
else:
    print(f"File not found: {path}")
```
