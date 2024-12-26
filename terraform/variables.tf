# AWS Region
variable "aws_region" {
  description = "The AWS region where the resources will be created"
  type        = string
  default     = "us-west-2"
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones
variable "availability_zones" {
  description = "The availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

# Public subnets CIDR blocks
variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Private subnets CIDR blocks
variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# EKS Cluster Name
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

# EKS Cluster version
variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.21"
}

# Node group size
variable "node_group_size" {
  description = "The desired number of nodes in the worker group"
  type        = number
  default     = 2
}

# Instance type for the worker nodes
variable "node_instance_type" {
  description = "The instance type to use for worker nodes"
  type        = string
  default     = "t3.medium"
}

# Service A Docker image tag
variable "service_a_image_tag" {
  description = "The image tag for Service A"
  type        = string
  default     = "latest"
}

# Service B Docker image tag
variable "service_b_image_tag" {
  description = "The image tag for Service B"
  type        = string
  default     = "latest"
}
