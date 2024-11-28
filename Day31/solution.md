# Launching Your First Kubernetes Cluster with Nginx

Welcome to Day 31 of the #90DaysOfDevOps Challenge! Today, we’re diving into Kubernetes hands-on by launching our first cluster using KIND and deploying an Nginx pod. Let's get started!

---

## What is KIND?
KIND (Kubernetes IN Docker) is a lightweight tool that allows you to quickly set up a local Kubernetes cluster. It is perfect for local development, edge computing, and learning Kubernetes basics.

### Key Features of KIND:
- **Supports Latest Kubernetes Versions**: Includes the latest Kubernetes release (+6 previous minor versions).
- **Cross-Platform**: Works on Linux, macOS, and Windows.
- **Flexible Deployment Options**: Can run as a VM, container, or bare-metal.
- **Multiple Container Runtimes**: Supports CRI-O, containerd, and Docker.
- **Direct API Endpoint**: Provides blazing-fast image loading.
- **Advanced Features**: Includes LoadBalancer, filesystem mounts, FeatureGates, and network policies.
- **Addons**: Allows pre-configured Kubernetes applications.
- **CI Environment Support**: Seamlessly integrates into common CI pipelines.

---

## What is a Pod?
In Kubernetes, **pods** are the smallest deployable units. A pod represents a group of one or more containers that share storage, network resources, and runtime specifications. Pods are co-located and co-scheduled to run in a shared context, making them application-specific "logical hosts."

### Key Pod Concepts:
- Containers within a pod are tightly coupled.
- Pods enable efficient scaling and resource allocation.
- They share:
  - **Storage**: Common volumes.
  - **Network**: Assigned a single IP address.

---

## Tasks for Today:

### Task 1: Install KIND
To install KIND, follow the [official KIND installation guide](https://kind.sigs.k8s.io/docs/user/quick-start/). Alternatively, you can use other methods like Homebrew:
```bash
brew install kind
```

### Task 2: Create and Deploy an Nginx Pod
Now that KIND is installed, let's deploy our first pod!

#### Steps to Deploy Nginx Pod:
1. **Create a Namespace**: Define the namespace to organize your resources.

   **namespace.yml**
   ```yaml
   apiVersion: v1
   kind: Namespace
   metadata:
     name: nginx
   ```
   Apply the namespace configuration:
   ```bash
   kubectl apply -f namespace.yml
   ```

2. **Define the Pod Configuration**:
   **nginx-pod.yml**
   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: nginx-pod
     namespace: nginx
   spec:
     containers:
     - name: nginx
       image: nginx:latest
       ports:
       - containerPort: 80
   ```

3. **Deploy the Pod**:
   Apply the pod configuration:
   ```bash
   kubectl apply -f nginx-pod.yml
   ```

4. **Verify the Pod**:
   Check the pod status:
   ```bash
   kubectl get pods -n nginx
   ```

5. **Access the Nginx Pod**:
   Use `kubectl port-forward` to access the Nginx server:
   ```bash
   kubectl port-forward pod/nginx-pod 8080:80 -n nginx
   ```
   Open your browser and navigate to `http://localhost:8080` to see the Nginx welcome page.

---

## Summary
Congratulations! You’ve:
1. Installed KIND on your local machine.
2. Created a Kubernetes namespace.
3. Deployed your first Nginx pod.

This hands-on task gave you a glimpse into Kubernetes basics and the power of KIND for local development. Keep exploring Kubernetes features, such as scaling deployments and managing workloads.

Stay tuned for the next tasks in the #90DaysOfDevOps challenge!


