resource "aws_iam_role" "iam" {
  name = var.iam_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.

  assume_role_policy = var.assume_role_policy

  tags = {
    Name = var.role_tags
  }
}
##### ====>  If you're attaching an AWS managed policy (like AdministratorAccess):  Then you don't need to create aws_iam_policy at all. Just use aws_iam_role_policy_attachment (or aws_iam_policy_attachment for multiple roles).
# resource "aws_iam_policy" "role_policy" {
#   description = "this is the policy of the iam role"
#   name = var.role_policy_name
#   policy = var.policy_arn
# }

# resource "aws_iam_policy_attachment" "name" {
#   name =  var.policy_attachment_name
#   roles = [ aws_iam_role.iam ]
#   policy_arn =  var.policy_arn
# }

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.iam.name
  policy_arn = var.policy_arn  # e.g. "arn:aws:iam::aws:policy/AdministratorAccess"
}