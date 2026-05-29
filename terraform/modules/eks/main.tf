module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.15.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  # IMPORTANT
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {

      desired_size = 1
      min_size     = 1
      max_size     = 1

      instance_types = ["t3.small"]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Project = "proddevopsaws"
    Env     = "prod"
  }
}

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "20.15.0"

#   cluster_name    = var.cluster_name
#   cluster_version = var.cluster_version

#   subnet_ids = var.subnet_ids
#   vpc_id     = var.vpc_id

#   enable_cluster_creator_admin_permissions = true

#   eks_managed_node_groups = {
#     default = {
#       desired_size = 2
#       min_size     = 1
#       max_size     = 3

#       instance_types = ["c7i-flex.large"]
#     }
#   }

#   tags = {
#     Project = "proddevopsaws"
#     Env     = "prod"
#   }
# }