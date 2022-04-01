variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "disks" {default = [[]]}

# resource_group_name = module.resource_group.name             # respurce group name
# location = module.resource_group.location                    # location
# disks=[                                                      # disks : disk list (2-D array)
#    ["vm-test-01-disk-data-0", "H", 32],                      # [
#    ["vm-test-02-disk-data-0", "H", 32]                       #   [ "disk name" , "disk type(H:Standard_LRS, S:StandardSSD_LRS, P:Premium_LRS), disk size ]
# ]                                                            # ]