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
}

resource "azurerm_resource_group" "tc-rg" {
  name     = "tc-resources"
  location = "East Us"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_network" "tc-vn" {
  name                = "tc-network"
  location            = azurerm_resource_group.tc-rg.location
  resource_group_name = azurerm_resource_group.tc-rg.name
  address_space       = ["10.0.0.0/16"]
  /*  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }
*/
  tags = {
    environment = "dev"
  }
}