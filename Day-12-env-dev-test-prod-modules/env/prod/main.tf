module "ec2" {
  source = "../../modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  instance_tags = var.instance_tags
}


module "iam" {
  source = "../../modules/iam"
  iam_role_name = var.iam_role_name
  assume_role_policy = jsonencode(var.assume_role_policy)   # here using jsnoencode because any function call is not consider in r=tfvars file
  role_tags = var.role_tags
  # role_policy_name = var.role_policy_name
  policy_arn = var.policy_arn
  # policy_attachment_name = var.policy_attachment_name
  
}


module "rds" {
  source = "../../modules/rds"
  vpc_1_cidr = var.vpc_1_cidr
  vpc_1_tags = var.vpc_1_tags
  subnets = var.subnets
  subnet_group_name = var.subnet_group_name
  subnet_group_tags = var.subnet_group_tags
  rds_storage = var.rds_storage
  db_name = var.db_name
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period
  

}

module "s3" {
  source = "../../modules/s3"
  bucket_name = var.bucket_name
  object_ownership = var.object_ownership
  acl = var.acl
  
}

module "sg" {
  source = "../../modules/sg"
  vpc_2_cidr = var.vpc_2_cidr
  vpc_2_tags = var.vpc_2_tags
  security_group_name = var.security_group_name
  security_group_tags = var.security_group_tags
  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules
}

module "vpc" {
    source = "../../modules/vpc"
    vpc_3_cidr = var.vpc_3_cidr
    vpc_3_tgas = var.vpc_3_tags
}