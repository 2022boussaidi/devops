pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/2022boussaidi/devops.git'
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    def mavenHome = tool 'Maven'
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean install"
                }
            }
        }
    }
}
