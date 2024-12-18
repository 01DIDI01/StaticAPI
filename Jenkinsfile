pipeline {
    agent any

    environment {
        DOCKER_IMAGE = '01didi01/flask-app'
        DOCKER_TAG = "build-${env.BUILD_NUMBER}"
        FULL_IMAGE_NAME = "${DOCKER_IMAGE}:${DOCKER_TAG}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/01DIDI01/flask-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Windows command
                    bat "docker build -t ${FULL_IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                        bat "docker push ${FULL_IMAGE_NAME}"
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    bat "docker stop flask-app-container || exit 0"
                    bat "docker rm flask-app-container || exit 0"

                    // Run the Docker container
                    bat "docker run -d --name flask-app-container -p 5000:5000 ${FULL_IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo "Docker image ${FULL_IMAGE_NAME} successfully built, pushed, and container started."
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
