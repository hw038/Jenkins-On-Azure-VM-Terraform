resource "azurerm_resource_group" "tfmodule" {
  name = var.name
  location = var.location
}