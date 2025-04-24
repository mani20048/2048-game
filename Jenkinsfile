pipeline {
    agent any

    environment {
        IMAGE_NAME = "2048game"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mani20048/2048-game.git'  // replace with your actual repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t 2048game:latest ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -d -p 80:80 --name 2048game_container 2048game:latest"
                }
            }
        }

        // Optional: Add tests or cleanup
        stage('Cleanup (optional)') {
            steps {
                script {
                    bat "docker stop 2048game_container || true"
                    bat "docker rm 2048game_container || true"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
