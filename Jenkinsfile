pipeline {
    agent any
    environment {
        // Define default values for environment variables
        JAVA_HOME = '/var/lib/jenkins/workspace/SpringBoot/workspace/jdk-17'
        PATH = "$JAVA_HOME/bin:$PATH"
    }
    tools {
        // Reference the configured Maven tool
        maven 'Maven'
    }
    stages {
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
                    env.JAVA_HOME = '/var/lib/jenkins/workspace/SpringBoot/workspace/jdk-17'
                    env.PATH = "$JAVA_HOME/bin:$PATH"
                }

                // Maven is now configured, no need for explicit path
                sh 'mvn clean install -U'
            }
        }

        stage('test') {
            steps {
                script {
                    // Use the configured Maven tool for tests
                    sh 'mvn test'
                }
            }
        }
    }
}
