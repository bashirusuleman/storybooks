pipeline {
    environment {
    registry = "exbashorun/devops_capstone"
    registryCredential = 'dockerhub'
       } 
    agent {
        docker {
            image 'node:14-slim' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
       stage('Building docker image') {
      steps {
          script {
                docker.build registry + ":$BUILD_NUMBER"
               }
             }
          }      
    }
}
