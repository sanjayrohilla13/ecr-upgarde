pipeline {
    agent { dockerfile true }

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
            }
        }    
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
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