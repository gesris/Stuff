pipeline {
    agent none
    stages {
        stage('Responses') {
            steps{
                node ('master'){
                    echo 'Hello from master PC'
                }
                node ('agent-pc'){
                    echo 'Hello from agent PC'
                }
                node ('agent-pi-1'){
                    echo 'Hello from Pi-1'
                }
                node ('agent-pi-2'){
                    echo 'Hello from Pi-2'
                }
            }
        }
        stage('Tests'){
            parallel {
                stage('Test on Master-PC') {
                    agent {label 'master'}
                    steps{
                        sh 'python3 python_test.py'
                    }
                }
                stage('Test on Agent-PC') {
                    agent {label 'agent-pc'}
                    steps{
                        sh 'python3 python_test.py'
                    }
                }
                stage('Test on Agent-Pi-1') {
                    agent {label 'agent-pi-1'}
                    steps{
                        sh 'python3 python_test.py'
                    }
                }
                stage('Test on Agent-Pi-2') {
                    agent {label 'agent-pi-2'}
                    steps{
                        sh 'python3 python_test.py'
                    }
                }
            }
        }
    }
}

