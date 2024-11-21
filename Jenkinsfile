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
                
                // Replace 'https://github.com/your-username/your-repository.git' with your repo URL
                git 'https://github.com/Krupa2003/krupaterraform.git'
                
                // Print files to verify Terraform configurations are present
                sh 'ls -la'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Run terraform init in the directory containing Terraform files if necessary
                    // Example with subdirectory terraform:
                    // sh 'cd terraform && terraform init'
                    // Use the line below if your Terraform files are in the root of the repo:
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Example with subdirectory terraform:
                    // sh 'cd terraform && terraform plan'
                    // Use the line below if your Terraform files are in the root of the repo:
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Example with subdirectory terraform:
                    // sh 'cd terraform && terraform apply -auto-approve'
                    // Use the line below if your Terraform files are in the root of the repo:
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after execution
            cleanWs()
        }
    }
}