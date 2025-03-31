pipeline {
    agent any

    environment {
        IMAGE_NAME = "mi-aplicacion"
        CONTAINER_NAME = "app-contenerizada"
        REPO_URL = "https://github.com/Dyorik/Charla2-SO2.git"
        BRANCH_NAME = "feature/nueva-funcionalidad"
        CREDENTIALS_ID = "Pipeline"  // Reemplaza con tu ID de credenciales en Jenkins
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                script {
                    git credentialsId: CREDENTIALS_ID, branch: BRANCH_NAME, url: REPO_URL
                }
            }
        }

        stage('Construcción de Imagen Docker') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Ejecutar Contenedor') {
            steps {
                script {
                    sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Pruebas') {
            steps {
                script {
                    sh 'sudo chmod +x test_script.sh'
                    sh 'test_script.sh'
                }
            }
        }

        stage('Despliegue') {
            steps {
                script {
                    echo "🚀 Despliegue exitoso. La aplicación está corriendo en Docker."
                }
            }
        }

        stage('Ejecutar Contenedor') {
            steps {
                script {
                    sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME
                    docker logs $CONTAINER_NAME  # Ver los logs del contenedor
                    '''
                }
    }
}
    }

    post {
        always {
            script {
                sh 'docker ps -a'
            }
        }
        success {
            echo "✅ Pipeline ejecutado correctamente."
        }
        failure {
            echo "❌ Error en el pipeline. Verifica los logs."
        }
    }
}
