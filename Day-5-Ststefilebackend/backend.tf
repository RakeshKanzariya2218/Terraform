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

/* fir the dynamodb  table statelocking :
terraform {
  backend "s3" {
    bucket = "rkanzariya.info"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt      = true  
    dynamodb_table = <TABLE NAME> 
  }
}

   in this case one dynamodb tabke was created with prtition key = "lockID".
   Dynamo  DB methos support for the >1.10 verson and se native lock support on 1.10> version .
   */