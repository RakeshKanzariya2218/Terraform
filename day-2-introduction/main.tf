resource "aws_instance" "name" {
  instance_type = "t2.micro"
  key_name = "key-1"
  ami = "ami-0150ccaf51ab55a51"
  tags = {
    Name = "terraform"
  }
  }