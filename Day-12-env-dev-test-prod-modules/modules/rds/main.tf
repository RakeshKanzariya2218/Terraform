resource "aws_vpc" "name" {
  cidr_block = var.vpc_1_cidr
  tags = {
    Name =  var.vpc_1_tags
  }
}


/*   Terraform only allows a single for_each (or count) meta‑argument per resource, data source, 
     or module block — you can't apply two or more for_each = ... within the same block.  */


resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  for_each = var.subnets
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.tags
  }
}


resource "aws_db_subnet_group" "name" {
  subnet_ids = values(aws_subnet.name)[*].id    ##  It is call the ids of all subnets which are inside the aws_subnet.name resource.
  name = var.subnet_group_name
  tags = {
    Name = var.subnet_group_tags
  }
}



resource "aws_db_instance" "name" {
  allocated_storage    = var.rds_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  
  # manage_master_user_password = true   ( managed by secret manager password and username both no nned to mention explicitily  )
  
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period
  db_subnet_group_name = aws_db_subnet_group.name.name   # db_subnet_group_name = aws_db_subnet_group.name.id ( both are valid name and id )
  depends_on = [ aws_db_subnet_group.name ]
}










