output "id" {
    description = "생성된 모든 network security group 정보를 name: id 형태로 전달"

    value = {
        for nsg in azurerm_network_security_group.tfmodule:
        nsg.name => nsg.id
    }
}