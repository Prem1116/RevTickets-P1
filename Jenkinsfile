pipeline {
    agent any
    
    tools {
        maven 'Maven'
        nodejs 'NodeJS'
    }
    
    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }
        
        stage('Build Backend') {
            steps {
                echo 'Building Spring Boot Backend...'
                dir('revtickets-backend') {
                    bat 'mvn clean package -DskipTests'
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                echo 'Building Angular Frontend...'
                dir('revtickets-frontend') {
                    bat 'npm install --legacy-peer-deps'
                    bat 'npm run build'
                }
            }
        }
        
        stage('Run Tests') {
            parallel {
                stage('Backend Tests') {
                    steps {
                        dir('revtickets-backend') {
                            bat 'mvn test'
                        }
                    }
                }
                stage('Frontend Tests') {
                    steps {
                        dir('revtickets-frontend') {
                            bat 'npm run test -- --watch=false --browsers=ChromeHeadless'
                        }
                    }
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                echo 'Building Docker images...'
                bat 'docker-compose build'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                bat 'docker-compose down'
                bat 'docker-compose up -d'
            }
        }
        
        stage('Health Check') {
            steps {
                echo 'Performing health checks...'
                sleep(time: 30, unit: 'SECONDS')
                script {
                    try {
                        bat 'curl -f http://localhost:8081/api/events || exit 1'
                        bat 'curl -f http://localhost:4200 || exit 1'
                        echo 'Health checks passed!'
                    } catch (Exception e) {
                        error 'Health checks failed!'
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up...'
            bat 'docker system prune -f'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
            bat 'docker-compose logs'
        }
    }
}