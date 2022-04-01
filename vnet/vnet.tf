resource "azurerm_virtual_network" "tfmodule" {  
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "tfmodule" {
  depends_on            = [azurerm_virtual_network.tfmodule]
  count                 = length(var.subnets)
 
  resource_group_name   = azurerm_virtual_network.tfmodule.resource_group_name
  virtual_network_name  = azurerm_virtual_network.tfmodule.name
  name                  = var.subnets[count.index][0]
  address_prefix      = var.subnets[count.index][1]
}