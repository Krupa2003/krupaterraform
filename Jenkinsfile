pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-terraform-credentials')  // Reference to your AWS credentials ID in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-terraform-credentials')
        AWS_DEFAULT_REGION    = 'us-east-1'  // Specify your AWS region
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository using the correct syntax
                git(
                    url: 'https://github.com/Krupa2003/krupaterraform.git', 
                    branch: 'main',  // Specify the branch name
                    credentialsId: 'aws-terraform-credentials'  // Reference to your Jenkins credentials
                )
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
