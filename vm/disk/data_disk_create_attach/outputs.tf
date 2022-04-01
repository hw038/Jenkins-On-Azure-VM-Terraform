output "id" {
    description = "생성된 모든 managed disk 정보를 name: id 형태로 전달"

    value = {
        for disk in azurerm_managed_disk.tfmodule:
        disk.name => disk.id
    }
}