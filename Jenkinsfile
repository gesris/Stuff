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
            agent{ label 'master' && 'agent-PC'}
            steps{
                sh 'python3 python_test.py'
                }
            }
        }
    }

