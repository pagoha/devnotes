<!--
  DevNotes Repository
  File: docker.md
  Location: devnotes/notes/docker.md

  Purpose:
  A beginner-friendly, real-world introduction to Docker.
  This file is meant to take someone with ZERO Docker experience
  and make them comfortable using Docker in practical scenarios.
-->

# Docker — Beginner to Comfortable Guide

> This guide is written for people who have **never used Docker before**.
> It explains core concepts, common commands, and walks through a **real-world, step-by-step example** you can run locally.

---

## What Is Docker?

Docker is a tool that lets you package an application **together with everything it needs to run** (code, runtime, dependencies) into a unit called a **container**.

Containers run the same way on every machine, which removes the classic problem of:

> “It works on my computer, but not on yours.”

---

## Why Developers Use Docker

- Consistent environments across machines
- Faster setup for new projects
- Lightweight compared to virtual machines
- Easy deployment to servers and cloud platforms

Docker is commonly used for:
- Web applications
- APIs and microservices
- Databases in development
- CI/CD pipelines

---

## Core Docker Concepts (Plain English)

### Image
An **image** is a blueprint.

- Read-only
- Built from a `Dockerfile`
- Used to create containers

### Container
A **container** is a running instance of an image.

- Lightweight
- Isolated
- Can be started, stopped, and deleted

### Dockerfile
A **Dockerfile** is a text file that tells Docker:
- What base image to use
- What files to copy
- What command to run

---

## Installing Docker

### Docker Desktop (Required)

Install Docker Desktop for your operating system:

- **Windows & macOS (official download):**  
  https://www.docker.com/products/docker-desktop/

Docker Desktop includes:
- Docker Engine
- Docker CLI
- Docker Compose
- A graphical dashboard

After installation, verify:

```bash
docker --version
```

You should see Docker version output.

---


## Essential Docker Commands

| Action | Command |
|------|-------|
| Check running containers | `docker ps` |
| Check all containers | `docker ps -a` |
| List images | `docker images` |
| Run a container | `docker run` |
| Stop a container | `docker stop <id>` |
| Remove a container | `docker rm <id>` |
| Remove an image | `docker rmi <image>` |
| View logs | `docker logs <container>` |

---

## Real-World Example: Your First Docker App

This example walks you through **containerizing a simple web server**.

By the end, you will:
- Build a Docker image
- Run a container
- Access it from your browser

---

## Prerequisites

Make sure you have the following installed:

### 1️⃣ Docker Desktop
- Official download: https://www.docker.com/products/docker-desktop/
- Required to run Docker on Windows and macOS

Verify:

```bash
docker --version
```

---

### 2️⃣ Node.js (LTS)
- Official site: https://nodejs.org/
- Recommended: **LTS version**

Verify:

```bash
node --version
npm --version
```

---

### 3️⃣ Code Editor (Recommended)

While not required, a code editor makes things easier:

- **VS Code:** https://code.visualstudio.com/

Recommended VS Code extensions:
- Docker (by Microsoft)
- ESLint (optional)

---


## Step 1: Create the Project Folder

```bash
mkdir docker-demo
cd docker-demo
```

---

## Step 2: Create a Simple Web Server

Create a file called `server.js`:

```js
const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Docker!");
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

---

## Step 3: Create the Dockerfile

Create a file named `Dockerfile` (no extension):

```
FROM node:20-alpine

WORKDIR /app

COPY server.js .

EXPOSE 3000

CMD ["node", "server.js"]
```

### What Each Line Does

| Line | Meaning |
|----|-------|
| `FROM` | Base image with Node installed |
| `WORKDIR` | Sets working directory inside container |
| `COPY` | Copies app files into container |
| `EXPOSE` | Documents the app port |
| `CMD` | Runs the app |

---

## Step 4: Build the Image

```bash
docker build -t docker-demo-app .
```

Check that it exists:

```bash
docker images
```

---

## Step 5: Run the Container

```bash
docker run -p 3000:3000 docker-demo-app
```

Open your browser:

```
http://localhost:3000
```

You should see:

```
Hello from Docker!
```

---

## Step 6: Stop the Container

Press **Ctrl + C** or run:

```bash
docker ps
docker stop <container_id>
```

---

## What You Just Learned (Explain Like I’m 5)

- You wrote an app
- Docker put it in a box (image)
- Docker ran the box (container)
- Anyone with Docker can now run your app

---

## Common Beginner Issues

### Port Not Working
- Make sure ports match: `-p 3000:3000`
- App must listen on the same port

### Build Errors
- Check file names
- Ensure `Dockerfile` has no extension

---

## Best Practices

- Use small base images (`alpine`)
- Keep images simple
- Remove unused containers and images

Cleanup:

```bash
docker system prune -a
```

---

## When to Use Docker

Use Docker when:
- Working in teams
- Deploying apps
- Running databases locally
- Using CI/CD pipelines

---

## Next Steps

Once comfortable with this example, explore:

- **Docker Compose** (multi-container apps):  
  https://docs.docker.com/compose/

- **Docker Hub** (image registry):  
  https://hub.docker.com/

- **Dockerfile best practices:**  
  https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

- **Docker networking basics:**  
  https://docs.docker.com/network/

---


## Docker Compose — Real‑World Example (Beginner Friendly)

Docker Compose is used when your application needs **more than one container**, such as:

- A web app + a database
- An API + a cache (Redis)
- Multiple services working together

This example shows a **Node.js app + PostgreSQL database** running together.

---

## What You Will Build

- A Node.js app container
- A PostgreSQL database container
- Both started with **one command**

---

## Why Docker Compose?

Without Compose, you would need to:
- Start containers manually
- Manage networking yourself
- Remember long `docker run` commands

Docker Compose solves this with a single file: `docker-compose.yml`.

---

## Step 1: Project Structure

Your folder should look like this:

```
docker-compose-demo/
├── Dockerfile
├── docker-compose.yml
├── server.js
```

---

## Step 2: Simple App (server.js)

```js
const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Docker Compose!");
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

---

## Step 3: Dockerfile

```
FROM node:20-alpine
WORKDIR /app
COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]
```

---

## Step 4: docker-compose.yml

```yaml
version: "3.9"

services:
  app:
    build: .
    ports:
      - "3000:3000"
    env_file:
      - .env
    depends_on:
      - db

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    volumes:
      - db-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

volumes:
  db-data:

---

## Step 5: Add a `.env` File (Configuration)

Create a file named `.env` in the **same directory** as `docker-compose.yml`:

```env
POSTGRES_USER=example
POSTGRES_PASSWORD=example
POSTGRES_DB=exampledb
```

### What Each Variable Means

| Variable | Purpose |
|--------|---------|
| `POSTGRES_USER` | Database username |
| `POSTGRES_PASSWORD` | Database password |
| `POSTGRES_DB` | Default database name |

Docker Compose reads this file at runtime and injects the values into containers.

> ⚠️ **Important:** `.env` files often contain secrets and should not be committed to Git.

---

## Step 5a: Add a `.env.example` File (Best Practice)

Create a second file named `.env.example`:

```env
POSTGRES_USER=your_username
POSTGRES_PASSWORD=your_password
POSTGRES_DB=your_database
```

### Why `.env.example` Matters

- Documents required environment variables
- Safe to commit to Git
- New developers can copy it easily

Typical workflow:

```bash
cp .env.example .env
```

Then edit `.env` with real values.

---
 (Configuration)

Create a file named `.env` in the same directory as `docker-compose.yml`:

```env
POSTGRES_USER=example
POSTGRES_PASSWORD=example
POSTGRES_DB=exampledb
```

### Why Use a `.env` File?

- Keeps secrets out of `docker-compose.yml`
- Makes configuration reusable
- Allows easy changes without editing Compose files

Docker Compose automatically loads this file when referenced with `env_file`.

---

## Step 6: Volumes (Persistent Data)

Without volumes, database data is lost when containers stop.

This line creates a **named volume**:

```yaml
volumes:
  - db-data:/var/lib/postgresql/data
```

What this does:
- Stores database data outside the container
- Keeps data even after `docker compose down`

List volumes:

```bash
docker volume ls
```

Inspect volume:

```bash
docker volume inspect db-data
```

---

## Step 7: Start Everything

```bash
docker compose up --build
```

---

## Step 8: Stop Everything

```bash
docker compose down
```

To remove volumes too:

```bash
docker compose down -v
```

---

## Explain Like I’m 5 (Compose Edition)

- Docker Compose reads **one file**
- `.env` holds your settings
- Volumes remember your data
- One command runs everything

---

Docker Compose is the **bridge between beginner Docker and real-world projects**.
