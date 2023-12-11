pipeline {
    agent any
    environment {
        // Define default values for environment variables
        JAVA_HOME = '/var/lib/jenkins/jdk-17'
        PATH = "$JAVA_HOME/bin:$PATH"
    }
    tools{
        maven 'Maven'
    }
    

    stages {
        /**stage('Download and Install OpenJDK') {
            steps {
                script {
                    // Download and install OpenJDK 17
                    sh 'wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz'
                    sh 'tar -xvf openjdk-17_linux-x64_bin.tar.gz -C /var/lib/jenkins/'
                    sh 'chmod -R 755 /var/lib/jenkins/jdk-17'
                }
            }
     }**/
         
       /**stage('Build Maven') {
            steps {
                script {
                    env.JAVA_HOME = '/var/lib/jenkins/jdk-17'
                    env.PATH = "$JAVA_HOME/bin:$PATH"
                }
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/2022boussaidi/devops.git']])
                sh 'mvn clean install -U'
            }
        }**/
       
        stage('test') {
            steps {
                script {
                    sh './mvnw test'
                }
            }
        }
        stage('Build docker image'){
                   steps{
                       script{
                           sh 'docker build -t chaimaboussaidi2000/docker-spring .'
                       }
                   }
               }
       
        stage('Push image to Hub') {
                   steps {
                       script {
                           withCredentials([string(credentialsId: 'id', variable: 'nouveaupass123')]) {
                               sh "echo \${nouveaupass123} | docker login -u chaimaboussaidi2000 --password-stdin"
                           }
                           sh 'docker push chaimaboussaidi2000/docker-spring'
                       }
                   }
               }
         stage('Build and Run Docker Compose') {
                           steps {
                               script {
                                   // Assuming your docker-compose.yml file is in the project root
                                   sh 'docker-compose up -d'
                               }
                           }
                       }
       
     }
    post {
        success {
            echo 'Build and tests passed.'
        }

        failure {
            echo 'Build or tests failed.'
        }

}
}
