resource "aws_instance" "name" {
 ami = var.ami_id
 instance_type = var.instance_type
 tags = {
   Name = "Terraform-1"
 }

}
resource "aws_instance" "Name" {
 ami = var.ami_id
 instance_type = var.instance_type
 tags = {
   Name = "Terraform-2"
 }

}

