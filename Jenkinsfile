pipeline {

    agent any

    environment {
        PACKER_LOG = "1"
    }

    stages {

        stage('Build image') {
            steps {
                sh 'packer build main.json'
            }
        }
    }
}

