provider "aws" {
  
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}

# provider should be source provider version  like day-3 and day-9 provider version should be same. 