pipeline {
    agent {
        label 'MASTER'  // Ensure this matches the exact case of your configured label
        // Or, if you prefer any available agent:
        // any
    }

    stages {
        stage('checkout') {
            steps {
                script {
                    // Correcting the branch specification
                    git branch: '*/master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'
                }
            }
        }
        stage('build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
        stage('sonar-scanner') {
            steps {
                script {
                    // Correcting the SonarQube environment name
                    withSonarQubeEnv('sonar-server-7.8') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }
        stage('email-notifi') {
            steps {
                script {
                    // Correcting the email notification syntax
                    emailext subject: 'This is text from Jenkins',
                             body: 'Email body content',
                             to: 'rajatpbhagat@gmail.com',
                             replyTo: '',
                             mimeType: 'text/html'
                }
            }
        }
    }
}

