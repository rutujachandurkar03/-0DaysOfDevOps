What is CI/CD?
🔄 Continuous Integration (CI): Automates the process of integrating code changes from multiple developers into a shared repository, ensuring smooth integration with builds, tests, and reviews.
⚡ Continuous Delivery (CD): Takes it a step further by automating the release process, ensuring every build is ready for deployment with confidence and speed.
________________________________________

Task 1: Jenkins Pipeline for Django To-Do App
Today, I created a Jenkins Pipeline that automates the build and deployment of my Django To-Do application.
🔸 Stage 1: Code
Automatically pulls the latest code from my GitHub repository.
🔸 Stage 2: Build
Creates a Docker image named django-to-do from the repository's Dockerfile.
🔸 Stage 3: Deploy

Starts a container from the built image, exposing the app on port 8000.
________________________________________

Jenkins Pipeline:

pipeline {
    agent any
    stages {
        stage('Code') {
            steps {
                git url: "https://github.com/rutujachandurkar03/Django-to-do.git", branch: "master"
            }
        }
        stage('Build') {
            steps {
                sh "docker build -t django-to-do ."
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8000:8000 django-to-do:latest"
            }
        }
    }
}

________________________________________

Jenkins Pipelines make it easy to automate repetitive tasks like code integration, containerization, and deployment.
Docker ensures a consistent environment across all stages of development and deployment.
Continuous Delivery helps ensure that every build is production-ready!

________________________________________

