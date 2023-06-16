
locals {

  # Determine the default tuning parameters to use for Xeon processors based on the db_engine input
  db_parameters = { for parameter, value in lookup(var.db_parameters, var.db_engine, {}) : parameter => value if value != null /* object */ }

  # Merges the filtered map above with a user supplied map (if presented)
  db_parameter_merged = merge(local.db_parameters, var.db_user_parameters)

}

# Generates a random identifier to use as a prefix
resource "random_id" "rid" {
  byte_length = 5
}

# Creates a db parameter group
resource "aws_db_parameter_group" "rds" {
  name   = "${var.db_parameter_group_name}-${random_id.rid.dec}-intel-optimized"
  family = var.db_parameter_group_family
  #should there be a tag here as well
  dynamic "parameter" {
    for_each = local.db_parameter_merged
    content {
      name         = parameter.key
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }
  # This configuration will prevent destruction of the deposed parameter group while still in use by the database during upgrade.
  lifecycle {
    create_before_destroy = true #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group#create_before_destroy-lifecycle-configuration
  }
}


