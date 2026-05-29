output "vpc_id" {
  value = module.vpc_core.vpc_id
}

output "public_subnets" {
  value = module.vpc_core.public_subnets
}

output "private_subnets" {
  value = module.vpc_core.private_subnets
}

# output "vpc_id" {
#   value = module.vpc_core.vpc_id
# }

# output "public_subnets" {
#   value = module.vpc_core.public_subnets
# }

# output "private_subnets" {
#   value = module.vpc_core.private_subnets
# }