variable "ami_id" {
  description = "inserting the ami id"
  type = string
  default = ""
}

variable "instance_type" {
  description = "inserting the type of instance"
  type = string
  default = "t2.micro"
}
variable "tags" {
  description = "tag of instance"
  type = string
  default = "Terraform-1"
}

variable "instance_tags" {
  type = string
  default = "Terraform-2"
}