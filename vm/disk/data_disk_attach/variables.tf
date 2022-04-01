variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "disks" {default = [[]]}
variable "data_disk_id" { default = "" }
variable "vm_id" { default = "" }

# resource_group_name = module.resource_group.name                          # respurce group name
# location = module.resource_group.location                                 # location
# disks=[                                                                   # disks : disk list (2-D array)
#    ["vm-test-01", 0, "vm-test-01-disk-data-1", "ReadWrite"],              # [
#    ["vm-test-02", 0, "vm-test-02-disk-data-1", "ReadWrite"]               #   [ "vm name", lun, "disk name" , "caching type"]
# ]                                                                         # ]
# data_disk_id = module.data_disk.id                                        # data_disk ids
# vm_id = module.vm.id                                                      # vm ids