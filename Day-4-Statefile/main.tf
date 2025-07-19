resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = var.tags
    count = 3
  }
}



/*    1.if delete statefile manually than 
         -innside aws resource are unsysnc with terraform 
         -gain run the terraform apply than again create all resource socond time so statefile is very important
      
      2. if done chnages manually in remote(aws) than 
         run terraform apply so priority will given to the desired state than apply changes only desired state.
      
      3. if manually chages in statefile than 
         -nothing will happen when run terraform plan refresh the statefile and call all data form current state to  statefile 
         -untill doing change in main resource block inside statefile nothing will happen
      
      4. Drift :
         -the manually changes in remote (aws) and run terraform apply in desired state and apply the changes of desired state and destroy the changes which is  done manually in the remote it is a drift.  */