resource "aws_instance" "name" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  tags = {
    Name = "Terraform-1"
  }
  lifecycle {
    create_before_destroy = true
  }
}


#   lifecycle {
#     ignore_changes = [ tags, ]           whatever chages you done in the console and run terraform apply
#                                          than dont update desired state to current state
#   }
#   lifecycle {
#     prevent_destroy = true
#   }                                    this is true than you dont able to destoy resoure until 
#                                         prevent destroy=false.               
