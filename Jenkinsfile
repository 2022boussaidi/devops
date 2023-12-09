pipeline {
    agent any
    environment {
        // Define default values for environment variables
        JAVA_HOME = '/var/lib/jenkins/jdk-17'
        PATH = "$JAVA_HOME/bin:$PATH"
    }
    tools {
        maven 'Maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                script {
                    // Set Java environment variables
                    env.JAVA_HOME = '/var/lib/jenkins/jdk-17'
                    env.PATH = "$JAVA_HOME/bin:$PATH"

                    // Check if JAVA_HOME is set and set it if not
                    sh 'if [ -z "$JAVA_HOME" ]; then export JAVA_HOME="/var/lib/jenkins/jdk-17"; fi'

                    // Check if Maven is installed and set the Maven home
                    sh 'if [ -z "$MAVEN_HOME" ]; then export MAVEN_HOME="/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven"; fi'

                    // Print Java and Maven versions for debugging
                    sh 'java -version'
                    sh 'mvn -version'

                    // Checkout the code and build Maven project
                    checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/2022boussaidi/devops.git']])
                    sh 'mvn clean install -U'
                }
            }
        }

        stage('test') {
            steps {
                script {
                    // Run Maven test
                    sh './mvnw test'
                }
            }
        }
    }
}
