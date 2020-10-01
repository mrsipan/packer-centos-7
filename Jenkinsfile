pipeline {

    agent any

    environment {
        PACKER_LOG = "1"
    }

    parameters {
        string(
            name: 'SSH_PASSWORD',
            defaultValue: 'passwd',
            description: 'Centos 7 ssh password',
        )
        string(
            name: 'DISK_SIZE',
            defaultValue: '2048',
            description: 'Disk size',
        )
    }

    stages {

        stage('Build image') {

            steps {

                tmpfile = File.createTempFile()

                sh "packer build -var disk-size=${DISK_SIZE} -var ssh-password=${SSH_PASSWORD} main.json"

            }

        }
    }
}

