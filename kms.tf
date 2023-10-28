resource "aws_kms_key" "this" {
  description             = "${var.prefix} redis encryption"
  deletion_window_in_days = var.kms_key_deletion_window_in_days
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Resource = "*"
      },
    ]
  })
}
