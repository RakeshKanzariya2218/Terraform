variable "bucket" {
  type = string
  default = ""
}
variable "acl" {
   type = string
  default = ""
}
variable "control_object_ownership" {
   type = string
  default = ""
}
variable "object_ownership" {
   type = string
  default = ""
}


variable "versioning" {
  type = object({
    enabled    = bool
  })
  default = {
    enabled = true
  }
}
