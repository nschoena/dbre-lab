# main.tf - Developer environment configuration
# This file defines the infrastructure for the developer environment using the azure-sql-database module.

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
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "dbrelabtfstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}  
}

module "azure_sql_database" {
  source       = "../../modules/azure-sql-database"
  environment  = "dev"
  location     = "Central US"
  database_sku = "Basic"
  sql_admin_password = var.sql_admin_password

  # Define your specific Dev tags here
  tags = {
    Environment = "dev"
    Owner       = "Nathan"
    Project     = "DBRE-Lab-Dev"
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