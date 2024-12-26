provider "aws" {
  region = var.aws_region
}

module "iam" {
  source     = "terraform-aws-modules/iam/aws"
  create_eks = true
}

output "eks_role_arn" {
  value = module.iam.eks_role_arn
}
