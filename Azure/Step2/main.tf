# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a virtual network
resource "azurerm_virtual_network" "cox_net" {
  name                = var.azurerm_virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = "Central US"
  resource_group_name = "1-8406297c-playground-sandbox"
  tags = {
    Environment = "CoxDev"
    Team        = "AK"
  }
}

resource "azurerm_subnet" "cox_subnet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = "1-8406297c-playground-sandbox"
  virtual_network_name = azurerm_virtual_network.cox_net.name
  address_prefixes     = ["10.0.1.0/24"]



}