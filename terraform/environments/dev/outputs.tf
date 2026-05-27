output "resource_group_name" {
  value = module.azure_sql_database.resource_group_name
  description = "The name of the resource group created for the production environment."
}

output "my_ip_address" {
  value = module.azure_sql_database.my_ip_address
  description = "The public IP address of the machine running Terraform, used for SQL Server firewall rules."
}

output "sql_server_name" {
  value = module.azure_sql_database.sql_server_name
  description = "The name of the SQL Server instance created in the production environment."
}

output "dev_sql_database_name" {
  value = module.azure_sql_database.sql_database_name
  description = "The name of the SQL Database created in the production environment."
}

output "dev_sql_server_fqdn" {
  value = module.azure_sql_database.sql_server_fqdn  
  description = "The FQDN of the SQL Server for Ansible connectivity."
}