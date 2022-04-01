locals {
  set_id = [
    for s in var.nsg_subnet_set: [
      lookup(var.subnet_id, s[0], ""), lookup(var.nsg_id, s[1], "")   
    ]
  ]
}

resource "azurerm_subnet_network_security_group_association" "tfmodule" {
  count                     = length(local.set_id)
  subnet_id                 = local.set_id[count.index][0]
  network_security_group_id = local.set_id[count.index][1]
}