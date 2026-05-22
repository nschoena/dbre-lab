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