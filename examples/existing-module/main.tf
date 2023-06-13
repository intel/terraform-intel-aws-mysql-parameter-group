# Provision Intel Optimized AWS MySQL server

module "aws-mysql-parameter-group" {
  source = "github.com/OTCShare2/terraform-intel-aws-mysql-parameter-group.git" #to be updated for testing use this use github.com/otcshare2/parameters module..
}

# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = "testmysqlrds"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.m6i.large"
  username             = "admin25"
  password             = "var.db_password"
  parameter_group_name = module.aws-mysql-parameter-group.db_parameter_group_name
  skip_final_snapshot  = true
}
