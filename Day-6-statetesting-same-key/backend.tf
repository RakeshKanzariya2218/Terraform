terraform {

  backend "s3" {
    bucket = "rkanzariya.info"
    #key    = terraform.tfstate"
    key    = "day-6--terraform.tfstate"
    region = "us-east-1"
    encrypt      = true  
    use_lockfile = true 
  }
}