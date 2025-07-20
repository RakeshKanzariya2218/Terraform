terraform {

  backend "s3" {
    bucket = "rkanzariya.info"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt      = true  
    use_lockfile = true 
  }
}



/*

terraform {  
# required_versiion = "<=1.10"   # this will allow to work same terraform version only.
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

----------------------------------------------------------------------

the old using dynamodb lock file for enablleing the statelocking :

terraform { 
# required_versiion = "<=1.10"   # this will allow to work same terraform version only.
  backend "s3" {  
    bucket       = "your-terraform-state-bucket"  
    key          = "path/to/your/statefile.tfstate"  
    region       = "us-east-1"  
    dynamodb_table = "nareshit"   # dyanamodb locking 
    encrypt      = true  
   
  }   
}

in the dynamodb locking configuration innside aws create a dyanmodb table (nareshit) and give partition key ( lockID ) and done than backend.tf inside 
done abovee changes and done . statelocking is enable.

*/





















