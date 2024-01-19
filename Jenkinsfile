pipeline {
    agent any  // Replace with a specific agent label if needed

    environment {
        PATH="/opt/apache-maven-3.9.6/bin:$PATH"  // Correct PATH setting
        DOCKERHUB_CREDENTIALS = credentials ('docker-login')
        DOCKER_IMAGE = dockerhub1994/app-testing:${BUILD_NUMBER}
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
         stage('email-notifi') {
            steps {
               mail bcc: '', body: 'Testing Done', cc: '', from: '', replyTo: '', subject: 'FOR TESTING ', to: 'rajatpbhagat@gmail.com'
            }
        } 
        stage('docker-build'){
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('login-to-docker') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push-to-Dockerhub') {
            steps {
                sh 'docker push ${DOCKER_IMAGE} '
            }
        }
    }
}
