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

}

# ecr
variable "ecr_repository_name" {
  default = "eks-jokes-repository"
}

variable "subnet_cidr_az_a" {

}

variable "subnet_cidr_az_b" {

}