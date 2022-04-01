resource "azurerm_availability_set" "tfmodule" {
    count                           = length(var.avset_names)
    location                        = var.location
    resource_group_name             = var.resource_group_name
    name                            = var.avset_names[count.index]    
    platform_fault_domain_count     = var.fd
    platform_update_domain_count    = var.ud
}