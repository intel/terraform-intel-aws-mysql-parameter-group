# Provision Intel Optimized AWS MySQL server


module "aws-mysql-parameter-group" {
  source            = "github.com/kalenarndt/terraform-intel-aws-db-parameters.git"  #to be updated for testing use this use github.com/otcshare2/parameters module..
  }

# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables

module "optimized-mysql-server" {
  source         = "intel/aws-mysql/intel"
  db_password    = var.db_password
  rds_identifier = "<NAME-FOR-RDS-INSTANCE>"
  vpc_id = "<YOUR-VPC-ID-HERE>"
  parameter_group_name = "module.db_parameter_group_name"
}