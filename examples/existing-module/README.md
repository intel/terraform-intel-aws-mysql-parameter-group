<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-mysql-parameter-group/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## AWS RDS MySQL Parameters Group

This example module will create a MySQL RDS instance with the parameters group in RDS that will bring in the Intel Optimizations.  


## Usage
main.tf

```hcl

# Provision Intel Optimized AWS MySQL server

module "aws-mysql-parameter-group" {
  source           = "intel/terraform-intel-aws-mysql-parameter-group/intel"  #to be updated for testing use this use github.com/otcshare2/parameters module..
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
```


Run Terraform

```hcl
export TF_VAR_db_password ='<USE_A_STRONG_PASSWORD>'

terraform init  
terraform plan
terraform apply 
```

## Considerations
