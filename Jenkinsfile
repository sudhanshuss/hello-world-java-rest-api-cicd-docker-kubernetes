pipeline {
	agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
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
	stage("Docker push") {
     	     steps {
                 sh "docker login -u username -p password"
                 sh "docker push nikhilnidhi/calculator_1"
              }
         }
    }		    
}
