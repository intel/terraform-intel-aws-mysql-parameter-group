<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-mysql-parameter-group/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform

© Copyright 2024, Intel Corporation

## AWS RDS MySQL module

Configuration in this directory creates an Amazon RDS instance parameter group for MySQL. This module is leveraged in a pre-existing Amazon RDS MySQL module. This module exposes the Optimizations by Intel for MySQL.

## Usage

**See example folder for creating the AWS RDS Paremeter group.**

In order to utilize add the following lines to your current module above the rds_resource group. 

main.tf

```hcl
module "aws-mysql-parameter-group" {
  source   = "intel/terraform-intel-aws-mysql-parameter-group/intel" 
  }
```

Within the main.tf aws_db_instance resource block, edit the parameter_group_name to use the "module.aws-mysql-parameter-group.db_parameter_group_name"

```hcl
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

## Considerations

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.31 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.31 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_parameter_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [random_id.rid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Database engine version for AWS database instance. | `string` | `"mysql"` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | Family identifier for the RDS database parameter group. | `string` | `"mysql8.0"` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Name for the RDS database parameter group. | `string` | `"mysql"` | no |
| <a name="input_db_parameters"></a> [db\_parameters](#input\_db\_parameters) | Intel Cloud optimizations for Xeon processors | <pre>object({<br/>    mysql = object({<br/>      table_open_cache = optional(object({<br/>        value        = optional(string, "8000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      table_open_cache_instances = optional(object({<br/>        value        = optional(string, "16")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      max_connections = optional(object({<br/>        value        = optional(string, "4000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      back_log = optional(object({<br/>        value        = optional(string, "1500")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      default_password_lifetime = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      performance_schema = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      max_prepared_stmt_count = optional(object({<br/>        value        = optional(string, "128000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      character_set_server = optional(object({<br/>        value        = optional(string, "latin1")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      collation_server = optional(object({<br/>        value        = optional(string, "latin1_swedish_ci")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      transaction_isolation = optional(object({<br/>        value        = optional(string, "REPEATABLE-READ")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_log_file_size = optional(object({<br/>        value        = optional(string, 1024 * 1024 * 1024)<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_open_files = optional(object({<br/>        value        = optional(string, "4000")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_file_per_table = optional(object({<br/>        value        = optional(string, "1")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_buffer_pool_instances = optional(object({<br/>        value        = optional(string, "16")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_buffer_pool_size = optional(object({<br/>        value        = optional(string, "{DBInstanceClassMemory*3/4}")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_log_buffer_size = optional(object({<br/>        value        = optional(string, "67108864")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_thread_concurrency = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_flush_log_at_trx_commit = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_max_dirty_pages_pct = optional(object({<br/>        value        = optional(string, "90")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_max_dirty_pages_pct_lwm = optional(object({<br/>        value        = optional(string, "10")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      join_buffer_size = optional(object({<br/>        value        = optional(string, 32 * 1024)<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      sort_buffer_size = optional(object({<br/>        value        = optional(string, 32 * 1024)<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_use_native_aio = optional(object({<br/>        value        = optional(string, "1")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_stats_persistent = optional(object({<br/>        value        = optional(string, "ON")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_spin_wait_delay = optional(object({<br/>        value        = optional(string, "6")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_max_purge_lag_delay = optional(object({<br/>        value        = optional(string, "300000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_max_purge_lag = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_checksum_algorithm = optional(object({<br/>        value        = optional(string, "none")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_io_capacity = optional(object({<br/>        value        = optional(string, "4000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_io_capacity_max = optional(object({<br/>        value        = optional(string, "20000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_lru_scan_depth = optional(object({<br/>        value        = optional(string, "9000")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_change_buffering = optional(object({<br/>        value        = optional(string, "none")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_page_cleaners = optional(object({<br/>        value        = optional(string, "4")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_undo_log_truncate = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_adaptive_flushing = optional(object({<br/>        value        = optional(string, "1")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_flush_neighbors = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>      innodb_read_io_threads = optional(object({<br/>        value        = optional(string, "16")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_write_io_threads = optional(object({<br/>        value        = optional(string, "16")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_purge_threads = optional(object({<br/>        value        = optional(string, "4")<br/>        apply_method = optional(string, "pending-reboot")<br/>      }))<br/>      innodb_adaptive_hash_index = optional(object({<br/>        value        = optional(string, "0")<br/>        apply_method = optional(string, "immediate")<br/>      }))<br/>    })<br/>  })</pre> | <pre>{<br/>  "mysql": {<br/>    "back_log": {},<br/>    "character_set_server": {},<br/>    "collation_server": {},<br/>    "default_password_lifetime": {},<br/>    "innodb_adaptive_flushing": {},<br/>    "innodb_adaptive_hash_index": {},<br/>    "innodb_buffer_pool_instances": {},<br/>    "innodb_buffer_pool_size": {},<br/>    "innodb_change_buffering": {},<br/>    "innodb_checksum_algorithm": {},<br/>    "innodb_file_per_table": {},<br/>    "innodb_flush_log_at_trx_commit": {},<br/>    "innodb_flush_neighbors": {},<br/>    "innodb_io_capacity": {},<br/>    "innodb_io_capacity_max": {},<br/>    "innodb_log_buffer_size": {},<br/>    "innodb_log_file_size": {},<br/>    "innodb_lru_scan_depth": {},<br/>    "innodb_max_dirty_pages_pct": {},<br/>    "innodb_max_dirty_pages_pct_lwm": {},<br/>    "innodb_max_purge_lag": {},<br/>    "innodb_max_purge_lag_delay": {},<br/>    "innodb_open_files": {},<br/>    "innodb_page_cleaners": {},<br/>    "innodb_purge_threads": {},<br/>    "innodb_read_io_threads": {},<br/>    "innodb_spin_wait_delay": {},<br/>    "innodb_stats_persistent": {},<br/>    "innodb_thread_concurrency": {},<br/>    "innodb_undo_log_truncate": {},<br/>    "innodb_use_native_aio": {},<br/>    "innodb_write_io_threads": {},<br/>    "join_buffer_size": {},<br/>    "max_connections": {},<br/>    "max_prepared_stmt_count": {},<br/>    "performance_schema": {},<br/>    "sort_buffer_size": {},<br/>    "table_open_cache": {},<br/>    "table_open_cache_instances": {},<br/>    "transaction_isolation": {}<br/>  }<br/>}</pre> | no |
| <a name="input_db_user_parameters"></a> [db\_user\_parameters](#input\_db\_user\_parameters) | "Customer provided db parameters. These should adhere to a similar structure as the above map.<br/>  db\_user\_parameters = {<br/>    db\_param\_user = {<br/>      "apply\_method" = "immediate"<br/>      "value" = "1"<br/>    }<br/>    other\_db\_param = {<br/>      apply\_method = "immediate"<br/>      value = "3.50"<br/>    } | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_parameter_group_name"></a> [db\_parameter\_group\_name](#output\_db\_parameter\_group\_name) | Parameter group that was created |
<!-- END_TF_DOCS -->