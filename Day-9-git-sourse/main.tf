module "github" {
  source = "github.com/RakeshKanzariya2218/terraform-aws-ec2-instance"
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  key_name = "key-1"
}