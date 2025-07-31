module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tags = var.vpc_tags
  subnet_cidr = var.subnet_cidr
  availability_zone = var.availability_zone
}




module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = var.tags
}




module "s3" {
  source = "./modules/s3"
  bucket = var.bucket
  versioning = var.versioning
}