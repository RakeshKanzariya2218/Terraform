resource "aws_instance" "name" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  key_name = "key-1"
  tags = {
    Name = "Target"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "rkanzariya.info"
  versioning {
    enabled = true
  }
}


# terraform plan --target=aws_instance.name
# terraform apply --target=aes_instance.name
# terraform apply -auto-approve --target=aes_instance.name



# By using the terraform target you can target a specific resource if in the main.tf inside multiple resources
# are there but you want to any specific resourse will create then using terraform plan.