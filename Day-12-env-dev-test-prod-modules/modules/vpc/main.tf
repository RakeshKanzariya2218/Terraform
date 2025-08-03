resource "aws_vpc" "name" {
  cidr_block = var.vpc_3_cidr
  tags = {
    Name = var.vpc_3_tgas
  }
}