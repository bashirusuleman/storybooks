pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/bashirusuleman/storybooks.git'
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
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }

    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }

      }
    }
   
  environment {
    registry = 'exbashorun/devopscapstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}
