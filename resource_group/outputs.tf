output "id" {
  description = "resource group id 전달"

  value       = azurerm_resource_group.tfmodule.id
}

output "name" {
  description = "resource group name 전달"

  value = azurerm_resource_group.tfmodule.name
}

output "location" {
  description = "resource group location 전달"

  value = azurerm_resource_group.tfmodule.location
}