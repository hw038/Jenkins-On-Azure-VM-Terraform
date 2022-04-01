output "info" {
    description = "[ [virtual_machine_id, managed_disk_id ]....]"

    value = [
        for disk in azurerm_virtual_machine_data_disk_attachment.tfmodule:
            [ disk.virtual_machine_id, disk.managed_disk_id ]
    ]
}