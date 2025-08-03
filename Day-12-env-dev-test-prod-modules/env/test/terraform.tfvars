# ec2 values #

ami = "ami-0150ccaf51ab55a51"
instance_type = "t2.micro"
instance_tags = "Terraform"
key_name = "key-1"

# iam role values  #

iam_role_name = "ec2-admin"
assume_role_policy = {            #  any funnction call is not allowed in terrafor.tfvars file
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }
  ]
}    
  role_tags = "ec2-admin role"
  #role_policy_name = "admin policy"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  #policy_attachment_name = "role to ec2 admin access"

  # rds values  #

  vpc_1_cidr = "10.0.0.0/16"
  vpc_1_tags = "vpc-1"
  subnets = {
       subnet-1 = {
        cidr_block = "10.0.0.0/24"
        availability_zone = "us-east-1a"
        tags = "subnet-1"
      }
       subnet-2 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1b"
        tags = "subnet-2"
     }
  }

  subnet_group_name = "subnet group-1"
  subnet_group_tags = "sub-grp"
  rds_storage = 20
  db_name = "dev"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  username = "admin"
  password = "Cloud123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot = true
  backup_retention_period = 7

  #  s3 values  #

  bucket_name = "terraformmodules3bucketforpractice"
  object_ownership = "BucketOwnerPreferred"
  acl = "private"

  #  sg values

  vpc_2_cidr = "10.1.0.0/16"
  vpc_2_tags = "vpc-2"
  security_group_name = "sg_1"  #AWS doesn't allow security group names to start with sg- — this prefix is reserved for internal IDs like sg-123456.
  security_group_tags = "sg"
  
  ingress_rules = [ {
     from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_block = [ "0.0.0.0/0" ]
} ,
{
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_block = [ "0.0.0.0/0" ] 
},
{
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_block = [ "10.0.0.0/24" ]
},
{
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_block = [ "192.168.0.0/24" ]

  } ]

  egress_rules = [ {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = [ "0.0.0.0/0" ]
  } ]

  ### vpc values 
  
  vpc_3_cidr = "10.2.0.0/16"
  vpc_3_tags = "vpc-3"
  