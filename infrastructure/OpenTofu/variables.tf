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
  default = "172.31.1.0/24"
}

variable "subnet_cidr_az_b" {
  default = "172.31.2.0/24"
}