variable "ami_id" {
  description = "inserting the ami id"
  type = string
  default = ""
}
variable "instance_type" {
  description = "inserting the instance type"
  type = string
  default = ""
}

variable "key_name" {
  description = "inserting the key name"
  type = string
  default = ""
}

variable "tags" {
  description = "inserting the tags"
  type = string
  default = ""
}
 
 variable "s3_bucket" {
  description = "inserting the bucket name"
  type = string
  default = ""
}


