pipeline {
    agent any

    environment {
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn install package'
            }
        }

        stage('Static Code Analysis') {
            steps {
                script {
                    withSonarQubeEnv('sonarqube-7.8') {
                    sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
    }
}
