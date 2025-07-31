resource "aws_s3_bucket" "name" {
  bucket = var.bucket
  
  versioning {
    enabled = var.versioning.enabled
  }
}
