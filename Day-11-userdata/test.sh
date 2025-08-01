#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>  Terraform userdata block for ec2 instance of aws <h1>" > /var/www/html/index.html
