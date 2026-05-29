pipeline {
    agent any

    environment {
        IMAGE = "kalicharandas001/awspythonapp:${BUILD_NUMBER}"
    }

    stages {

        stage('Git Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                pip3 install -r app/requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                export PYTHONPATH=$WORKSPACE/app

                pytest app/tests/
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                docker build -t $IMAGE app/
                '''
            }
        }

        stage('Docker Push') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin

                    docker push $IMAGE
                    '''
                }
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                sh '''
                sed -i "s|image:.*|image: $IMAGE|g" kubernetes/deployment.yaml
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f kubernetes/
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                kubectl rollout status deployment/pythonapp

                kubectl get pods
                kubectl get svc
                '''
            }
        }
    }

    post {

        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }

        always {
            sh 'docker image prune -f'
        }
    }
}