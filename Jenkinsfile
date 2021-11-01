pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-southeast-2'
        //TEMP_VAR = credentials('srv-ecr-usr')
    }

    stages {
        stage('Download GIT Hub Repo') {
            steps {
                echo 'Downloading..'
                script {
                    git credentialsId: 'sanjayrohilla13', branch: 'master', url: 'https://github.com/sanjayrohilla13/ecr-upgarde.git', poll: false
                }
            }
        }

        stage('Build') {
            steps {
               // sh 'make docker-build'
                echo 'Building....'
            }
        }    
        stage('Scan') {
            steps {
                echo 'Scanning....'
            }
        }    

        stage('Docker Login') {
            steps {
                withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID',credentialsId:'srv-ecr-usr',secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]) {
                // some block
                echo 'Logging in..'
                sh 'aws --version'
                sh 'aws ec2 describe-instances'
                //sh 'make docker-login'
                }    
            }
        }

        stage('Push to ECR') {
            steps {
                echo 'Pushing to ECR....'
            }
        }
    }
}
