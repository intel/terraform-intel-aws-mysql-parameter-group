variable "db_parameters" {
  type = object({
    mysql = object({
      table_open_cache = optional(object({
        value        = optional(string, "8000")
        apply_method = optional(string, "immediate")
      }))
      table_open_cache_instances = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      max_connections = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "immediate")
      }))
      back_log = optional(object({
        value        = optional(string, "1500")
        apply_method = optional(string, "pending-reboot")
      }))
      default_password_lifetime = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      performance_schema = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      max_prepared_stmt_count = optional(object({
        value        = optional(string, "128000")
        apply_method = optional(string, "immediate")
      }))
      character_set_server = optional(object({
        value        = optional(string, "latin1")
        apply_method = optional(string, "immediate")
      }))
      collation_server = optional(object({
        value        = optional(string, "latin1_swedish_ci")
        apply_method = optional(string, "immediate")
      }))
      transaction_isolation = optional(object({
        value        = optional(string, "REPEATABLE-READ")
        apply_method = optional(string, "immediate")
      }))
      innodb_log_file_size = optional(object({
        value        = optional(string, 1024 * 1024 * 1024)
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_open_files = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_file_per_table = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_buffer_pool_instances = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_buffer_pool_size = optional(object({
        value        = optional(string, "{DBInstanceClassMemory*3/4}")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_log_buffer_size = optional(object({
        value        = optional(string, "67108864")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_thread_concurrency = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_flush_log_at_trx_commit = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_dirty_pages_pct = optional(object({
        value        = optional(string, "90")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_dirty_pages_pct_lwm = optional(object({
        value        = optional(string, "10")
        apply_method = optional(string, "immediate")
      }))
      join_buffer_size = optional(object({
        value        = optional(string, 32 * 1024)
        apply_method = optional(string, "immediate")
      }))
      sort_buffer_size = optional(object({
        value        = optional(string, 32 * 1024)
        apply_method = optional(string, "immediate")
      }))
      innodb_use_native_aio = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_stats_persistent = optional(object({
        value        = optional(string, "ON")
        apply_method = optional(string, "immediate")
      }))
      innodb_spin_wait_delay = optional(object({
        value        = optional(string, "6")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_purge_lag_delay = optional(object({
        value        = optional(string, "300000")
        apply_method = optional(string, "immediate")
      }))
      innodb_max_purge_lag = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_checksum_algorithm = optional(object({
        value        = optional(string, "none")
        apply_method = optional(string, "immediate")
      }))
      innodb_io_capacity = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "immediate")
      }))
      innodb_io_capacity_max = optional(object({
        value        = optional(string, "20000")
        apply_method = optional(string, "immediate")
      }))
      innodb_lru_scan_depth = optional(object({
        value        = optional(string, "9000")
        apply_method = optional(string, "immediate")
      }))
      innodb_change_buffering = optional(object({
        value        = optional(string, "none")
        apply_method = optional(string, "immediate")
      }))
      innodb_page_cleaners = optional(object({
        value        = optional(string, "4")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_undo_log_truncate = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_adaptive_flushing = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "immediate")
      }))
      innodb_flush_neighbors = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
      innodb_read_io_threads = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_write_io_threads = optional(object({
        value        = optional(string, "16")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_purge_threads = optional(object({
        value        = optional(string, "4")
        apply_method = optional(string, "pending-reboot")
      }))
      innodb_adaptive_hash_index = optional(object({
        value        = optional(string, "0")
        apply_method = optional(string, "immediate")
      }))
    })
  })
  default = {
    mysql = {
      back_log                       = {}
      character_set_server           = {}
      collation_server               = {}
      default_password_lifetime      = {}
      innodb_adaptive_flushing       = {}
      innodb_adaptive_hash_index     = {}
      innodb_buffer_pool_instances   = {}
      innodb_buffer_pool_size        = {}
      innodb_change_buffering        = {}
      innodb_checksum_algorithm      = {}
      innodb_file_per_table          = {}
      innodb_flush_log_at_trx_commit = {}
      innodb_flush_neighbors         = {}
      innodb_io_capacity             = {}
      innodb_io_capacity_max         = {}
      innodb_log_buffer_size         = {}
      innodb_log_file_size           = {}
      innodb_lru_scan_depth          = {}
      innodb_max_dirty_pages_pct     = {}
      innodb_max_dirty_pages_pct_lwm = {}
      innodb_max_purge_lag           = {}
      innodb_max_purge_lag_delay     = {}
      innodb_open_files              = {}
      innodb_page_cleaners           = {}
      innodb_purge_threads           = {}
      innodb_read_io_threads         = {}
      innodb_spin_wait_delay         = {}
      innodb_stats_persistent        = {}
      innodb_thread_concurrency      = {}
      innodb_undo_log_truncate       = {}
      innodb_use_native_aio          = {}
      innodb_write_io_threads        = {}
      join_buffer_size               = {}
      max_connections                = {}
      max_prepared_stmt_count        = {}
      performance_schema             = {}
      sort_buffer_size               = {}
      table_open_cache               = {}
      table_open_cache_instances     = {}
      transaction_isolation          = {}
    }
  }
  description = "Intel Cloud optimizations for Xeon processors"
}
variable "db_engine" {
  description = "Database engine version for AWS database instance."
  type        = string
  validation {
    condition     = contains(["mysql", "postgres"], var.db_engine)
    error_message = "The db_engine must be \"mysql\" or \"postgres\"."
  }
  default = "mysql"
}

variable "db_parameter_group_name" {
  description = "Name for the RDS database parameter group."
  type        = string
  default     = "mysql"
}

variable "db_parameter_group_family" {
  description = "Family identifier for the RDS database parameter group."
  type        = string
  default     = "mysql8.0"
}

variable "db_user_parameters" {
  type        = map(any)
  description = <<DESC
  "Customer provided db parameters. These should adhere to a similar structure as the above map.
  db_user_parameters = {
    db_param_user = {
      "apply_method" = "immediate"
      "value" = "1"
    }
    other_db_param = {
      apply_method = "immediate"
      value = "3.50"
    }
  DESC
  default     = {}
}
