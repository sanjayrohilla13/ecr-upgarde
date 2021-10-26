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

        }
        stage('Download Github Repo') {
            steps {
                script {
                    git credentialsId: 'sanjayrohilla13', branch: 'master', url: 'git@gist.github.com:0594963ad38e68917ef189b4e6a269db.git', poll: false
                }
            }        
        }

        stage('Build') {
          #sh 'make build'
        }

        stage('Scan') {
          #sh 'make scan'
        }
        stage('Push') {
          #sh 'make publish'
        }
    }


}