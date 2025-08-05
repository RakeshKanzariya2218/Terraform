resource "aws_instance" "name" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  associate_public_ip_address = true
  tags = {
    Name  =  "taint server"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "rkanzariya.info"
}


#
/* Taint 
   Terraform taint means your main.tf inside any resource are there and you marked that resouce as taint then 
   whenevenr you nexter run the apply so that taint resource is delete and recreate and any script is there is execute again so which resource you want to destroy and  recreate theat resource 
   maked as taint by the command 
   terraform taint <resource type >.<resource name >    ==> this resourcce marked as taint resource
   ex :  terraform taint aws_instance.name    (then only the instance will create )
   Taint is only  drawback its alternate optiion is null resource 
*/

