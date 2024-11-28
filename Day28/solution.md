# Jenkins Declarative Pipeline with Agents

## Overview
This task focuses on enhancing the Jenkins Declarative Pipeline by integrating Docker and leveraging Jenkins agents for distributed builds. Docker commands such as `docker build` and `docker run` are incorporated directly into the pipeline stages, and an alternative approach using Docker Groovy syntax is explored to handle potential errors gracefully. Additionally, Jenkins agents are introduced to optimize workload distribution.

## Pipeline Code with Agents

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

## Jenkins Agents

### Jenkins Master (Server)
The Jenkins master server is the central control unit that manages the overall orchestration of workflows defined in pipelines. It handles tasks such as scheduling jobs, monitoring job status, and managing configurations. The master serves the Jenkins UI and acts as the control node, delegating job execution to agents.

### Jenkins Agent
A Jenkins agent is a separate machine or container that executes the tasks defined in Jenkins jobs. When a job is triggered on the master, the actual execution occurs on the assigned agent. Each agent is identified by a unique label, allowing the master to delegate jobs to the appropriate agent.

For small teams or projects, a single Jenkins installation may suffice. However, as the number of projects grows, it becomes necessary to scale. Jenkins supports this by allowing a master to connect with multiple agents, enabling distributed job execution.

### Pre-requisites
To set up an agent, you'll need a fresh Ubuntu 22.04 Linux installation. Ensure Java (the same version as on the Jenkins master server) and Docker are installed on the agent machine.

**Note:** While creating an agent, ensure that permissions, rights, and ownership are appropriately set for Jenkins users.

## Tasks

### Task-01: Create an Agent
1. Set up a new node in Jenkins by creating an agent.
2. **AWS EC2 Instance Setup:**
   - Create a new AWS EC2 instance and connect it to the master (where Jenkins is installed).
3. **Master-Agent Connection:**
   - Establish a connection between the master and agent using SSH and a public-private key pair exchange.
4. Verify the agent's status in the "Nodes" section of Jenkins.

Refer to detailed instructions in [this article](https://www.jenkins.io/doc/book/using/using-agents/).

### Task-02: Run Previous Jobs on the New Agent
1. Use the agent to run the Jenkins jobs you built on Day 26 and Day 27.
2. **Labeling:** Assign labels to the agent and configure your master server to trigger builds on the appropriate agent based on these labels.

## Key Benefits
- Automated containerization and deployment.
- Enhanced workload distribution using agents.
- Streamlined integration with DockerHub.
- Error-free execution using Groovy syntax.

Complete your projects using this enhanced Declarative Pipeline approach with agents and share your progress on LinkedIn using the #90DaysOfDevOps challenge.

