@Library('jenkins-shared-library')_
pipeline {
    environment {
        registry = "windsekirun/uzukilive-intropage"
        registryCredential = 'DockerHub'
        def version = readfile env.WORKSPACE+ "/version"
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
                sh 'docker build -t $registry:$version .'
            }
        }
        stage('Deploy docker image') {
            steps {
                withDockerRegistry([ credentialsId: registryCredential, url: "" ]) {
                    sh 'docker push $registry:$version'
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
