module "day-9" {
  source = "../Day-9-modules"
  ami_id = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  tags = "terraform-1"
  s3_bucket = "rkanzariya.info"
}