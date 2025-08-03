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

default = [ {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_block = [ "0.0.0.0/0" ]
} ,
{
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_block = [ "0.0.0.0/0" ] 
},
{
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_block = [ "10.0.0.0/24" ]
},
{
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_block = [ "192.168.0.0/24" ]
}
]
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

  default = [ {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = [ "0.0.0.0/0" ]
  } 
  ]
}