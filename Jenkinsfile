pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '--privileged -v /root/.m2:/root/.m2'
        }
    }
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
	 stage('Initialize'){
       		 def dockerHome = tool 'myDocker'
        	env.PATH = "${dockerHome}/bin:${env.PATH}"
         }    
 	stage("Docker build") {
     	    steps {
      		sh "docker build -t sudhanshuss/hello-world-java-rest-api-cicd-docker-kubernetes ."
            }
	}
   }
}
