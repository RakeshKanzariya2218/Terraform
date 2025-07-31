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