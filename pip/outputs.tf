output "id" {
    description = "생성된 모든 public ip 정보를 name: id 형태로 전달"

    value = {
        for pip in azurerm_public_ip.tfmodule:
        pip.name => pip.id
    }
}