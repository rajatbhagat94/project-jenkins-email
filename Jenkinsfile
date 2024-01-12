pipeline {
    agent {
        label 'MASTER'  // Ensure this matches the exact case of your configured label
        // Or, if you prefer any available agent:
        // any
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/rajatbhagat94/project-jenkins-email.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('sonar-scanner') {  // Indent this stage correctly
            steps {
                withSonarQubeEnv('sonar-server-7.8') {
                    sh 'mvn sonar:sonar'  // Use the correct Maven command for SonarQube analysis
                }
            }
        }
    }
}
