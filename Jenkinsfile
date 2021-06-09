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
          dockerImage = docker.build registry + ":latest"
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
    stage('Deploy EKS') {
      steps {
       sh 'aws sts get-caller-identity'
       sh 'aws eks --region us-east-1 update-kubeconfig --name capstone-cluster'
       sh 'helm upgrade --install capstone  -f /tmp/capstonehelm/values.yaml /tmp/capstonehelm/'
      }
    }
  }
   
  environment {
    registry = 'exbashorun/devopscapstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}
