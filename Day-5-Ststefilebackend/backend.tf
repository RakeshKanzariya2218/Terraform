terraform {
  backend "s3" {
    bucket = "rkanzariya.info"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt      = true  
    use_lockfile = true 
  }
}



/*terraform {  
  backend "s3" {  
    bucket       = "your-terraform-state-bucket"  
    key          = "path/to/your/statefile.tfstate"  
    region       = "us-east-1"  
    encrypt      = true  
    use_lockfile = true  #S3 native locking
  }  
}  

this is the new update by terraform for the supporting s3  bucket to native lock use this configuraton and
enable the statelocking of s3 statefiele.

*/