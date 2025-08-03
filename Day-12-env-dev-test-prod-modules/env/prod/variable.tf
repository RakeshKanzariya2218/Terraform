#  ec2 variables

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

variable "instance_tags" { 
    type =  string
    default = ""
}



# iam role variables 

variable "iam_role_name" {
  type = string
  default = ""
}

variable "assume_role_policy" { 
  type = any
  default = null
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
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# rds variables

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
    default = {}    # {} - for map(object)  type variable.
    }

/*     default = {
      subnet-1 = {
        cidr_block = "10.0.0.0/24"
        availability_zone = "us-east-1a"
        tags = "subnet-1"
      }
       subnet-2 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1b"
        tags = "subnet-2"
     }
    }
    */

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


# s3 variables  

variable "bucket_name" {
  type = string
  default = ""
}

variable "object_ownership" {
  type = string
  default = ""
}

variable "acl" {
  type = string
  default = ""
}

# sg variables 

variable "vpc_2_cidr" {
  
}

variable "vpc_2_tags" {
  
}

variable "security_group_name" {
  
}

variable "security_group_tags" {
  
}


variable "ingress_rules" {
 description = <<EOT

    List of ingress rules. Each rule may include:
      • from_port, to_port   (number)
      • protocol             (string, e.g. "tcp")
      • cidr_blocks          (list(string))
      • source_security_group_ids (optional, list(string))
      • description (optional string)

 EOT

 type = list(object({
   from_port = number
   to_port   = number
   protocol  = string
   cidr_block= list(string)
 }))

 default = []        # [] - for list(object)

# default = [ {
#   from_port = 22
#   to_port = 22
#   protocol = "tcp"
#   cidr_block = [ "0.0.0.0/0" ]
# } ,
# {
#   from_port = 3306
#   to_port = 3306
#   protocol = "tcp"
#   cidr_block = [ "0.0.0.0/0" ] 
# },
# {
#   from_port = 443
#   to_port = 443
#   protocol = "tcp"
#   cidr_block = [ "10.0.0.0/24" ]
# },
# {
#   from_port = 80
#   to_port = 80
#   protocol = "tcp"
#   cidr_block = [ "192.168.0.0/24" ]
# }
# ]
}


variable "egress_rules" {
  description = <<-EOT

    List of egress rules. Each rule may include:
      • from_port, to_port   (number)
      • protocol             (string)
      • cidr_blocks          (list(string))

  EOT

  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_block= list(string)
  }))
  default = [ ]  

  # default = [ {
  #   from_port = 0
  #   to_port = 0
  #   protocol = "-1"
  #   cidr_block = [ "0.0.0.0/0" ]
  # } 
  # ]
}

## vpc variables 

variable "vpc_3_cidr" {
  type = string
  default = ""
}
variable "vpc_3_tags" {
  type = string
  default = ""
}