# Hello-world-java-rest-api-cicd-docker-kubernetes

This is a spring boot hello world application.Integration with docker , jenkins for CICD and kubernetes 

## Installation
1. Java 8
2. Maven 3.6.2
    ```cd /opt/
    sudo wget http://apache.mirrors.ionfish.org/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
    sudo tar -xf apache-maven-3.5.3-bin.tar.gz
    sudo mv apache-maven-3.5.3/ apache-maven/
    sudo update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001
    ```
   Configuring Apache Maven Environment
    ```$ cd /etc/profile.d/
    $ sudo gedit maven.sh 
    ```
   Apache Maven Environment Variables
    ```
    # MAVEN_HOME for Maven 1 - M2_HOME for Maven 2
    export JAVA_HOME=<echo $JAVA_HOME>
    export M2_HOME=/opt/apache-maven
    export MAVEN_HOME=/opt/apache-maven
    export PATH=${M2_HOME}/bin:${PATH}
    ```
3. Docker
    ```$sudo apt install docker.io
       $sudo usermod -aG docker $USER
    ```
4. Jenkins
   ```
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
   sudo apt-get update
   sudo apt-get install jenkins
   sudo usermod -aG docker jenkins
   ```
5. Hadolint
   ```
   wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
   chmod +x /bin/hadolint
   ```
   
 ## References 
    https://www.youtube.com/watch?v=TYfO26yc1EM&t=601s
    https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html
    https://medium.com/@gustavo.guss/jenkins-building-docker-image-and-sending-to-registry-64b84ea45ee9
    https://codeburst.io/getting-started-with-kubernetes-deploy-a-docker-container-with-kubernetes-in-5-minutes-eb4be0e96370
    https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html
