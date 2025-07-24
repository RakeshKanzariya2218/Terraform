terraform {
  backend "s3" {
    bucket = "rkanzariya.info"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}