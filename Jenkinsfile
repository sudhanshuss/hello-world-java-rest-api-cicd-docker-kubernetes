pipeline {
    environment {
    registry = "sudhanshuss/hello-world-java-rest-api-cicd-docker-kubernetes"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
    agent any 
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
        }
	stage ('Linting') {
	     steps {
                sh 'hadolint Dockerfile' 
            }
	}
 	stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    }		    
}
