variable "iam_role_name" {
  type = string
  default = ""
}

variable "assume_role_policy" {
  type = string
  default = ""
}

# default = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action    = "sts:AssumeRole"
#         Effect    = "Allow"
#         Sid       = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })

variable "role_tags" {
  type = string
  default = ""
}

# variable "role_policy_name" {
#   type = string
#   default = ""
# }

# variable "policy_arn" {
#   type = string
#   default = ""
# }

# variable "policy_attachment_name" {
#   type = string
#   default = ""
# }

variable "policy_arn" {
  type        = string
  description = "ARN of the managed IAM policy to attach"
  default     = ""
}

###################################################################################################

# If two or more roles are attached with the same polict attachment  than using this type of variables.

# variable "attachment_roles" {
#   description = "List of IAM role names to attach policy"
#   type        = list(string)
#   default     = []
# }

#  And it is using in main.tf like this 

# resource "aws_iam_policy_attachment" "attachment" {
#   name       = var.attachment_name
#   roles      = var.attachment_roles != [] ? var.attachment_roles : [aws_iam_role.iam.name]
#   policy_arn = var.policy_arn
# }