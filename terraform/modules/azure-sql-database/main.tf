# main.tf - Your first Terraform config
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    random = {
        source  = "hashicorp/random"
        version = ">= 3.0"
    }
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg_day2_lab" {
  name     = "rg-${var.environment}-day2-lab"
  location = var.location
}

resource "azurerm_mssql_server" "sql_server" {
  # append the environment name to keep it unique and compliant with my naming rules
  name                         = "sql-${var.environment}-day2-lab-${random_string.suffix.result}"
  resource_group_name          = azurerm_resource_group.rg_day2_lab.name
  location                     = azurerm_resource_group.rg_day2_lab.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

resource "azurerm_mssql_database" "database" {
  name      = "db-${var.environment}-day2-lab"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.database_sku # Pulls the SKU from the variable defined in variables.tf
  
  # Change 1: Long-term Retention
  # Note: LTR is only supported on certain SKUs, but we can define it here.
  long_term_retention_policy {
    weekly_retention  = "P4W"
    monthly_retention = "P12M"
    yearly_retention  = "P5Y"
    week_of_year      = 1
  }

  # Change 2: Resource Tags
  tags = var.tags
}

# Use ipify for a guaranteed plain-text IP response
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

resource "azurerm_mssql_firewall_rule" "allow_local" {
  name             = "AllowLocalClient"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = data.http.my_ip.response_body
  end_ip_address   = data.http.my_ip.response_body
}