pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-southeast-2'
        //TEMP_VAR = credentials('srv-ecr-usr')
    }

    parameters{
        choice(name: 'DOCKER_SRC', choices: ['ECR','artifactory'], description: 'Source of Sonarqube Docker Source')
    }
    stages {
        stage('Download GIT Hub Repo') {
            steps {
                echo 'Downloading..'
                script {
                    git credentialsId: 'sanjayrohilla13', branch: 'ecr-terraform', url: 'https://github.com/sanjayrohilla13/ecr-upgarde.git', poll: false
                }
            }
        }

        stage('Build') {
            steps {
               // sh 'make docker-build'
               sh 'docker build -t centos-repo .'
            echo 'Building....'
            }
        }    
        stage('Scan') {
            steps {
                echo 'Scanning....'
            }
        }

        stage('ecr-creation') {
            steps {
                withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID',credentialsId:'srv-ecr-usr',secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]) {
                sh '''
                    cd terraform
                    pwd
                    terraform init
                    terraform get -update
                    terraform plan
                    //terraform apply --auto-approve
                    TF_LOG=DEBUG terraform apply \
                    -var "docker_src=${DOCKER_SRC}\
                    -auto-approve=true
                    cd ..
                    '''
                    returnStdout: true
                    }  
                }  
            }    
        stage('Docker Login') {
            steps {
                withCredentials([aws(accessKeyVariable:'AWS_ACCESS_KEY_ID',credentialsId:'srv-ecr-usr',secretKeyVariable:'AWS_SECRET_ACCESS_KEY')]) {
               // Docker Login in Jenkinsfile
                sh 'make login-ecr'
               /*
                echo 'Logging in..'
                sh '''
                aws --version
                aws ec2 describe-instances
                aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com
                ''' */
                }    
            }
        }

        stage('Push to ECR') {
            steps {
                echo 'Pushing to ECR....'
                sh 'make push-ecr'
                /*
                sh '''
                    docker tag centos-repo:latest 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
                    docker push 240979667302.dkr.ecr.ap-southeast-2.amazonaws.com/centos-repo:Image1
                ''' */
            }
        }
    }
}
