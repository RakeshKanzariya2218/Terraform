resource "aws_s3_bucket" "name" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "name" {
  bucket = aws_s3_bucket.name.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "name" {
  depends_on = [aws_s3_bucket_ownership_controls.name]

  bucket = aws_s3_bucket.name.id
  acl    = var.acl
}