resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# modules/eks/eks-cluster.tf
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = module.vpc.private_subnets
  }
}
