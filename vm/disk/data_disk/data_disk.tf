resource "azurerm_managed_disk" "tfmodule" {
    count                       = length(var.disks)
    location                    = var.location
    resource_group_name         = var.resource_group_name    
    name                        = var.disks[count.index][0]
    storage_account_type        = var.disks[count.index][1] == "H" ? "Standard_LRS" : var.disks[count.index][1] == "S" ? "StandardSSD_LRS" : "Premium_LRS"
    disk_size_gb                = var.disks[count.index][2]
    create_option               = "Empty"
}