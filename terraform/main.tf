module "vpc" {
  source = "./modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}