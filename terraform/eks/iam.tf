module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  create_eks = true
}
