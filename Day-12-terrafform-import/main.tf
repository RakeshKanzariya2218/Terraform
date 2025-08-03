resource "aws_instance" "name" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  tags = {
    Name = "import server"
  }
}



#  -Whenever the terraform plan not showing the 0 changes till that insert the required parameter inside the 
#   resource block , when terraform plan showing 0 changes or no changes than ok = terraform import successfully imported resoure.
#  -terrsform.tfstate file is help to find the perameter which are required to insert in the  resource block.