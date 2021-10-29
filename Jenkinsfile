pipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                echo 'Logging in..'
            }
        }
        stage('Download GIT Hub Repo') {
            steps {
                echo 'Downloading..'
                script {
                    git credentialsId: 'sanjayrohilla13', branch: 'master', url: 'git@github.com:sanjayrohilla13/ecr-upgarde.git', poll: false
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building....'
                app = docker.build("mycentos")
                echo 'Build Completed'
            }
        }    
        stage('Scan') {
            steps {
                echo 'Scanning....'
            }
        }    
        stage('Push to ECR') {
            steps {
                echo 'Pushing to ECR....'
            }
        }
    }
}