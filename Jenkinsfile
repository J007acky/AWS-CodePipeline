pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                script{
                    checkout scm
                }
            }
        }
        stage('terraform init') {
            steps {
                script{
                    echo "Init Stage"
                }
            }
        }
        stage('terraform plan') {
            steps {
                script{
                    echo "Plan Stage"
                }
            }
        }
        stage('terraform apply') {
            steps {
                script{
                    echo "Apply Stage"
                }
            }
        }
        stage('function deploy') {
            steps {
                script{
                    echo "Function Deploy Stage"
                }
            }
        }
        stage('cleanup') {
            steps {
                script{
                    echo "Cleanup Stage"
                }
            }
        }
    }
}
