resource "azurerm_public_ip" "tfmodule" {
    count                       = length(var.public_ips)
    location                    = var.location
    resource_group_name         = var.resource_group_name    
    name                        = var.public_ips[count.index][0]
    sku                         = var.public_ips[count.index][1] == "S" ? "Standard" : "Basic"
    allocation_method           = var.public_ips[count.index][2] == "D" ? "Dynamic" : "Static"
    domain_name_label           = var.public_ips[count.index][0]
}