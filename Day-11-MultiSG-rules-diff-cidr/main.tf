variable "allowed_diff_port" {
  description = "variable map string of diffrent ports"
  type = map(string)
  default = {
    22    = "203.0.113.0/24"    # SSH (Restrict to office IP)
    80    = "0.0.0.0/0"         # HTTP (Public)
    443   = "0.0.0.0/0"         # HTTPS (Public)
    8080  = "10.0.0.0/16"       # Internal App (Restrict to VPC)
    9000  = "192.168.1.0/24"    # SonarQube/Jenkins (Restrict to VPN)
    3389  = "10.0.1.0/24"
  }
}                                               
}                                           


resource "aws_security_group" "sg" {
  name = "terraform sg"
  description = "diff port form diff cidr ip "


  dynamic "ingress" {
    for_each = var.allowed_diff_port
    content {
      description = "inbound rules"
      from_port = ingress.key
      to_port = ingress.key
      protocol = "tcp"
      cidr_blocks = [ingress.value]    #  when using map(list(string)) method [] not applicable in cidr simply : cidr_blocks = ingress.value
    }
  }


  egress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG of diff ports"
  }

  
}

                                            #when one port 22 want to enable diff diff ip or cidr than
                                            # using map(list(string)) and in this method values are giving like this:
                                             # type = map(list(string)) 
                                             # default = { 
                                             #     "22" = ["0.0.0.0/0", "10.0.0.0/24"] 
                                             #     "80" = ["172.162.0.0/24"]
                                             #     "443" = ["192.168.16.0/24"]
                                             #     "8080" = ["0.0.0.0/0"]
                                             #     "8082" = ["34.34.34.0/25"]
                                             #   }
                                             # }