pipeline {
    agent any
    
    tools {
        // Убедитесь, что в Jenkins настроен Maven с именем "MAVEN3"
        // Manage Jenkins -> Tools -> Maven installations -> Name: MAVEN3
        maven "MAVEN3"
    }
    
    environment {
        // Credentials ID для Docker Hub пароля
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD')
        
        // ВАЖНО: Замените на ваш Docker Hub username!
        DOCKER_USERNAME = 'd240605d'  // <--- ЗАМЕНИТЕ НА ВАШ DOCKER HUB USERNAME
        DOCKER_IMAGE_NAME = 'comp367-lab2-welcome-web'
        DOCKER_IMAGE_TAG = '1.3'
    }
    
    stages {
        // Stage 1: Checkout исходного кода из GitHub
        stage("Check out") {
            steps {
                checkout scm
            }
        }
        
        // Stage 2: Сборка Maven проекта
        stage("Build maven project") {
            steps {
                echo 'Building Maven project...'
                sh 'mvn clean install'
            }
        }
        
        // Stage 3: Запуск Unit тестов
        stage("Unit test") {
            steps {
                echo 'Running unit tests...'
                sh "mvn test"
            }
        }
        
        // Stage 4: Сборка Docker образа
        stage("Docker build") {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    sh "docker build -t ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }
        
        // Stage 5: Вход в Docker Hub
        stage("Docker login") {
            steps {
                script {
                    echo 'Logging into Docker Hub...'
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKERHUB_PWD}"
                }
            }
        }
        
        // Stage 6: Загрузка образа в Docker Hub
        stage("Docker push") {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    sh "docker push ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
        always {
            sh 'docker logout || true'
        }
    }
}


