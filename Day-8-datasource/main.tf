data "aws_subnet" "name" {
  filter {
    name = "tag:Name"
    values = ["dev"]    # insert the values here
  }
}

data "aws_ami" "amzonlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


# data "aws_ami" "amazonlinuxselfami" {
#  most_recent = true
#  owners = [ "self" ]
#  filter {
#    name = "name"
#    values = [ "self-ami" ]
#  }
#}                 { create own ami and call in innstance creationn by data bloc }

resource "aws_instance" "name" {
  ami = data.aws_ami.amzonlinux.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.name.id 
  tags = {
    Name = "server launched byy ami"
  }
}


#  By using data block we can call any eisting resourse inside aws environmet 