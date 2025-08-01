resource "aws_instance" "ec2" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  associate_public_ip_address = true
  tags = {
    Name = "Terraform-1"
  }

  user_data = file("test.sh")       #userdata block take script from test.sh file and execute inside the server
}