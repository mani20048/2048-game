pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerHub')
        IMAGE_NAME = 'mani9966/2048game'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/mani20048/2048-game.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("2048game:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerHub') {
                        docker.image("2048game:latest").push()
                    }
                }
            }
        }

        stage('Deploy to Render') {
            steps {
                echo 'Trigger Render Deployment via Webhook (if supported)'
                //or call Render's Deploy Hook if configured
                sh 'curl -X GET https://api.render.com/deploy/srv-d02ipa3e5dus73brf8r0?key=xR6ey_iWrcQ'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
