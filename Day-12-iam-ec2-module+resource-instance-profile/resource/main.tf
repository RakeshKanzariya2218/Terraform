module "iam" {
  source = "../module-iam"
  role_name = var.role_name
  role_tags = var.role_tags
  policy_attachment_name = var.policy_attachment_name
  policy_arn = var.policy_arn
  assume_role_policy = jsonencode(var.assume_role_policy)
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.iam_instance_profile_name
  role = module.iam.role_name
}

/*  Here the "module.iam" refers 
module "iam" {
  source = "../../modules/iam"
  ...
}

And "role_name" is  declared in the output block so it is mandatory mention here
*/

resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
Name = var.instance_tags
  }
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}