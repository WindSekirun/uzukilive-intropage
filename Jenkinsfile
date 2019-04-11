@Library('jenkins-shared-library')_
pipeline {
    environment {
        registry = "windsekirun/uzukilive-intropage"
        registryCredential = 'DockerHub'
    }
    agent any
    stages {
        stage ('Start') {
            steps {
                sendNotifications 'STARTED'
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker build -t $registry:latest .'
            }
        }
        stage('Deploy docker image') {
            steps {
                withDockerRegistry([ credentialsId: registryCredential, url: "" ]) {
                    sh 'docker push $registry:latest'
                }
            }
        }
        stage('Clean docker image') {
            steps{
                sh "docker rmi $registry"
            }
        }
     }
    post {
        always {
            sendNotifications currentBuild.result
        }
    }
}
