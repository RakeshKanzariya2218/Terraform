variable "vpc_1_cidr" {
  type = string
  default = ""
}

variable "vpc_1_tags" {
   type = string
  default = ""
}

variable "subnets" {
description = "multiple subnet create in onne resource block with diff az,name  and cidr "
type = map(object({
   cidr_block        = string
   availability_zone = string
   tags              = string
    }))
    # default = {
    #   subnet-1 = {
    #     cidr_block = "10.0.0.0/24"
    #     availability_zone = "us-east-1a"
    #     tags = "subnet-1"
    #   }
    #    subnet-2 = {
    #     cidr_block = "10.0.1.0/24"
    #     availability_zone = "us-east-1b"
    #     tags = "subnet-2"
    #  }
    # }
}

variable "subnet_group_name" {
  type = string
  default = ""
}

variable "subnet_group_tags" {
   type = string
  default = ""
}

variable "rds_storage" {
  type = number
  default = null 
}

variable "db_name" {
   type = string
  default = ""
}

variable "engine" {
   type = string
  default = ""
}

variable "engine_version" {
   type = string
  default = ""
}

variable "instance_class" {
   type = string
  default = ""
}

variable "username" {
   type = string
  default = ""
}

variable "password" {
   type = string
  default = ""
}

variable "parameter_group_name" {
   type = string
  default = ""
}
variable "skip_final_snapshot" {
  type = bool
  default = null
}

variable "backup_retention_period" {
  type = number
  default = null
}

