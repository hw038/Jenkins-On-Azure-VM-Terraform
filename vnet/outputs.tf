output "name" {
    description = "virtual network name 전달"

    value = azurerm_virtual_network.tfmodule.name
}

output "subnet_id" {
    description = "생성된 모든 subnet 정보를 name: id 형태로 전달"

    value = {
        for subnet in azurerm_subnet.tfmodule:
        subnet.name => subnet.id
    }
}