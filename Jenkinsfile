pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git url: 'https://your-repo-url.git', branch: 'main'
      }
    }
    stage('Install Terraform') {
      steps {
        sh '''
          wget https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_amd64.zip
          unzip terraform_1.5.3_linux_amd64.zip
          sudo mv terraform /usr/local/bin/
        '''
      }
    }
    stage('Initialize Terraform') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Plan Infrastructure') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }
    stage('Apply Infrastructure') {
      steps {
        sh 'terraform apply -auto-approve tfplan'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}







