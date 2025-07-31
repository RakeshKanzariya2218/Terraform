provider "aws" {
  
}
terraform {
  required_providers {
    aws = {
        source = "hashicrop/aws"
        version = "6.6.0"
    }
  }
}