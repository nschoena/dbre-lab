variable "sql_admin_password" {
  description = "The password for the SQL Server admin account, passed from GitHub Secrets."
  type        = string
  sensitive   = true
}