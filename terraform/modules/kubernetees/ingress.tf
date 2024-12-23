resource "kubernetes_ingress" "service_a" {
  metadata {
    name      = "service-a-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" : "alb"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.service_a.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
