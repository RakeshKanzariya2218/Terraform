resource "aws_security_group" "sg" {
  name = "multi port sg"
  description = "multi port enable from one  comman cidr block"

  ingress = [
    for port in [ 22, 80, 3000, 443, 8080, 8081, 8082 ] : {
        description       = "inbound rules"
        from_port         = port
        to_port           = port
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
        ipv6_cidr_blocks  = []
        prefix_list_ids   = []
        security_groups   = []
        self              = false
    }
  ]

   egress { 
    from_port      = 0
    to_port        = 0
    protocol       = "-1"
    cidr_blocks    = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Multiport SG"
  }
  }




 