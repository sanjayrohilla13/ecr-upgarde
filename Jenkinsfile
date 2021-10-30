pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="240979667302"
        AWS_DEFAULT_REGION="ap-southeast-2" 
        IMAGE_REPO_NAME="centos-repo"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }

    stages {
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
                script {
                app = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                }
                echo 'Build Completed'
            }
        }    
        stage('Scan') {
            steps {
                echo 'Scanning....'
            }
        }    
        stage('Logging into AWS ECR') {
            steps {
                script {
                echo "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }   
            }
        }

        stage('Push to ECR') {
            steps {  
                script {
                    sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                    sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                }
            }        
        }
    }
}    