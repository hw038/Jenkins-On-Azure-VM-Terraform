variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "nic_id" { default = {} }
variable "admin_username" { default = "" }
variable "admin_password" { default = "" }
variable "vms" { default = [[]] }
variable "avset_id" { default = {} }
variable "extension" { default = [[]] }




# resource_group_name = module.resource_group.name              # respurce group name
# location = module.resource_group.location                     # location
# nic_id = module.resource_group.location                       # location
# avset_id = module.avset.id                                    # availability set id
# admin_username = "tftest"                                     # admin_username
# admin_password = "tfxptmxm!@3456"                             # admin_password
# vms=[                                                         # vms : vm list (2-D array)
#     ["vm-test-01", ["vm-test-01-nic-ext", "vm-test-01-nic-int"], "Standard_F2s", "avset-subnet1",["Canonical","UbuntuServer","16.04-LTS","latest"], ["P", 32], "sttemptest20061", ["tag", "tag1"]],
#     ["vm-test-02", ["vm-test-02-nic-ext", "vm-test-02-nic-int"], "Standard_F2s", "avset-subnet1",["Canonical","UbuntuServer","16.04-LTS","latest"], ["P", 32], "sttemptest20061", ["tag", "tag2"]],
# ] 

## vms = [
##     ["vm name", ["nic name1", "nic_name2"], "vm_type", "avset_name", ["publisher","offer","sku","version"], ["Os Disk type", Os Disk Size], "boot_diagnostics",["tag","tag"]]
## ]   