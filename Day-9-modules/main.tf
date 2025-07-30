resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = var.tags
  }
}

resource "aws_s3_bucket" "name" {
  bucket =  "thisistheaeds3bucekfwrjsbfkfufdbjdufdfuhdjfhdjhfjdfdjf"
}



# now main.tf is complete template file which is call different places as a sourse 
# inside main.tf and variable.tf no any hardcoded values is there so it both are template
#day-9 is sourse template fpr manny request. 