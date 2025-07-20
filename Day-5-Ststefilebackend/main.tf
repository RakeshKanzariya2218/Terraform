resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = var.tags
  }
}

resource "aws_vpc" "name" {
  cidr_block = var.cidr_block
}

resource "aws_vpc" "socondvpc" {
  cidr_block = var.secondvpc
}
resource "aws_s3_bucket" "name" {
  bucket = var.aws_s3_bucket
}