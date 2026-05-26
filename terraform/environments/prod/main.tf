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
  backend "azurerm" {
  resource_group_name  = "tfstate-rg"
  storage_account_name = "dbrelabtfstate"
  container_name       = "tfstate"
  key                  = "prod.terraform.tfstate"
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
  # Added the sql_admin_password and my_home_ip variable assignments to pass the values from the environment variables defined in variables.tf
  sql_admin_password = var.sql_admin_password
  my_home_ip = var.my_home_ip

  # Define your specific Dev tags here
  tags = {
    Environment = "prod"
    Owner       = "Nathan"
    Project     = "DBRE-Lab-Prod"
    ManagedBy   = "Terraform"
  }
}   
