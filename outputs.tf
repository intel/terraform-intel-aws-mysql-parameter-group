output "db_parameter_group_name" {
  description = "Parameter group that was created"
  value       = aws_db_parameter_group.rds.name
}
