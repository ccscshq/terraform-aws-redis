resource "random_password" "this" {
  count = var.redis_transit_encryption_enabled ? 1 : 0

  length = 32
  # https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html
  override_special = "!&#$^<>-"
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
}
