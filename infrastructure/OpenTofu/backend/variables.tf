variable "aws_region" {
  default = "ap-south-1"
}

variable "component_prefix" {
  default = "eks-jokes"
}

variable "component_name" {
  default = "app"
}

variable "component_postfix" {
  default = "states"
}

# ecr
variable "ecr_repository_name" {
  default = "repository"
}