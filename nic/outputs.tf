output "id" {
    description = "생성된 모든 network interface 정보를 name: id 형태로 전달"

    value = {
        for nic in azurerm_network_interface.tfmodule:
        nic.name => nic.id
    }
}

output "ip_config_name" {
    description = "생성된 모든 ip_config_name 정보를 nic_name: ip config name 형태로 전달"

    value = {
        for nic in azurerm_network_interface.tfmodule:
        nic.name => nic.ip_configuration[0].name
    }
}