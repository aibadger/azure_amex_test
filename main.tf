terraform {
  cloud {
    organization = "Badger"

    workspaces {
      name = "amex-azure-test"
    }
  }
}

variable "client_certificate_path" {

    default = "./certificate.pfx"
}
variable "client_certificate_password" {
     type = string
     sensitive = true
#     default = "Azure@1234"
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id             = "01b24509-e0a1-4448-87ad-03933757a88e"
  client_id                   = "9f3494fc-5e49-4c90-a7f1-79ad02a01f31"
  client_certificate_path     = var.client_certificate_path
  client_certificate_password = var.client_certificate_password
  tenant_id                   = "0e3e2e88-8caf-41ca-b4da-e3b33b6c52ec"
}

resource "azurerm_resource_group" "example" {
  name     = "susie-test-example-amex-3"
  location = "Central US"
}
