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
                    bat 'docker build -t 2048game .'
                }
            }
        }
        stage('Run Docker Container') {
    steps {
        script {
            bat 'docker rm -f 2048game || true'     // Stop and remove old container if exists
            bat 'docker run -d --name 2048game -p 80:80 2048game:latest'  // Run new container
        }
    }
}


        // stage('Push to Docker Hub') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://index.docker.io/v1/', 'dockerHub') {
                        
        //             }
        //         }
         //   }
       // }

       stage('Deploy to Render') {
    steps {
        script {
            sh 'curl -X POST https://api.render.com/deploy/srv-d02ipa3e5dus73brf8r0?key=xR6ey_iWrcQ'
        }
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
