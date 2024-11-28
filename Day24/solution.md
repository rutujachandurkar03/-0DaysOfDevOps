🔹 Task 1: GitHub Integration with Jenkins
•	Forked the repository node-todo-cicd

•	Configured GitHub WebHooks to trigger the Jenkins pipeline automatically upon every merge pull request.

•	Ensured seamless integration between the GitHub repository and Jenkins for real-time CI/CD execution.

🔹 Task 2: Docker Compose Deployment
•	Created a Docker Compose file for the application, enabling multi-container orchestration.

•	Added the docker-compose commands to the Jenkins pipeline to automate building and deploying the application.

•	Ran the application successfully using Docker Compose, marking the completion of the deployment pipeline.


Pipeline Stages:

1️ Code Checkout: Cloned the repository using GitHub WebHooks.

2️ Build Docker Image: Automated the image creation for the application using Jenkins.

3️ Deploy with Docker Compose: Deployed the application using Docker Compose commands directly within Jenkins.




pipeline {
    
    agent any

    stages {
    
        stage('Code') {
            steps {
                git url:"https://github.com/rutujachandurkar03/node-todo-cicd.git",branch:"master"
                  }
                    }
                    
        stage('Build'){
            steps {
                sh "docker build -t django-notes-app ."
            }
        }
        
        stage('Deploy'){
            steps {
                sh "docker compose down && docker compose up -d --build"
            }
            
        }
        
    }
    
}


