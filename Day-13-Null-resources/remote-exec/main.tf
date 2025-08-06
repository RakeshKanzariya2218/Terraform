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







resource "aws_instance" "name" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name = "key-1"
  associate_public_ip_address = true
  tags = {
    Name = "rds connect instnace"
  }
}



resource "null_resource" "remote-exec" {
  depends_on = [ aws_instance.name, aws_db_instance.name ]

  connection {
    type = "ssh"
    host = aws_instance.name.public_ip
    user = "ec2-user"
    private_key = file("~/.ssh/id_ed25519")
  }
  
  provisioner "file" {
    source = "init.sql"
    destination = "/home/ec2-user/init.sql"
  }
  
  
  provisioner "remote-exec" {
    inline = [  
            "mysql -h ${aws_db_instance.mysql_rds.address} -u ${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["username"]} -p${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]} < /home/ec2-user/init.sql" 
            ]
}
 triggers = {
   always_run = timestamp()     #trigger every time apply
 }
}




# ADD RDS creation script only accessbale interanlly si disable public access 
# Remote provisioner server also should create insame vpc 
# enable secrets fro secret manager and call secrets into RDS for this process vpc endpoint is require or nat gateway is required to access secrets to rds internall as secremanger is not in side VPC sefrvice 