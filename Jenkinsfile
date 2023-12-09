pipeline {
    agent any
    environment {
        // Define default values for environment variables
        JAVA_HOME = '/var/lib/jenkins/jdk-17'
        PATH = "$JAVA_HOME/bin:$PATH"
    }
    stages {
        stage('Install Docker') {
            steps {
                script {
                    // Use sudo to avoid authentication issues
                    sh ' apt-get update -qq && sudo apt-get install -y docker-ce docker-ce-cli containerd.io'
                }
            }
        }
        stage('Download and Install OpenJDK') {
            steps {
                script {
                    // Create the directory in the workspace
                    sh 'mkdir -p workspace/'
                    sh 'curl -O https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz'
                    sh 'tar -xvf openjdk-17_linux-x64_bin.tar.gz -C workspace/'
                    sh 'chmod -R 755 workspace/jdk-17'
                }
            }
        }

        stage('Build Maven') {
            steps {
                script {
                    // Run Maven in a Docker container
                    sh 'docker run --rm -v $PWD:/app -v $HOME/.m2:/root/.m2 -w /app maven:3.8.4 mvn clean install -U'
                }
            }
        }

        stage('test') {
            steps {
                script {
                    // Run Maven tests in a Docker container
                    sh 'docker run --rm -v $PWD:/app -v $HOME/.m2:/root/.m2 -w /app maven:3.8.4 ./mvnw test'
                }
            }
        }
    }
}
