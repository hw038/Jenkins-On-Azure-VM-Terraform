variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "disks" {default = [[]]}
variable "vm_id" { default = "" }


# resource_group_name = module.resource_group.name                          # respurce group name
# location = module.resource_group.location                                 # location
# disks=[                                                                   # disks : disk list (2-D array)
#    ["vm-test-01", 0, "vm-test-01-disk-data-0", "H", 32, "ReadWrite"],     # [
#    ["vm-test-02", 0, "vm-test-02-disk-data-0", "H", 32, "ReadWrite"]      #   [ "vm name", lun number, "disk name" , "disk type(H:Standard_LRS, S:StandardSSD_LRS, P:Premium_LRS), disk size, "caching type"]
# ]                                                                         # ]
# vm_id = module.vm.id                                                      # vm ids