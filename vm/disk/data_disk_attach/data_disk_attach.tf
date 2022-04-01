resource "azurerm_virtual_machine_data_disk_attachment" "tfmodule" {
    count                       = length(var.disks)
    virtual_machine_id          = lookup(var.vm_id, var.disks[count.index][0],"")
    lun                         = var.disks[count.index][1]
    managed_disk_id             = lookup(var.data_disk_id, var.disks[count.index][2],"")
    caching                     = var.disks[count.index][3]
}