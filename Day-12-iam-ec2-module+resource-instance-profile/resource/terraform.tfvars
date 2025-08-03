ami = "ami-0150ccaf51ab55a51"
instance_tags = "terraform"
instance_type = "t2.micro"
key_name = "key-1"


role_name = "ec2_admin"
role_tags = "ec-admin access"
policy_attachment_name = "policy"
policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  }
iam_instance_profile_name = "ec2-instance-profile-name"
