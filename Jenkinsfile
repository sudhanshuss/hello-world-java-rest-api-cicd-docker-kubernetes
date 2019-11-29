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
    stage('Deploying') {
      echo 'Deploying to AWS...'
      dir ('./') {
        withAWS(credentials: 'aws-credentials', region: 'us-west-2') {
            sh "aws eks --region us-west-2 update-kubeconfig --name sid-cluster"
            sh "kubectl apply -f aws-auth-cm.yaml"
            sh "kubectl set image deployments/capstone-app capstone-app=${registry}:latest"
            sh "kubectl apply -f deployment.yml"
        }
      }
    }
  }		    
}
