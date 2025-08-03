resource "aws_iam_role" "iam" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = var.assume_role_policy

  tags = {
    Name = var.role_tags
  }
}
resource "aws_iam_policy_attachment" "name" {
  name = var.policy_attachment_name
  roles = [ aws_iam_role.iam.name ]
  policy_arn = var.policy_arn
}