resource "aws_ssm_parameter" "this" {
  count = var.redis_transit_encryption_enabled ? 1 : 0

  name  = "/${var.prefix}/aws/redis/auth_token"
  type  = "SecureString"
  value = random_password.this[0].result
}
