resource "aws_elasticache_replication_group" "this" {
  replication_group_id        = "${var.prefix}-redis"
  description                 = "${var.prefix} redis"
  engine_version              = var.redis_engine_version
  node_type                   = var.redis_node_type
  num_cache_clusters          = var.redis_num_cache_clusters
  port                        = var.redis_port
  preferred_cache_cluster_azs = var.redis_preferred_cache_cluster_azs
  subnet_group_name           = aws_elasticache_subnet_group.this.name
  parameter_group_name        = aws_elasticache_parameter_group.this.name
  security_group_ids          = toset([aws_security_group.this.id])
  automatic_failover_enabled  = true
  snapshot_window             = var.redis_snapshot_window
  snapshot_retention_limit    = var.redis_snapshot_retention_limit
  maintenance_window          = var.redis_maintenance_window
  apply_immediately           = true
  auto_minor_version_upgrade  = true
  transit_encryption_enabled  = var.redis_transit_encryption_enabled
  auth_token                  = var.redis_transit_encryption_enabled ? aws_ssm_parameter.this[0].value : null
  at_rest_encryption_enabled  = true
  kms_key_id                  = aws_kms_key.this.arn
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.prefix}-redis-sg"
  subnet_ids = var.redis_subnet_ids
}

resource "aws_elasticache_parameter_group" "this" {
  name   = "${var.prefix}-redis-pg"
  family = var.redis_parameter_group_family

  dynamic "parameter" {
    for_each = var.redis_parameters

    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
