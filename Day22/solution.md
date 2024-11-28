Jenkins is an open-source CI/CD server that integrates seamlessly into DevOps workflows, providing instant feedback on code quality and automating deployments. This saves time, reduces human error, and lets us focus more on innovation! 
I created a Jenkins pipeline that:
1.	Prints "Hello World" 
2.	Displays the current date and time 
3.	Clones a GitHub repository and lists its contents 
4.	Runs automatically every hour 
Pipeline Code:
Here’s the pipeline code I used to automate these tasks:




 pipeline 
 {

    agent any
    
    stages {
    
       stage('Hello') {
            steps {
                echo 'Hello World'
            }   
        }
        
       stage('Print Date') {
            steps {
                sh 'date'
            }
        } 
        
      stage('Clone GitHub Repository') {
            steps {
                git url: 'https://github.com/rutujachandurkar03/two-tier-flask-app.git', branch: 'master'
            }
        }

        stage('List Repository Contents') {
            steps {
                sh 'ls -l'
            }
        }
    }
  }

