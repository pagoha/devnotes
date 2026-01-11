# Kubernetes (Beginner → Practical Guide)

> DevNotes Repository
> This document builds directly on `notes/docker.md` and is part of the
> DevNotes learning path: **Zero → Practical → Confident**.

---

## What Is Kubernetes (In Simple Terms)

If Docker lets you **run containers**, Kubernetes (often called **K8s**) helps you:

- run **many containers**
- keep them **alive**
- restart them if they crash
- scale them up or down
- connect them to each other

### Simple analogy

- **Docker** = running a single food truck
- **Docker Compose** = managing a few food trucks together
- **Kubernetes** = running a whole food festival with rules, backups, and staff

---

## Prerequisites (Important)

Before starting this guide, you should be comfortable with:

- Basic Docker concepts
- Dockerfiles
- Docker Compose
- Running containers locally

👉 **Read first:** `notes/docker.md`

---

## When Should You Use Kubernetes?

You probably **don’t need Kubernetes** if:

- you’re running 1–3 containers
- you’re learning locally
- you’re building a small side project

You **do need Kubernetes** if:

- you need high availability
- containers must auto-restart
- you want scaling
- you’re deploying to cloud providers
- you’re working in production environments

---

## Core Kubernetes Concepts (The Big Picture)

### Cluster

A **cluster** is a group of machines (nodes) that run containers.

### Node

A **node** is a machine (VM or physical) in the cluster.

### Pod

A **pod** is the **smallest unit** in Kubernetes.

- A pod usually runs **one container**
- Sometimes multiple tightly-coupled containers

> Think: *Pod = wrapper around a container*

### Deployment

A **Deployment** tells Kubernetes:

- what to run
- how many copies
- how to update them safely

### Service

A **Service** exposes your app:

- internally (cluster only)
- or externally (browser access)

### ConfigMap & Secret

Used for configuration:

- ConfigMap → non-sensitive values
- Secret → passwords, tokens

---

## Tooling You’ll Use

### kubectl (Kubernetes CLI)

Official install guide: <https://kubernetes.io/docs/tasks/tools/>

Check installation:

```bash
kubectl version --client
```

---

## Local Kubernetes Setup (Beginner-Friendly)

### Option 1: Docker Desktop (Easiest)

- Enable Kubernetes in settings
- Best for beginners
<https://www.docker.com/products/docker-desktop/>

### Option 2: Minikube

- Lightweight local cluster
<https://minikube.sigs.k8s.io/docs/start/>

---

## Verify Your Cluster

```bash
kubectl cluster-info
kubectl get nodes
```

---

## Your First Kubernetes App (Real Example)

### Step 1: Create a Deployment

`deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
        - name: hello
          image: nginx:latest
          ports:
            - containerPort: 80
```

Apply it:

```bash
kubectl apply -f deployment.yaml
```

Check status:

```bash
kubectl get pods
kubectl get deployments
```

---

### Step 2: Expose the App (Service)

`service.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: hello-service
spec:
  type: NodePort
  selector:
    app: hello
  ports:
    - port: 80
      targetPort: 80
```

Apply it:

```bash
kubectl apply -f service.yaml
```

Access it:

```bash
kubectl get services
```

---

### Step 3: Scaling Your App

```bash
kubectl scale deployment hello-app --replicas=3
kubectl get pods
```

Kubernetes automatically:

- creates new pods
- load balances traffic
- replaces failed pods

---

### Step 4: Environment Variables (ConfigMaps)

`configmap.yaml`:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_ENV: production
  LOG_LEVEL: info
```

Use in Deployment:

```yaml
envFrom:
  - configMapRef:
      name: app-config
```

Apply:

```bash
kubectl apply -f configmap.yaml
```

---

### Step 5: Secrets (Sensitive Data)

```bash
kubectl create secret generic app-secret \
  --from-literal=DB_PASSWORD=supersecret
```

- Secrets are base64 encoded
- Safer than plain text
- Still must be protected

---

## Comparing Docker Compose vs Kubernetes

| Feature | Docker Compose | Kubernetes |
| ------ | --------------- | ------------ |
| Complexity | Low | High |
| Learning curve | Easy | Steep |
| Scaling | Manual | Built-in |
| Self-healing | No | Yes |
| Production-ready | Limited | Yes |

**Rule of thumb:** Compose first → Kubernetes later

---

## Common Beginner Mistakes

- Jumping into Kubernetes too early
- Writing huge YAML files without understanding
- Forgetting Docker fundamentals
- Not reading error messages
- Overengineering local projects

---

## Recommended Learning Order

1. Docker basics
2. Docker Compose
3. Kubernetes concepts
4. Local Kubernetes
5. Cloud Kubernetes (future topic)

---

## What’s Next?

- CI/CD pipelines
- Helm charts
- Kubernetes in the cloud (EKS, GKE, AKS)

📌 These will be added as **future DevNotes documents**.

---

## Final Notes

- Kubernetes is powerful — but it’s okay if it feels confusing at first.
- Take it slow, re-read sections, experiment.
- This guide is designed to grow with you.
