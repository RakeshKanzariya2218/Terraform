resource "aws_vpc" "name" {
  tags = {
    Name = "Vpc-2"
  }
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-1" {
  tags = {
    Name = "subnet-1"
  }
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.name.id
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet-2" {
  tags = {
    Name = "subnet-2"
  }
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.name.id
  availability_zone = "us-east-1b"
}

resource "aws_db_subnet_group" "grp" {
name = "subnete-group"
subnet_ids = [ aws_subnet.subnet-1.id , aws_subnet.subnet-2.id ]

}

resource "aws_security_group" "sg" {
  name = "security group"
  vpc_id = aws_vpc.name.id
  description = "allow my sql database"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]       
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

# create the secret container  in aws console 
resource "aws_secretsmanager_secret" "rds" {
  name = "rds"
}

# store the secrets in created secret container 
resource "aws_secretsmanager_secret_version" "rds_version" {
  secret_id     = aws_secretsmanager_secret.rds.id 
  secret_string = jsonencode({                               #   jsonencode           =>	Converts map → JSON string	        =>Required for secret_string in Secrets Manager
    username = "admin"
    password = "Cloud123"
  })
  depends_on = [ aws_secretsmanager_secret.rds ]
}

# fatch the data from secret manager latest version
data "aws_secretsmanager_secret_version" "rds_version" {
  secret_id = aws_secretsmanager_secret.rds.id
}

# decode json into usable terraform map
locals {
  rds_credintials = jsondecode(data.aws_secretsmanager_secret_version.rds_version.secret_string)            #   jsondecode           =>  Converts JSON string → map	   =>Used in locals to parse the secret payload
}


# create RDS

resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  identifier             = "my-rds-db"
  db_name                 = "mydb"
  username               = local.rds_credintials.username   # calling username and password from local decoded terraform map insted of string
  password               = local.rds_credintials.password
  db_subnet_group_name   = aws_db_subnet_group.grp.name
  vpc_security_group_ids = [ aws_security_group.sg.id]
  skip_final_snapshot    = true
  publicly_accessible = true
}
