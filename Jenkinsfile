pipeline {
    agent any
    environment {
        // Define default values for environment variables
        JAVA_HOME = '/var/lib/jenkins/jdk-17'
        PATH = "$JAVA_HOME/bin:$PATH"
    }
    tools{
        maven 'maven'
    }
    stages {
         
        stage('Build Maven') {
            steps {
                script {
                    env.JAVA_HOME = '/var/lib/jenkins/jdk-17'
                    env.PATH = "$JAVA_HOME/bin:$PATH"
                }
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/2022boussaidi/devops.git']])
                sh 'mvn clean install -U'
            }
        }
       
        stage('test') {
            steps {
                script {
                    sh './mvnw test'
                }
            }
        }
       
    }
}
