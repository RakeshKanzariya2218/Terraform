# # example -1 of condition # 

variable "create_bucket" {
  description = "base on conditioncreate the bucket"
  type = bool
  default = true           # if it is true than take it is the 1 ,2 ,3 ... , else it is take the 0.
}

resource "aws_s3_bucket" "name" {
  count = var.create_bucket ? 2 : 0    # two buckets are create mainly but this  is bucket so same name not exist .
  bucket = "rkanzariya.info"
  acl = "private"
  tags = {
    Name = "ConditionalBucket"
    Environment = "dev"
  }
}

# # example -2 #

variable "aws_region" {
  type = string
  default = "us-east-1"          # here we need to define either us-east-1 or eu-west-1 if i give other region will get error
  validation {
    condition = var.aws_region == "us-east-1" || var.aws_region == "eu-west-1"    # it means in variable default value is in this two region is valid another values are not valid
                                                                                  # if i give any another region name then bucket is not ctreate 
    error_message = "the variable aws_region must be one of the following region : us-east-1 , us-wast-2 ."
  }
}

provider "aws" {
  region = "us-west-2"             # bucket create in this region
}

resource "aws_s3_bucket" "name" {
  bucket = "rkanzariya.info"
}

# # after run this will get an error like region must be one of the following us-east-1 or eu-weest-2


## example-4  #      

variable "ami" {
  type = string
  default = "ami-0150ccaf51ab55a51"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "key-1"
  count = var.instance_type == "t2.micro" ? 1 : 0           # In this condition if instance type =t2.micro then only the server wiil create .
  tags = {
    Name = "conditional server"
  }
}