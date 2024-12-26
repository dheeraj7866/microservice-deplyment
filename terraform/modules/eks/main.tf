provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  cidr    = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.12.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  node_groups = {
    worker_group = {
      desired_capacity = var.node_group_size
      max_capacity     = 5
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }
}
