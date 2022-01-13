pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-southeast-2'
        //TEMP_VAR = credentials('srv-ecr-usr')\
        //AWS_ACC_NO = 12345689012
        ENV = 'dev'
    }

    stages {
        stage('Download GIT Hub Repo') {
            steps {
                echo 'Downloading..'
                script {
                    //git credentialsId: 'sanjayrohilla13', branch: 'master', url: 'https://github.com/sanjayrohilla13/ecr-upgarde.git', poll: false
                    git changelog: false, poll: false, url: 'https://github.com/sanjayrohilla13/ecr-upgarde.git'                
                }
            }
        }

        stage('Build') {
            steps {
               // sh 'make docker-build '
               //sh 'docker build -t centos-repo .'
               switch(ENV) {
                case 'dev':
                    AWS_ACC_NO=98765432145;
                    break;
                case 'preprod':
                    AWS_ACC_NO=10087654321;
                    break;
               }
               println "${AWS_ACC_NO}" 
               echo 'Building....'
            }
        }    
        stage('Scan') {
            steps {
                echo 'Scanning....'
            }
        }    

        // stage('Docker Login') {
        //     steps {
        //        // withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID',credentialsId:'jenkins-aws-user',secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]) {
        //        // Docker Login in Jenkinsfile
        //         //sh 'make login-ecr'
        //         //echo 'looged in'
        //         //sh 'make push-ecr'
        //         //echo 'image pushed'
        //        /*
        //         echo 'Logging in..'
        //         sh '''
        //         aws --version
        //         aws ec2 describe-instances
        //         aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com
        //         ''' */
        //        // }    
        //     }
        // }

        stage('Push to ECR') {
            steps {
                echo 'Pushing to ECR....'
               // withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID',credentialsId:'jenkins-aws-user',secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]) {
                //sh 'make push-ecr AWS_ACC_NO=${AWS_ACC_NO}'
                sh 'make push-ecr AWS_ACC_NO=${AWS_ACC_NO}'
                /*
                sh '''
                    docker tag centos-repo:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
                    docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
                ''' */
               // }
            }
        }
    }
}
