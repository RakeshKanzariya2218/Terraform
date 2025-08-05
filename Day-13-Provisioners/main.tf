resource "aws_key_pair" "name" {
  key_name = "key-terraform"
  public_key = file("~/.ssh/id_ed25519.pub")  
}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-1"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_security_group" "name" {
  name = "sg"
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "sg-1"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "ig"
  }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id 
  }
}


resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.name.id
  route_table_id = aws_route_table.name.id
}

resource "aws_instance" "name" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = aws_key_pair.name.key_name
  vpc_security_group_ids = [ aws_security_group.name.id ]
  subnet_id = aws_subnet.name.id
  associate_public_ip_address = true
  tags = {
    Name = "provisioner server"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    timeout = "2m"
    private_key = file("~/.ssh/id_ed25519")
  }
   
   # file provisioner
   provisioner "file" {                 # copy file from local and paste inthe remote environmet .
     source = "file-1"
     destination = "/home/ec2-user/file-1"
   }

#  this remote , local ,and file provisioner inside any changes dpone that changes is not tracked by the terraform so that peovisioner write or keep inside the null resorce.

# remote execution 

  # provisioner "remote-exec" {
  #   inline = [
  #     "touch /home/ec2-user/file200",
  #     "echo 'hello from awsss' >> /home/ec2-user/file200"
  #   ]
  # }

  # local execution

  #    provisioner "local-exec" {
  #    command = "touch file500" 
  #    }
}

resource "null_resource" "name" {
  provisioner "remote-exec" {
    connection {
     host = aws_instance.name.public_ip
     user = "ec2-user"
     private_key = file("~/.ssh/id_ed25519")
    }
    inline = [ 
      "echo 'hello from awsdevops' >> /home/ec2-user/file200"
     ]
  }
  triggers = {
     always_run = "${timestamp()}"             # Forces rerun every time
  }
}


# any process you keep in null resource that process is tracked by tterrafom and any time run apply than check terraforn to null resource script and thaen apply 
#Solution-2 to Re-Run the Provisioner
#Use terraform taint to manually mark the resource for recreation:
# terraform taint aws_instance.server
# terraform apply