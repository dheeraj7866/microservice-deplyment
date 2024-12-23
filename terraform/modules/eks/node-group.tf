resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.main.name
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = module.vpc.private_subnets
  instance_types  = [var.node_instance_type]
  scaling_config {
    desired_size = var.node_group_desired
    max_size     = var.node_group_max
    min_size     = var.node_group_min
  }
}