# Jenkins Declarative Pipeline with Docker Integration

## Overview
This task focuses on enhancing the Jenkins Declarative Pipeline by integrating Docker. Docker commands such as `docker build` and `docker run` are incorporated directly into the pipeline stages, and an alternative approach using Docker Groovy syntax is explored to handle potential errors gracefully.

## Pipeline Code with Docker Integration

Here’s the updated pipeline:

```groovy
pipeline{
    agent { label 'dev-server' }

    stages{
        stage("Code Clone"){
            steps{
                echo "Code Clone Stage"
                git url: "https://github.com/LondheShubham153/node-todo-cicd.git", branch: "master"
            }
        }
        stage("Code Build & Test"){
            steps{
                echo "Code Build Stage"
                sh "docker build -t node-app ."
            }
        }
        stage("Push To DockerHub"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId:"dockerHubCreds",
                    usernameVariable:"dockerHubUser", 
                    passwordVariable:"dockerHubPass")]){
                    sh 'echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin'
                    sh "docker image tag node-app:latest ${env.dockerHubUser}/node-app:latest"
                    sh "docker push ${env.dockerHubUser}/node-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker compose down && docker compose up -d --build"
            }
        }
    }
}
```

## Tasks

### Task-01
Create a Docker-integrated Jenkins Declarative Pipeline. Use the syntax provided above to integrate Docker commands (`sh`) inside the stage blocks.

### Task-02
To handle errors gracefully, utilize the Docker Groovy syntax in your pipeline. This prevents issues such as attempting to re-run a job when a Docker container already exists.

You can refer to the [Jenkins Pipeline Documentation](https://www.jenkins.io/doc/book/pipeline/docker/) for more details.

### Key Benefits
- Automated containerization and deployment
- Streamlined integration with DockerHub
- Error-free execution using Groovy syntax

Complete your previous projects using this enhanced Declarative Pipeline approach and share your progress on LinkedIn using the #90DaysOfDevOps challenge.

