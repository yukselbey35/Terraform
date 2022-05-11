# Get VPC name, subnet name as outputs 
output "azurerm_virtual_network_name" {
    value = azurerm_virtual_network.cox_net.name
}

output "azurerm_subnet_name" {
    value = azurerm_subnet.cox_subnet.name
}