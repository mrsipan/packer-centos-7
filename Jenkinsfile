pipeline {

    agent any

    stages 'Build image' {

        steps {

            sh 'PACKER_LOG=1 packer build main.json'

        }

    }
}
