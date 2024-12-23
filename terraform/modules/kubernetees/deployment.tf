resource "kubernetes_deployment" "service_a" {
  metadata {
    name      = "service-a"
    namespace = var.namespace
  }
  spec {
    replicas = 3
    template {
      spec {
        container {
          image = "dheerajkr7866/microservice-deployment-service-a:2"
          name  = "service-a"
          ports {
            container_port = 5000
          }
        }
      }
    }
  }
}