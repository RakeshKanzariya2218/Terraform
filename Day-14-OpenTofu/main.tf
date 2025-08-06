resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-1"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = "110.0.0.0/24"
  tags = {
    Name = "subnet-1"
  }
  availability_zone = "us-east-1a"
}

resource "aws_instance" "name" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  subnet_id = aws_subnet.name.id
  tags = {
    Name = "terraform server"
  }
}