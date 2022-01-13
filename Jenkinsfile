pipeline {
    agent any
    parameters {
        string(name: 'env', defaultValue: 'dev', description: 'Environment')
    }
    environment {
        AWS_DEFAULT_REGION = 'ap-southeast-2'
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
               script {
               // sh 'make docker-build '
               //sh 'docker build -t centos-repo .'
                switch(params.env) {
                case 'dev':
                    env.AWS_ACC_NO=11111111111;
                    break;
                case 'preprod':
                    env.AWS_ACC_NO=22222222222;
                    break;
                case 'prod':
                    env.AWS_ACC_NO=333333333333;
                    break;
               }
               println "${env.AWS_ACC_NO}" 
               echo 'Building....'
               }
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
                println env.AWS_ACC_NO
                sh 'make push-ecr'
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
