variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either 'dev' or 'prod'."
  }
}

variable "database_sku" {
  description = "Database SKU (Basic or S0)"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "S0"], var.database_sku)
    error_message = "Database SKU must be 'Basic' or 'S0'."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

variable "sql_admin_password" {
  description = "The password for the SQL Server admin account."
  type        = string
  sensitive   = true
}

variable "my_home_ip" {
  description = "My home IP address, passed from GitHub Secrets, so I can access the Azure SQL Database from home."
  type        = string
  sensitive   = true
}