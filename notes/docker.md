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
  <https://www.docker.com/products/docker-desktop/>

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
| ------ | ------- |
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

- Official download: <https://www.docker.com/products/docker-desktop/>
- Required to run Docker on Windows and macOS

Verify:

```bash
docker --version
```

---

### 2️⃣ Node.js (LTS)

- Official site: <https://nodejs.org/>
- Recommended: **LTS version**

Verify:

```bash
node --version
npm --version
```

---

### 3️⃣ Code Editor (Recommended)

While not required, a code editor makes things easier:

- **VS Code:** <https://code.visualstudio.com/>

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
| ---- | ------- |
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
  <https://docs.docker.com/compose/>

- **Docker Hub** (image registry):
  <https://hub.docker.com/>

- **Dockerfile best practices:**
  <https://docs.docker.com/develop/develop-images/dockerfile_best-practices/>

- **Docker networking basics:**
  <https://docs.docker.com/network/>

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
    depends_on:
      - db

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: example
      POSTGRES_PASSWORD: example
      POSTGRES_DB: exampledb
    ports:
      - "5432:5432"
```

### What This Means

| Item | Purpose |
| ---- | ------- |
| `services` | Defines containers |
| `app` | Your Node.js app |
| `db` | PostgreSQL database |
| `depends_on` | Ensures DB starts first |

---

## Step 5: Start Everything

From the project folder:

```bash
docker compose up --build
```

Docker will:

- Build the app image
- Start the database
- Connect both containers automatically

---

## Step 6: Test It

Open your browser:

```
http://localhost:3000
```

You should see:

```
Hello from Docker Compose!
```

---

## Step 7: Stop Everything

```bash
docker compose down
```

This stops and removes the containers but keeps your images.

---

## Explain Like I’m 5 (Compose Edition)

- One file tells Docker about **all containers**
- One command starts **everything together**
- Containers can talk to each other automatically

---

## When to Use Docker Compose

Use Compose when:

- Your app needs a database
- You have multiple services
- You want easy local development

---

## Final Notes

This Compose example is intentionally simple.

You can expand it later by adding:

- Volumes for database persistence
- Environment files (`.env`)
- Production overrides
- Health checks

Docker Compose is the **bridge between beginner Docker and real-world projects**.
