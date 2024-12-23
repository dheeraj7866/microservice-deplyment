output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

# modules/eks/variables.tf
variable "region" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "cluster_name" {}
variable "cluster_version" {}
variable "node_group_desired" {}
variable "node_group_max" {}
variable "node_group_min" {}
variable "node_instance_type" {}