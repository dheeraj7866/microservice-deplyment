output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_kubeconfig" {
  value = module.eks.kubeconfig
}
