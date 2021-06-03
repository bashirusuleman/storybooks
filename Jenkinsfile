pipeline {
    environment {
    registry = "exbashorun/devops_capstone"
    registryCredential = 'dockerhub'
       } 
    agent any
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
