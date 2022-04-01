resource "azurerm_managed_disk" "tfmodule" {
    count                       = length(var.disks)
    location                    = var.location
    resource_group_name         = var.resource_group_name    
    name                        = var.disks[count.index][2]
    storage_account_type        = var.disks[count.index][3] == "H" ? "Standard_LRS" : var.disks[count.index][3] == "S" ? "StandardSSD_LRS" : "Premium_LRS"
    disk_size_gb                = var.disks[count.index][4]
    create_option               = "Empty"
}

resource "azurerm_virtual_machine_data_disk_attachment" "tfmodule" {
    depends_on                  = [azurerm_managed_disk.tfmodule]
    count                       = length(var.disks)
    managed_disk_id             = azurerm_managed_disk.tfmodule[count.index].id
    virtual_machine_id          = lookup(var.vm_id, var.disks[count.index][0],"")
    lun                         = var.disks[count.index][1]
    caching                     = var.disks[count.index][5]
}
