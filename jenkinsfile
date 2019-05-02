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
            steps{
                node ('master'){
                    sh 'git pull https://github.com/gesris/Stuff.git'
                    sh 'python3 python_test.py'
                }
                node ('agent-pc'){
                    sh 'python3 python_test.py'
                }
                node ('agent-pi-1'){
                    sh 'python3 python_test.py'
                }
                node ('agent-pi-2'){
                    sh 'python3 python_test.py'
                }
            }
        }
    }
}
