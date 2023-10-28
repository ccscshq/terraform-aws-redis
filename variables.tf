variable "prefix" {
  description = "Name prefix for resources."
  type        = string
}

# elasticache replication group
variable "redis_engine_version" {
  type = string
}
variable "redis_node_type" {
  description = "Node type of Redis."
  type        = string
  default     = "cache.t3.small"
}
variable "redis_num_cache_clusters" {
  description = "Number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2"
  type        = number
  default     = 2
}
variable "redis_port" {
  description = "Port number of Redis."
  type        = number
  default     = 6379
}
variable "redis_preferred_cache_cluster_azs" {
  description = "Availability zones of Redis."
  type        = set(string)
}
variable "redis_snapshot_window" {
  description = "Snapshot window of Redis. The snapshot window and maintenance window must not overlap."
  type        = string
  default     = "05:00-09:00"
}
variable "redis_snapshot_retention_limit" {
  description = "Snapshot retention limit of Redis."
  type        = number
  default     = 7
}
variable "redis_maintenance_window" {
  description = "Maintenance window of Redis. The snapshot window and maintenance window must not overlap."
  type        = string
  default     = "tue:10:30-tue:11:30"
}
variable "redis_transit_encryption_enabled" {
  description = "Whether to enable transit encryption."
  type        = bool
  default     = false
}

# elasticache subnet group
variable "redis_subnet_ids" {
  description = "IDs of Redis subnets."
  type        = set(string)
}

# elasticache_parameter_group
variable "redis_parameter_group_family" {
  description = "Parameter group family name of Redis."
  type        = string
}
variable "redis_parameters" {
  description = "Parameters of Redis."
  type = set(object({
    name  = string
    value = string
  }))
}

# kms
variable "kms_key_deletion_window_in_days" {
  description = "Deletion window in days of KMS key."
  type        = number
  default     = 30
}

# sg
variable "redis_vpc_id" {
  description = "ID of VPC."
  type        = string
}
variable "redis_source_security_group_ids" {
  description = "Map of the key and ID of the source security group, allowing access to Redis from the security group specified by this ID."
  type        = map(string)
}
