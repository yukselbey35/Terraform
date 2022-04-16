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

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "tc-subnet" {
  name                 = "tc-subnet"
  resource_group_name  = azurerm_resource_group.tc-rg.name
  virtual_network_name = azurerm_virtual_network.tc-vn.name
  address_prefixes     = ["10.0.1.0/24"]

}
resource "azurerm_network_security_group" "tc-sg" {
  name                = "tc-sg"
  location            = azurerm_resource_group.tc-rg.location
  resource_group_name = azurerm_resource_group.tc-rg.name

  security_rule {
    name                       = "tc-dev-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet_network_security_group_association" "tc-sga" {
  subnet_id                 = azurerm_subnet.tc-subnet.id
  network_security_group_id = azurerm_network_security_group.tc-sg.id
}

resource "azurerm_public_ip" "tc-ip" {
  name                = "tc-ip"
  resource_group_name = azurerm_resource_group.tc-rg.name
  location            = azurerm_resource_group.tc-rg.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface" "tc-nic" {
  name                = "tc-nic"
  location            = azurerm_resource_group.tc-rg.location
  resource_group_name = azurerm_resource_group.tc-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tc-ip.id
  }
  tags = {
    environment = "dev"
  }
}

resource "azurerm_linux_virtual_machine" "tc-vm" {
  name                = "tc-vm"
  resource_group_name = azurerm_resource_group.tc-rg.name
  location            = azurerm_resource_group.tc-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.tc-nic.id,
  ]
  # To SSH the vm => ssh -i ~/.ssh/namekey adminuser@publicip  
  #  To SSH the vm => ssh -i ~/.ssh/tcazurekey adminuser@publicip  
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/tcazurekey.pub")
  }

  #to bootstrap our instance and install the docker engine. 
  #This customdata allow us to have a Linux VM instance deployed
  #with docker ready to go for all of our development needs. 
  custom_data = filebase64("customdata.tpl")

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = "dev"
  }
}
