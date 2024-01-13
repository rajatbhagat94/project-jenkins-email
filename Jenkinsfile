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
                    git branch: 'master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'
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
                    withSonarQubeEnv('Sonarqube-7.8') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }
        
    }
}
