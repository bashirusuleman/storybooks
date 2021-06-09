def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws']]
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
       withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {  
       sh 'aws sts get-caller-identity'
       sh 'aws eks --region us-east-1 update-kubeconfig --name capstone-cluster'
       sh 'helm install capstone  /tmp/capstonehelm/'
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
