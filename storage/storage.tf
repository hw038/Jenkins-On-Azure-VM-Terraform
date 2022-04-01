resource "azurerm_storage_account" "tfmodule" {
    count                           = length(var.storages)    
    location                        = var.location
    resource_group_name             = var.resource_group_name    
    name                            = var.storages[count.index][0]
    account_tier                    = var.storages[count.index][1] == "P" ? "Premium" : "Standard"
    account_replication_type        = var.storages[count.index][2]
} 


resource "azurerm_storage_share" "tfmodule" {
  count                = length(var.fileshare)
  name                 = var.fileshare[count.index][0]
  storage_account_name = azurerm_storage_account.tfmodule[count.index].name
  quota                = var.fileshare[count.index][1]

#   acl {
#     id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

#     # access_policy {
#     #   permissions = "rwdl"
#     #   start       = "2019-07-02T09:38:21.0000000Z"
#     #   expiry      = "2019-07-02T10:38:21.0000000Z"
#     # }
#   }
}
