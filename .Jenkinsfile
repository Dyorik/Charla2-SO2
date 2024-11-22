pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tu-repositorio.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t mi-aplicacion:latest .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm mi-aplicacion:latest npm test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
