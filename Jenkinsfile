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
                    git branch: 'master', url: 'git@github.com:sanjayrohilla13/ecr-upgarde.git', poll: false
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building....'
                docker { image 'node:14-alpine' 
                }
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