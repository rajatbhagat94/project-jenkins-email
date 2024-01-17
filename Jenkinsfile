pipeline {
    agent any  // Replace with a specific agent label if needed

    environment {
        PATH="/opt/apache-maven-3.9.6/bin:$PATH"  // Correct PATH setting
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'  // Specify branch
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
        
    }
}
