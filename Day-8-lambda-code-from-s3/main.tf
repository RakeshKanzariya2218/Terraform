resource "aws_iam_role" "lambda_s3" {
  name = "lambda-s3-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambdaadmin" {
  role = aws_iam_role.lambda_s3.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

data "aws_s3_object" "name" {
  bucket = "lambdas3rolevscodeforms3bucket"
  key = "lambda_function.zip"    #object path
}



resource "aws_lambda_function" "my_lambda_function" {
  function_name    = "lambda-functio-2"
  role             = aws_iam_role.lambda_s3.arn
  handler          = "lambda_function.lambda_handler"
  runtime = "python3.12"
  timeout = 900

   s3_bucket = data.aws_s3_object.name.bucket         # before this bucket already exist and after call object (code) from s3 bucket
   s3_key = data.aws_s3_object.name.key

   source_code_hash = base64sha256(data.aws_s3_object.name.etag)

}