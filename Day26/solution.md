# Day 26: Jenkins Declarative Pipeline

## Overview
One of the most important parts of your DevOps and CI/CD journey is learning the **Declarative Pipeline Syntax** of Jenkins. This day focuses on understanding Jenkins Pipelines and completing a task using the Declarative Pipeline.

## Key Concepts

### **What is a Pipeline?**
A **Pipeline** is a collection of steps or jobs interlinked in a sequence to automate the build, test, and deployment processes of applications.

### **Declarative vs Scripted Pipelines**
- **Declarative**: A recent and advanced implementation of pipeline-as-code with a more structured and opinionated syntax.
- **Scripted**: The traditional implementation of pipeline-as-code, built with Groovy as a general-purpose DSL (Domain-Specific Language).

### **Why Use Pipelines?**
- Pipelines are defined as a text file called a **Jenkinsfile**, which is committed to the project’s source control repository.
- This approach supports **Pipeline-as-code**, treating the pipeline as part of the application to be versioned and reviewed like any other code.

#### Benefits:
1. Automatically creates a pipeline build process for all branches and pull requests.
2. Enables code review and iteration on the pipeline itself.
3. Ensures consistency and collaboration across teams.

## Declarative Pipeline Syntax
A basic Declarative Pipeline structure:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Add build steps here
            }
        }
        stage('Test') {
            steps {
                // Add test steps here
            }
        }
        stage('Deploy') {
            steps {
                // Add deploy steps here
            }
        }
    }
}
```

## Task-01: Hello World Pipeline

### **Steps to Complete the Task**
1. Create a New Job in Jenkins, selecting **Pipeline** instead of Freestyle Project.
2. Follow the official Jenkins **Hello World example** to understand the basics.
3. Implement the example using the **Declarative Pipeline Syntax**.
4. Test the pipeline to ensure it works correctly.

### **Pipeline Code**
Here is the pipeline code for the Hello World example:

```groovy
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello, World!'
            }
        }
    }
}
```

### **Execution and Benefits**
- By creating this pipeline, you gain hands-on experience with writing and executing a Jenkins Declarative Pipeline.
- The `Jenkinsfile` can be committed to source control, enabling better collaboration and version control.

