pipeline {
    agent any
    parameters {
    }
    environment {
    }

    stages {
        stage('prepare') {

        }

        stage('Docker Login') {
             steps {
             }
        }
        stage('Download Github Repo') {
            steps {
                script {
                    git credentialsId: 'sanjayrohilla13', branch: 'master', url: 'git@github.com:sanjayrohilla13/ecr-upgarde.git', poll: false
                }
            }        
        }

        stage('Build') {
           steps {
           }
        }

        stage('Scan') {
             steps {
             }
          
        }
        stage('Push') {
             steps {
             }
        
        }
    }
}