resource "azurerm_network_security_group" "tfmodule" {
  count               = length(var.nsg_names)
  name                = var.nsg_names[count.index]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "tfmodule" {
  depends_on                  = [azurerm_network_security_group.tfmodule]
  count                       = length(var.nsg_rules)
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_rules[count.index][0]
  priority                    = var.nsg_rules[count.index][1]
  name                        = var.nsg_rules[count.index][2] 
  destination_port_range      = var.nsg_rules[count.index][3]
  source_address_prefix       = var.nsg_rules[count.index][4]
  protocol                    = var.nsg_rules[count.index][5]
  direction                   = "Inbound"
  access                      = "Allow"    
  source_port_range           = "*"
  destination_address_prefix  = "*"             
}