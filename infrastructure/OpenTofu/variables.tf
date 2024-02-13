variable "aws_region" {
  default = "ap-southeast-1"
}

variable "component_prefix" {
  default = "eks-jokes"
}

variable "component_name" {
  default = "app"
}

variable "component_postfix" {

}

# ecr
variable "ecr_repository_name" {
  default = "eks-jokes-repository"
}
