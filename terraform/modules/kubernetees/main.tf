provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "service_a" {
  source = "./service-a"
}

module "service_b" {
  source = "./service-b"
}