output "id" {    
    description = "생성된 모든 availability set 정보를 name: id 형태로 전달"

    value = {
        for avset in azurerm_availability_set.tfmodule:
        avset.name => avset.id
    }
}