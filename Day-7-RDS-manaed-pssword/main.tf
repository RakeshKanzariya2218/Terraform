resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Vpc-1"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "subnet-1"
  }
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"

}

resource "aws_subnet" "subnet-2" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "subnet-2"
    }
    availability_zone = "us-east-1b"
    cidr_block = "10.0.1.0/24"
  
}

resource "aws_db_subnet_group" "group" {
  name = "my-subnet-group"
  subnet_ids = [ aws_subnet.subnet-1.id , aws_subnet.subnet-2.id ]
  tags ={
    Name = "subnet-group"
  }
}


resource "aws_db_instance" "rds-1" {
  allocated_storage = 10                              # Provisions 10 GB EBS storage for the DB—enough for small/dev workloads
  identifier = "database-1"                           # Name tag for the DB instance in AWS, making it easily recognizable
  db_name = "dev"                                     # Auto-creates a database named "dev" inside the MySQL instance
  engine = "mysql"                                    # Sets MySQL as the RDS engine
  engine_version = "8.0"                              # Uses MySQL version 8.0, the latest major supported release
  instance_class = "db.t3.micro"                      # Selects a cost-effective burstable instance type for dev/test
  manage_master_user_password = true                  #  Enables AWS Secrets Manager to auto-generate and securely store the master password :contentReference[oaicite:1]{index=1}
  username = "admin"                                  # Defines the master DB user for initial access; password managed via Secrets Manager
  db_subnet_group_name = aws_db_subnet_group.group.id # Ensures the DB is placed in your VPC’s subnets for proper networking
  parameter_group_name = "default.mysql8.0"           # Applies the default parameter group—customize only if needed
  backup_retention_period = 7                         # # Keeps automated daily backups for 7 days
  
# Enable performance insights
#   performance_insights_enabled          = true
#   performance_insights_retention_period = 7  # Retain insights for 7 days

                         
  backup_window = "02:00-03:00"                       # Schedules backups during off-peak hours (UTC)
  maintenance_window = "sun:04:00-sun:05:00"          # Dedicates a weekly time window for minor engine patching/upgrades
  deletion_protection = true                          # Prevents accidental deletion of the DB through AWS Console or Terraform :contentReference[oaicite:2]{index=2}
  skip_final_snapshot = true                          # Skips creating a final snapshot when destroying the DB—useful for disposable dev environments :contentReference[oaicite:3]{index=3}
  depends_on = [ aws_db_subnet_group.group ]          # Makes Terraform wait for the subnet group before provisioning the DB
}
