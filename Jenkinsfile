pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
		sh 'mvn -Dmaven.repo.local=/home/ubuntu/m2_repo'
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
        }  
 	stage("Docker build") {
     	    steps {
      		sh "docker build -t sudhanshuss/hello-world-java-rest-api-cicd-docker-kubernetes ."
            }
	}
    }		    
}
