variable "ami" {
  description = "inserting the ami"
  type = string
  default = ""
}

variable "instance_type" {
  description = "instance teype"
  type = string
  default = ""
}

variable "key_name" {
  description = "key-1"
  type = string
  default = ""
}

variable "tags" {
  description = "this is the tags"
  type = string
  default = ""
}

variable "s3_bucket" {
  description = "bucket name"
  type = string
  default = ""
}