resource "aws_instance" "ec2" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name = "key-1"
  tags = {
    Name = "Terraform server"
  }
}


# terraform workspace : subcommands
#     delete    Delete a workspace
#     list      List Workspaces
#     new       Create a new workspace
#     select    Select a workspace
#     show      Show the name of the current workspace



# Basically workspace using when two or more wnvironment are thare and mahage multiple 
/*  -Workspaces are lightweight isolated environments for state files, allowing you to use a single 
     Terraform configuration to manage multiple independent deployments (e.g. dev, staging, prod) .
    -Each workspace has its own state file—so resources in one workspace won’t affect others.
    -Terraform automatically provides a default workspace
    -Multi‑environment deployments: Use the same Terraform code to deploy dev, staging, and prod by 
     switching workspaces. Each environment has its isolated state.
    -. Deploying Infrastructure Across Multiple Regions
            Use workspaces to manage global infrastructure deployments per region or compliance 
            zone using the same config.
            E.g., us-east-1, eu-west-1 workspaces keep state distinct while sharing code  
*/
    