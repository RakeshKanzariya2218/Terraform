variable "vpc_cidr" {
  type = string
  default = ""
}

variable "vpc_tags" {
   type = string
  default = ""
}
variable "subnet_cidr" {
   type = string
  default = ""
}

variable "availability_zone" {
   type = string
  default = ""
}

variable "ami" {
   type = string
  default = ""
}

variable "instance_type" {
   type = string
  default = ""
}

variable "key_name" {
   type = string
  default = ""
}

variable "tags" {
   type = string
  default = ""
}

variable "bucket" {
   type = string
  default = ""
}

variable "versioning" {
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
}