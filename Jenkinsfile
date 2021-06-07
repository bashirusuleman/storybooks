pipeline {
	  environment {
	    imagename = "exbashorun/devops_capstone"
	    registryCredential = 'dockerhub'
	    dockerImage = ''
	  }
	  agent any
	  stages {
	      stage ('Cloning Git') {
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
          		docker.build imagename + ":$BUILD_NUMBER"
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
      
