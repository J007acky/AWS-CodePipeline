pipeline {
    agent any
    tools {
        terraform 'Terraform-Jenkins'
    }

    stages {
        stage('Check for Azure CLI') {
            steps{
                script {
                    sh 'command -v az > /dev/null 2>&1 && az --version || curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
                }
            }
        }
        stage('terraform init') {
            steps {
                script {
                    echo 'Init Stage'
                    sh 'terraform init'
                }
            }
        }
        stage('terraform plan') {
            steps {
                script {
                    echo 'Plan Stage'
                    sh 'terraform plan'
                }
            }
        }
        stage('terraform apply') {
            steps {
                script {
                    echo 'Apply Stage'
                }
            }
        }
        stage('function deploy') {
            steps {
                script {
                    echo 'Function Deploy Stage'
                }
            }
        }
        stage('cleanup') {
            steps {
                script {
                    echo 'Cleanup Stage'
                }
            }
        }
    }
}
