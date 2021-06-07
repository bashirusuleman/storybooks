pipeline {
	  environment {
	    imagename = "exbashorun/devops_capstone"
	    registryCredential = 'dockerhub'
	    dockerImage = ''
	  }
	  agent any
	  stages {
	      Stage ('Cloning Git') {
	      steps {
	          git 'https://github.com/bashirusuleman/storybooks.git'
	          }
	    }
stage('Building App') {
      steps {
        sh 'npm install'
      }
    }
	
	    stage('Building image') {
	      steps{
	        script {
	          dockerImage = docker.build imagename
	        }
	      }
	    }
	    stage('Deploy Image') {
	      steps{
	        script {
	          docker.withRegistry( '', registryCredential ) {
	            dockerImage.push("$BUILD_NUMBER")
	             dockerImage.push('latest')
	          }
	        }
	      }
	    }
	    stage('Remove Unused docker image') {
	      steps{
	        sh "docker rmi $imagename:$BUILD_NUMBER"
	         sh "docker rmi $imagename:latest"
        }
      }
    }
}
      
