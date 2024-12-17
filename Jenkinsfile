pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'justcuriosity'  // Replace with your DockerHub username
        DOCKER_HUB_REPO = 'flask-app'         // Name of your Docker repository
        DOCKER_IMAGE = "${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git 'https://github.com/Ameen1804/StaticAPI.git'  // Replace with your repository
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to DockerHub
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Clean up after the build
            sh 'docker system prune -af'
        }
    }
}