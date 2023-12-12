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

           stage('Deploy to kubernetes'){
                                   steps{
                                       script{
                                           kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'demo')
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
