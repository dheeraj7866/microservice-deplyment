provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

# VPC Module
module "vpc" {
  source          = "./modules/vpc"
  cidr            = var.vpc_cidr
  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# IAM Module
module "iam" {
  source     = "./modules/iam"
  create_eks = true
}

# EKS Module
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.subnet_ids
  node_groups = {
    worker_group = {
      desired_capacity = var.node_group_size
      max_capacity     = 5
      min_capacity     = 1
      instance_type    = var.node_instance_type
    }
  }
}

# Namespace Module
module "namespace" {
  source         = "./modules/namespace"
  namespace_name = "microservices"
}

# Service A Module
module "service_a" {
  source         = "./modules/service-a"
  namespace_name = module.namespace.metadata[0].name
  image_tag      = var.service_a_image_tag
}

# Service B Module
module "service_b" {
  source         = "./modules/service-b"
  namespace_name = module.namespace.metadata[0].name
  image_tag      = var.service_b_image_tag
}
