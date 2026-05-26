output "resource_group_name" {
  value = azurerm_resource_group.rg_day2_lab.name
}

output "my_ip_address" {
  value = trimspace(data.http.my_ip.response_body)
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.database.name  
}

output "sql_server_fqdn" {
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
  description = "The FQDN of the SQL Server for Ansible connectivity."
}