pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '--privileged -v $HOME/.m2:/home/jenkins/.m2 -ti -u 496 -e MAVEN_CONFIG=/home/jenkins/.m2 -e MAVEN_OPTS=-Xmx2048m'
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
 	stage("Docker build") {
     	    steps {
      		sh "docker build -t sudhanshuss/hello-world-java-rest-api-cicd-docker-kubernetes ."
            }
	}
   }
}
