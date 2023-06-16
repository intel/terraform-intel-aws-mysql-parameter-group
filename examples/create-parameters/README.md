<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-mysql-parameter-group/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2023, Intel Corporation

## AWS RDS MySQL Parameters Group

This module by itself will create the parameters group in RDS that will bring in the Intel Optimizations.  You will use this module in conjunction with your curent AWS RDS MySQL module.    For testing purposes you can utilize this example to create the parameters group to test it out.   

## Usage

main.tf
```hcl
# Provision Intel Optimized AWS MSSQL server
module "aws-mysql-parameter-group" {
  source = "intel/aws-mysql-paramter-group/intel"
}
```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply 
```

## Considerations
