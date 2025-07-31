output "private_ip" {
  value = module.ec2.private_ip
}

output "bucket_name" {
  value = module.s3.bucket_name
}


#  root module output.tf inside whatever you want to take output that output block should be declared in 
#  child module without child module output block you dont call any output from root module directly.