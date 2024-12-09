pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        KUBECONFIG = credentials('kubeconfig-file')
        DOCKERHUB_USERNAME = 'dheerajkr7866'
        IMAGE_TAG = "${env.BUILD_ID}"
    }
    stages {
        // stage('Clone Repository') {
        //     steps {
        //         git 'https://github.com/your-repo-url.git'
        //     }
        // }
        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker build -t ${DOCKERHUB_USERNAME}/microservice-deployment-service-a:${IMAGE_TAG} ./app/service-a/'
                    sh 'docker build -t ${DOCKERHUB_USERNAME}/microservice-deployment-service-b:${IMAGE_TAG} ./app/service-b/'
                }
            }
        }
        stage('Push Docker Images') {
            steps {
                script {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push ${DOCKERHUB_USERNAME}/microservice-deployment-service-a:${IMAGE_TAG}'
                    sh 'docker push ${DOCKERHUB_USERNAME}/microservice-deployment-service-b:${IMAGE_TAG}'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'kubeconfig-file', serverUrl: 'https://<your-cluster-endpoint>']) {
                    script {
                        sh 'kubectl apply -f k8s/service-a/deployment.yaml'
                        sh 'kubectl apply -f k8s/service-a/service.yaml'
                        sh 'kubectl apply -f k8s/service-b/deployment.yaml'
                        sh 'kubectl apply -f k8s/service-b/service.yaml'
                    }
                }
            }
        }
    }
}
