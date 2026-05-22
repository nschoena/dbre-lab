# main.tf - Production environment configuration
# This file defines the infrastructure for the production environment using the azure-sql-database module.

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

provider "azurerm" {
  features {}  
}

module "azure_sql_database" {
  source = "../../modules/azure-sql-database"
  environment = "prod"
  location = "Central US"
  database_sku = "S0"

  # Define your specific Dev tags here
  tags = {
    Environment = "prod"
    Owner       = "Nathan"
    Project     = "DBRE-Lab-Prod"
    ManagedBy   = "Terraform"
  }
}   

output "resource_group_name" {
  value = module.azure_sql_database.resource_group_name
}

output "my_ip_address" {
  value = module.azure_sql_database.my_ip_address
}

output "sql_server_name" {
  value = module.azure_sql_database.sql_server_name
}

output "sql_database_name" {
  value = module.azure_sql_database.sql_database_name
}