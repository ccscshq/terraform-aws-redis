resource "aws_security_group" "this" {
  name   = "${var.prefix} redis sg"
  vpc_id = var.redis_vpc_id
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.redis_source_security_group_ids

  security_group_id        = aws_security_group.this.id
  type                     = "ingress"
  from_port                = var.redis_port
  to_port                  = var.redis_port
  protocol                 = "tcp"
  source_security_group_id = each.value
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}
