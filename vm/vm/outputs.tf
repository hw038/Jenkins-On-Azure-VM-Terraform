output "id" {
    description = "생성된 모든 VM ID를 name: id 형태로 전달"

    value = {
        for vm in azurerm_virtual_machine.tfmodule:
        vm.name => vm.id
    }
}