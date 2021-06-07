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
          docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    stage('Push to DockerHub') {
      steps {
        sh '''script {
          docker.withRegistry( \'\', registryCredential ) {
            dockerImage.push()
          }
        }'''
        }
      }

    }
    environment {
      registry = 'exbashorun/devops_capstone'
      registryCredential = 'dockerhub'
      dockerImage = '${registry + ":$BUILD_NUMBER"}'
    }
  }
