variable "sql_admin_password" {
  description = "The password for the SQL Server admin account, passed from GitHub Secrets."
  type        = string
  sensitive   = true
}

variable "my_home_ip" {
  description = "My home IP address, passed from GitHub Secrets, so I can access the Azure SQL Database from home."
  type        = string
  sensitive   = true
}