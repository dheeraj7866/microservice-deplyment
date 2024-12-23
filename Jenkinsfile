pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        // KUBECONFIG = credentials('kubeconfig-file')
        DOCKERHUB_USERNAME = 'dheerajkr7866'
        IMAGE_TAG = "${env.BUILD_ID}"
        K8S_NAMESPACE="microservices"
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
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         withKubeConfig([credentialsId: 'kubeconfig-file', serverUrl: 'https://<your-cluster-endpoint>']) {
        //             script {
        //                 sh 'kubectl apply -f k8s/service-a/deployment.yaml'
        //                 sh 'kubectl apply -f k8s/service-a/service.yaml'
        //                 sh 'kubectl apply -f k8s/service-b/deployment.yaml'
        //                 sh 'kubectl apply -f k8s/service-b/service.yaml'
        //             }
        //         }
        //     }
        // }
        stage('Update Kubernetes Deployment on EKS') {
            steps {
                script {
                    // Set up kubeconfig to interact with EKS cluster
                    sh '''
                    aws eks --region us-east-1 update-kubeconfig --name microservice-deployment
                    '''
                    
                    // Update the deployment with the new Docker image
                    sh """
                    kubectl set image deployment/service-a-deployment service-a=${DOCKERHUB_USERNAME}/microservice-deployment-service-a:${IMAGE_TAG} -n ${K8S_NAMESPACE}
                    kubectl rollout status deployment/service-a-deployment -n ${K8S_NAMESPACE}

                    kubectl set image deployment/service-b-deployment service-b=${DOCKERHUB_USERNAME}/microservice-deployment-service-b:${IMAGE_TAG} -n ${K8S_NAMESPACE}
                    kubectl rollout status deployment/service-b-deployment -n ${K8S_NAMESPACE}
                    """
                }
            }
        }
    }
}