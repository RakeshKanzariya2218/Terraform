variable "ami" {
  description = "inserting the ec2 ami"
  type = string
  default =  "ami-0150ccaf51ab55a51"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key" {
  type = string
  default = "key-1"
}

variable "tags" {
  type = list(string)
  default = [ "dev",  "prod" ]      #[ " dev", "test", "prod" ]
}




resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  for_each = toset(var.tags)
  # count = length(var.tags)             ==> insted of for_each if it is a count then consider a lenght of the variable but now it is a for_each then toset function is used.
  tags = {
    Name = each.value       #  For a set each_value and each_key are both the same 
  }
}

