pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature/nueva-funcionalidad', url: 'https://github.com/Dyorik/Charla2-SO2.git'
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
