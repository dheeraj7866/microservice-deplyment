resource "kubernetes_service" "service_a" {
  metadata {
    name      = "service-a"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "service-a"
    }
    port {
      port        = 80
      target_port = 5000
    }
  }
}
