module "network" {
  source = "git@github.com:ccscshq/terraform-aws-network.git?ref=v0.2.0"

  prefix                 = local.prefix
  ipv4_cidr              = local.ipv4_cidr
  ipv4_cidr_newbits      = local.ipv4_cidr_newbits
  subnets_number         = local.subnets_number
  create_private_subnets = true
}

module "bastion" {
  source = "git@github.com:ccscshq/terraform-aws-bastion.git?ref=v0.1.1"

  prefix               = local.prefix
  ec2_vpc_id           = module.network.vpc_id
  ec2_subnet_id        = module.network.private_subnet_ids[0]
  ec2_user_data_base64 = filebase64("${path.module}/user_data.sh")
}

module "redis" {
  source = "../.."

  prefix               = local.prefix
  redis_engine_version = "7.0"
  # https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheNodes.SupportedTypes.html
  redis_node_type                   = "cache.m7g.large"
  redis_preferred_cache_cluster_azs = module.network.private_subnet_azs
  redis_subnet_ids                  = module.network.private_subnet_ids
  redis_vpc_id                      = module.network.vpc_id
  redis_source_security_group_ids = {
    "bastion" = module.bastion.security_group_id
  }
  redis_parameter_group_family = "redis7"
  redis_parameters = [
    {
      name  = "timeout"
      value = "60"
    },
    {
      name  = "maxmemory-policy"
      value = "allkeys-lru"
    }
  ]
}
