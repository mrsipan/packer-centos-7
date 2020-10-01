import java.nio.file.Files


@com.cloudbees.groovy.cps.NonCPS
String gettmpdir() {
    Files.createTempDirectory('jenkins')
}

String tmpdir = gettmpdir()

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

                sh "mkfifo ${tmpdir}/qemu-serial.in ${tmpdir}/qemu-serial.out"

                sh "packer build -var qemu-serial=${tmpdir}/qemu-serial -var disk-size=${DISK_SIZE} -var ssh-password=${SSH_PASSWORD} main.json"

            }

        }
    }
}

