variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "devops-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "cluster_name" {
  default = "devops-eks"
}

variable "cluster_version" {
  default = "1.31"
}