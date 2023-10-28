# terraform-aws-redis

This module provides ElatstiCache for Redis.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_deletion_window_in_days"></a> [kms\_key\_deletion\_window\_in\_days](#input\_kms\_key\_deletion\_window\_in\_days) | Deletion window in days of KMS key. | `number` | `30` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix for resources. | `string` | n/a | yes |
| <a name="input_redis_engine_version"></a> [redis\_engine\_version](#input\_redis\_engine\_version) | elasticache replication group | `string` | n/a | yes |
| <a name="input_redis_maintenance_window"></a> [redis\_maintenance\_window](#input\_redis\_maintenance\_window) | Maintenance window of Redis. The snapshot window and maintenance window must not overlap. | `string` | `"tue:10:30-tue:11:30"` | no |
| <a name="input_redis_node_type"></a> [redis\_node\_type](#input\_redis\_node\_type) | Node type of Redis. | `string` | `"cache.t3.small"` | no |
| <a name="input_redis_num_cache_clusters"></a> [redis\_num\_cache\_clusters](#input\_redis\_num\_cache\_clusters) | Number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2 | `number` | `2` | no |
| <a name="input_redis_parameter_group_family"></a> [redis\_parameter\_group\_family](#input\_redis\_parameter\_group\_family) | Parameter group family name of Redis. | `string` | n/a | yes |
| <a name="input_redis_parameters"></a> [redis\_parameters](#input\_redis\_parameters) | Parameters of Redis. | <pre>set(object({<br>    name  = string<br>    value = string<br>  }))</pre> | n/a | yes |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | Port number of Redis. | `number` | `6379` | no |
| <a name="input_redis_preferred_cache_cluster_azs"></a> [redis\_preferred\_cache\_cluster\_azs](#input\_redis\_preferred\_cache\_cluster\_azs) | Availability zones of Redis. | `set(string)` | n/a | yes |
| <a name="input_redis_snapshot_retention_limit"></a> [redis\_snapshot\_retention\_limit](#input\_redis\_snapshot\_retention\_limit) | Snapshot retention limit of Redis. | `number` | `7` | no |
| <a name="input_redis_snapshot_window"></a> [redis\_snapshot\_window](#input\_redis\_snapshot\_window) | Snapshot window of Redis. The snapshot window and maintenance window must not overlap. | `string` | `"05:00-09:00"` | no |
| <a name="input_redis_source_security_group_ids"></a> [redis\_source\_security\_group\_ids](#input\_redis\_source\_security\_group\_ids) | Map of the key and ID of the source security group, allowing access to Redis from the security group specified by this ID. | `map(string)` | n/a | yes |
| <a name="input_redis_subnet_ids"></a> [redis\_subnet\_ids](#input\_redis\_subnet\_ids) | IDs of Redis subnets. | `set(string)` | n/a | yes |
| <a name="input_redis_transit_encryption_enabled"></a> [redis\_transit\_encryption\_enabled](#input\_redis\_transit\_encryption\_enabled) | Whether to enable transit encryption. | `bool` | `false` | no |
| <a name="input_redis_vpc_id"></a> [redis\_vpc\_id](#input\_redis\_vpc\_id) | ID of VPC. | `string` | n/a | yes |

## Outputs

No outputs.
