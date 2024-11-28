# Launching a Kubernetes Cluster with Deployment

## Overview
In this project, we created a Kubernetes Deployment to manage a sample Node.js application using "Auto-healing" and "Auto-scaling" features. This deployment is designed to ensure high availability and scalability for our application.

---

## What is a Kubernetes Deployment?
A Deployment in Kubernetes provides a way to describe and manage updates for Pods and ReplicaSets. By defining the desired state in a Deployment, the Kubernetes Deployment Controller ensures the actual state matches the desired state, adjusting resources as needed.

### Key Features of Deployment:
- **Auto-healing**: Automatically restarts failed pods.
- **Auto-scaling**: Adjusts the number of pods based on resource usage.
- **Controlled Updates**: Ensures changes to the application happen seamlessly.

---

## Steps to Create and Deploy

### 1. Namespace Configuration
Namespace ensures resources are grouped logically. The `namespace.yml` configuration:
```yaml
kind: Namespace
apiVersion: v1
metadata:
  name: node-app
```
Command to apply the namespace:
```bash
kubectl apply -f namespace.yml
```

### 2. Pod Configuration
This defines the basic pod setup for the Node.js application:
```yaml
kind: Pod
apiVersion: v1
metadata:
  name: node-pod
  namespace: node-app
spec:
  containers:
    - name: node-container
      image: rutuja0307/node-app
      ports:
        - containerPort: 8000
```
Command to apply the pod:
```bash
kubectl apply -f pod.yml
```

### 3. Deployment Configuration
The `deployment.yml` creates a deployment for the application, ensuring two replicas are running with resource requests and limits:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-app-deployment
  namespace: node-app
  labels:
    app: node-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: node-app
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
        - name: node-container
          image: rutuja0307/node-app
          ports:
            - containerPort: 8000
          resources:
            requests:
              memory: "64Mi"
              cpu: "250m"
            limits:
              memory: "128Mi"
              cpu: "500m"
```
Command to apply the deployment:
```bash
kubectl apply -f deployment.yml
```

---

## Verify and Access
### Check Resources:
To verify the deployment and pods:
```bash
kubectl get pods -n node-app
kubectl get deployments -n node-app
```

### Port Forwarding:
To access the application locally:
```bash
kubectl port-forward pod/node-pod 8000:8000 -n node-app
```
Access the application at: [http://localhost:8000](http://localhost:8000)

---

## Project Highlights
- **Namespace**: Organized resources under `node-app`.
- **Deployment**: Managed replicas for high availability.
- **Resource Limits**: Ensured efficient use of CPU and memory.

With this project, you have successfully launched a Kubernetes Deployment showcasing essential features like auto-healing and auto-scaling. Great work!


