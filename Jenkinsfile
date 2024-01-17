pipeline {
    agent any

    environment {
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
        SONARQUBE_HOME = "/opt/sonarqube/bin/linux-x86-64"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Static Code Analysis') {
            steps {
                script {
                    def scannerHome = tool 'Sonarqube-Scanner'
                    withSonarQubeEnv('sonarqube-7.8') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
    }
}
