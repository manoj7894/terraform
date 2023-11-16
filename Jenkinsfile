pipeline{
    agent any
    tools {
        terraform 'terraform-01'   # Give whichever name you have given when install terraform in jenkins
    }
    stages{
        stage('GetCode') {
            steps{
                git 'https://github.com/manoj7894/sonar.git'   
            }                                                  
        }
        stage('terraform init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform fmt') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform validate') {
            steps{
                sh 'terraform validate'
            }
        }
        stage('terraform plan') {
            steps{
                sh 'terraform plan'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
