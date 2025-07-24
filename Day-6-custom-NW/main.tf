resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Vpc-1"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "subnet-1"
  }
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"

}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "subnet-2"
     }
   availability_zone = "us-east-1b"
   cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "IG-Vpc 1"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.name.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Route Table- Vpc-1"
  }
}

resource "aws_route_table_association" "public-subnet" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public.id 
}

resource "aws_security_group" "SG-Vpc-1" {
  name = "SG- Vpc-1"
  tags = {
    Name = "Security group"
  }
  description = "Allow inbound and outbound rules"
  vpc_id = aws_vpc.name.id
  
  ingress {
    description = "Allow ssh and all trafic"
    protocol = "TCP"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ssh and all trafic"
    protocol = "TCP"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ssh and all trafic"
    protocol = "TCP"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  #for all protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "public" {
  tags = {
    Name = "Terraform-1"
  }
  ami = "ami-0cbbe2c6a1bb2ad63"
  key_name = "key-1"
  vpc_security_group_ids = [ aws_security_group.SG-Vpc-1.id ]
  subnet_id = aws_subnet.public.id
  instance_type = "t2.micro"
  associate_public_ip_address = true  # For auto assign public ip

}

resource "aws_instance" "private" {
  ami = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  key_name = "key-1"
  tags = {
    Name = "Terraform-2"
  }
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [ aws_security_group.SG-Vpc-1.id ]
  
}

resource "aws_eip" "nat_ip" {
  domain = "vpc"   # vpc = true   ; it is old syntax before v5 and domain = "vpc" is new syantax for above v5.
  tags = {
    Name = "Nat elastic ip"
  }
}

resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "nat gateway"
  }
  depends_on = [ aws_internet_gateway.gw ]   #first create ig and than create nat gateway
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name.id
  }
}

resource "aws_route_table_association" "private-subnet" {
  subnet_id = aws_subnet.private.id 
  route_table_id = aws_route_table.private.id
}