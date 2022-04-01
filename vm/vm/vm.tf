locals {
  nic_id = {
    for p1 in var.vms: 
      p1[0] => [ 
        for p2 in p1[1]:
          lookup(var.nic_id, p2, "")
      ]    
  }

  avset_id = {
    for p in var.vms:
      p[0] => lookup(var.avset_id, p[3], "")
  }
  # string_settings = jsonencode({
  #   "commandToExecute" = var.extension
  # })

}

resource "azurerm_virtual_machine" "tfmodule" {
    count                         = length(var.vms)    
    resource_group_name           = var.resource_group_name
    location                      = var.location  
    name                          = var.vms[count.index][0]    
    vm_size                       = var.vms[count.index][2]
    network_interface_ids         = lookup(local.nic_id, var.vms[count.index][0], [])
    availability_set_id           = lookup(local.avset_id, var.vms[count.index][0], [])
    primary_network_interface_id  = lookup(local.nic_id, var.vms[count.index][0], [])[0]
    delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = var.vms[count.index][4][0]
    offer     = var.vms[count.index][4][1]
    sku       = var.vms[count.index][4][2]
    version   = var.vms[count.index][4][3]
  }
  storage_os_disk {
    name              = "${var.vms[count.index][0]}-disk-os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vms[count.index][5][0] == "H" ? "Standard_LRS" : var.vms[count.index][5][0] == "S" ? "StandardSSD_LRS" : "Premium_LRS"
    disk_size_gb      = var.vms[count.index][5][1]
  }
  os_profile {
    computer_name  = var.vms[count.index][0]
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  # boot_diagnostics {
  #   enabled = var.vms[count.index][6] == "" ? false : true
  #   storage_uri = var.vms[count.index][6] == "" ? "" : "https://${var.vms[count.index][6]}.blob.core.windows.net/"
  # }

  tags = {
    var.vms[count.index][7][0] = var.vms[count.index][7][1]
  }
}

# resource "azurerm_virtual_machine_extension" "tfmodule" {
#   count                         = length(var.extension)
#   name                          = var.extension[count.index][0]
#   virtual_machine_id            = azurerm_virtual_machine.tfmodule[count.index].id
#   publisher                     = var.extension[count.index][1]
#   type                          = var.extension[count.index][2]
#   type_handler_version          = var.extension[count.index][3]

#   settings = jsonencode({
#     "commandToExecute" = "${var.extension[count.index][4]}"
#   })
# }