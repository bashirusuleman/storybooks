pipeline {
    environment {
    registry = "exbashorun/devops_capstone"
    registryCredential = 'dockerhub'
    dockerImage = docker.build registry + ":$BUILD_NUMBER"
       } 
    agent any
    stages {
        stage('Cloning Git'){
           steps{
            git "https://github.com/bashirusuleman/storybooks.git"
         }   
       }
        stage('Building App') { 
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
       stage('Push Image to DockerHub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
       stage('Remove Unused docker image') {
          steps{
             sh "docker rmi $registry:$BUILD_NUMBER"
          }
        } 
    }
}
