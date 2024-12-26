output "vpc_id" {
  description = "VPC ID created for the EKS cluster"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "namespace_name" {
  description = "Kubernetes namespace name"
  value       = module.namespace.metadata[0].name
}
