
# Spring Boot BankApp Deployment on Kubernetes  

This repository contains the Kubernetes YAML configuration files to deploy the **Spring Boot BankApp** along with a MySQL database on a Kubernetes cluster. The setup is designed to be scalable, secure, and resilient.  

## Table of Contents  
1. [Architecture Overview](#architecture-overview)  
2. [Prerequisites](#prerequisites)  
3. [Kubernetes Configuration Files](#kubernetes-configuration-files)  
4. [Deployment Steps](#deployment-steps)  
5. [Key Features](#key-features)  
6. [Learnings](#learnings)  

---

## Architecture Overview  

The deployment includes:  
- **Namespace**: To isolate resources.  
- **Persistent Storage**: Ensures MySQL data durability.  
- **Secrets & ConfigMaps**: For secure and flexible configuration management.  
- **MySQL StatefulSet**: Provides a stable and persistent database instance.  
- **Application Deployment**: Deploys the Spring Boot BankApp and ensures health monitoring.  
- **Services**: Expose MySQL internally and BankApp externally via NodePort.  

---

## Prerequisites  

1. Kubernetes cluster (e.g., Minikube, Kind, or a cloud provider).  
2. kubectl CLI installed and configured.  
3. Docker installed (for building the BankApp image, if needed).  

---

## Kubernetes Configuration Files  

### 1. Namespace  
Defines a namespace to organize the application's resources:  
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: bankapp-namespace
  labels:
    name: bankapp-namespace
```  

### 2. Persistent Storage  
#### Persistent Volume (PV):  
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: bankapp-pv
  namespace: bankapp-namespace
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: "/tmp/bankapp-mysql"
```  

#### Persistent Volume Claim (PVC):  
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: bankapp-pvc
  namespace: bankapp-namespace
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```  

### 3. Secrets and ConfigMaps  
#### Secrets:  
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
  namespace: bankapp-namespace
type: Opaque
data:
  MYSQL_ROOT_PASSWORD: VGVzdEAxMjM=  # Base64 for "Test@123"
  SPRING_DATASOURCE_PASSWORD: VGVzdEAxMjM= # Base64 for "Test@123"
```  

#### ConfigMaps:  
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: bankapp-config
  namespace: bankapp-namespace
data:
  MYSQL_DATABASE: BankDB
  SPRING_DATASOURCE_URL: jdbc:mysql://mysql-0.mysql-headless.bankapp-namespace.svc.cluster.local:3306/BankDB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
  SPRING_DATASOURCE_USERNAME: root
```  

### 4. MySQL Deployment  
#### StatefulSet for MySQL:  
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
  namespace: bankapp-namespace
spec:
  serviceName: mysql-headless
  replicas: 1
  template:
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secret
              key: MYSQL_ROOT_PASSWORD
        volumeMounts:
        - name: mysql-data
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-data
    spec:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 5Gi
```  

#### Headless Service for MySQL:  
```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql-headless
  namespace: bankapp-namespace
spec:
  clusterIP: None
  selector:
    app: mysql
  ports:
  - protocol: TCP
    port: 3306
    targetPort: 3306
```  

### 5. BankApp Deployment  
#### Deployment:  
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bankapp-deployment
  namespace: bankapp-namespace
spec:
  replicas: 1
  template:
    spec:
      initContainers:
      - name: wait-for-mysql
        image: busybox:1.28
        command: ['sh', '-c', 'until nc -z mysql-0.mysql-headless 3306; do echo waiting for mysql; sleep 5; done;']
      containers:
      - name: bankapp
        image: trainwithshubham/springboot-bankapp:latest
        env:
        - name: SPRING_DATASOURCE_URL
          valueFrom:
            configMapKeyRef:
              name: bankapp-config
              key: SPRING_DATASOURCE_URL
        - name: SPRING_DATASOURCE_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secret
              key: SPRING_DATASOURCE_PASSWORD
        livenessProbe:
          httpGet:
            path: /actuator/health
            port: 8080
```  

#### Service for BankApp:  
```yaml
apiVersion: v1
kind: Service
metadata:
  name: bankapp-service
  namespace: bankapp-namespace
spec:
  type: NodePort
  selector:
    app: bankapp
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
    nodePort: 30080
```  

---

## Deployment Steps  

1. Apply all YAML files in the correct order:  
   ```bash
   kubectl apply -f namespace.yml
   kubectl apply -f pv-pvc.yml
   kubectl apply -f secrets.yml
   kubectl apply -f configmap.yml
   kubectl apply -f mysql-statefulset.yml
   kubectl apply -f bankapp-deployment.yml
   kubectl apply -f bankapp-service.yml
   ```  

2. Verify the resources:  
   ```bash
   kubectl get all -n bankapp-namespace
   ```  

3. Access the application:  
   - Use the NodePort (`30080`) to access the app in your browser or via Postman: `http://<node-ip>:30080`.  

---

## Key Features  
- **Persistent Storage**: Durable data storage using PV and PVC.  
- **Secure Configurations**: Secrets for sensitive information and ConfigMaps for app configuration.  
- **StatefulSet**: Ensures MySQL’s stable storage and network identity.  
- **Health Checks**: `livenessProbe` and `readinessProbe` for monitoring app health.  
- **InitContainer**: Ensures MySQL is ready before starting the BankApp.  

---

## Learnings  
- Kubernetes essentials like StatefulSets, Services, ConfigMaps, and Secrets.  
- Managing application dependencies and ensuring reliability with readiness checks.  
- Building scalable and secure cloud-native applications.  

---  

Enjoy exploring the deployment and feel free to contribute or share feedback!  

