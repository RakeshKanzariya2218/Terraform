resource "aws_vpc" "vpc_1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tags
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
}