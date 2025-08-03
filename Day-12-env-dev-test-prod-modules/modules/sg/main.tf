resource "aws_vpc" "name" {
  cidr_block = var.vpc_2_cidr
  tags = {
    Name = var.vpc_2_tags
  }
}

resource "aws_security_group" "name" {
  vpc_id = aws_vpc.name.id
  name = var.security_group_name
  tags = {
    Name = var.security_group_tags
  }
  

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_block
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      protocol = egress.value.protocol
      cidr_blocks = egress.value.cidr_block
    }
  }
}