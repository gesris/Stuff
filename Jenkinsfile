pipeline {
    agent none
    stages{
        stage('Setup'){
            agent any
            steps{
                sh 'git checkout testing'
                sh 'git branch'
                echo 'Switched to testing branch'
            }
        }
        stage('Responses'){
            parallel {
                stage('Response from Master-PC') {
                    agent {label 'master'}
                    steps{
                        echo 'Hello from master PC'
                    }
                }
                stage('Response from Agent-PC') {
                    agent {label 'agent-pc'}
                    steps{
                        echo 'Hello from agent PC'
                    }
                }
                stage('Response from Agent-Pi-1') {
                    agent {label 'agent-pi-1'}
                    steps{
                        echo 'Hello from Pi-1'
                    }
                }
                stage('Response from Agent-Pi-2') {
                    agent {label 'agent-pi-2'}
                    steps{
                        echo 'Hello from Pi-2'
                    }
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
        stage('Deployment'){
            agent any
            steps{
                sh 'git checkout master'
                sh 'git merge testing master'
                sh 'git push origin master'
                sh 'gesris'
                sh 'Ozyris13'
                echo 'Deployment complete'
            }
        }
    }
}

