provider "aws" {
  
}

# create the rds
  resource "aws_db_instance" "name" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Cloud123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

# use null resource to execute the sql script in rds from your local machine

resource "null_resource" "name" {
  depends_on = [ aws_db_instance.name ]
  
  provisioner "local-exec" {
command = "mysql -h ${aws_db_instance.name.address} -u admin -pCloud123 dev < init.sql"
  }

  triggers = {
    always_run = timestamp()
  }
  }



