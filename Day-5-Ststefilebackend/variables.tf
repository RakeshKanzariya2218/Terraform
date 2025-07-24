variable "ami" {
  description = "inerting the ami"
  type = string
  default = ""
}
variable "instance_type" {
  description = "select the instance type"
  type = string
  default = ""
}
variable "key_name" {
  description = "the public key of a instance"
  type = string
  default = ""
}
variable "tags" {
  description = "this is the name of server in aws console"
  type = string
  default = ""

}

  
variable "cidr_block" {
  description = "vpc cidr range"
  type = string
  default = ""
}
variable "secondvpc" {
  type = string
  default = "10.1.0.0/16"
}
