locals {
  set_id = [
    for s in var.nics: [
      lookup(var.subnet_id, s[1], ""), lookup(var.pip_id, s[4], "")
    ]
  ]
}

resource "azurerm_network_interface" "tfmodule" {
    count                       = length(var.nics)
    location                    = var.location
    resource_group_name         = var.resource_group_name    
    name                        = var.nics[count.index][0]
    ip_configuration {
        name                            = "ipconfig1"
        subnet_id                       = local.set_id[count.index][0]
        private_ip_address_allocation   = var.nics[count.index][2] == "D" ? "Dynamic" : "Static"
        private_ip_address              = var.nics[count.index][3]
        public_ip_address_id            = local.set_id[count.index][1]
    }
    enable_accelerated_networking = var.nics[count.index][5]
}