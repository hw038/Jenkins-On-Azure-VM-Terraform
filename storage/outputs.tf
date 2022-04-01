output "id" {  
    description = "생성된 모든 storage_account 정보를 name: id 형태로 전달"

    value = {
        for storage in azurerm_storage_account.tfmodule:
        storage.name => storage.id
    }
}

output "fspw" {  
    value = azurerm_storage_account.tfmodule[0].primary_access_key
}


output "storagename" {  
    value = azurerm_storage_account.tfmodule[0].name
}

output "filesharename" {  
    value = azurerm_storage_share.tfmodule[0].name
}