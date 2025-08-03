variable "role_name" {
  type = string
  default = ""
}

variable "assume_role_policy" {
  type = any
  default = null
}

variable "role_tags" {
  type = string
  default = ""
}

variable "policy_attachment_name" {
  type = string
  default = ""
}

variable "policy_arn" {
  type = string
  default = ""
}