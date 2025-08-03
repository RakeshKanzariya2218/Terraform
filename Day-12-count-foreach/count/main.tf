##########    Example-1-name with count index        ########

resource "aws_instance" "name" {
  instance_type = "t2.micro"
  key_name = "key-1"
  ami = "ami-0150ccaf51ab55a51"
  count = 2
  tags = {
     Name = "count-${count.index}"     #  This is create 2 server with name count.index like count-0,count-1
                                       # count index starts with the "0"
   }

#   tags = {
#     Name = dev
#   }
#  this is create server with same name dev.
   }

#########  Exampke-2 diffrent names #############

# first declare the variable 

variable "diffname" {
  type = list(string)
  default = [ "terraform-1", "count-2" ]
}

resource "aws_instance" "Name" {
   instance_type = "t2.micro"
   key_name = "key-1"
   ami = "ami-0150ccaf51ab55a51"
   count = length(var.diffname)
   tags = {
     Name = var.diffname[count.index]
   }
}

############ Example -3- Iam user  #############
 
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}
resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}




##########  Diff name and instance type creating servers by count.     ###############
# resource "aws_instance" "name" {
#   ami = "ami-0150ccaf51ab55a51"
#   key_name = "key-1"
#   count = length(var.ec2)
#   tags = {
#     Name = var.ec2[count.index]
#   }
#   instance_type = var.type[var.ec2[count.index]]      # This will create servers with type variable declared instance type.
  
# }



# variable "ec2" {
#   description = "diffrent name of all instnace"
#   type = list(string)
#   default = [ "dev", "test", "prod" ]

# }

# variable "type" {
#   description = "diffrent instance have diff instance type"
#   type = map(string)
#   default = {
#     dev = "t2.micro"
#     test = "d2.medium"
#     prod = "t3.medium"

#   }
# }