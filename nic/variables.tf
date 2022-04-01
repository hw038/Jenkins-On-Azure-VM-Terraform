variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "subnet_id" { default = {} }
variable "pip_id" { default = {} }
variable "nics" {default = [[]]}


# resource_group_name = module.resource_group.name              # respurce group name
# location = module.resource_group.location                     # location
# subnet_id = module.vnet.subnet_id                             # subnet_id : subnet_id list
# pip_id = module.pip.id                                        # pip_id : public ip list
# nics=[                                                        # nics : nic list (2-D array)
#   ["test-nic-01", "subnet1", "S","10.0.1.11","","true"],      # [ [ "nic name", "subnet_name", "private ip type(static : S, dymanic : D)", "private ip address", "public ip name"], "enable_accelerated_networking"] ]
#   ["test-nic-02", "subnet1", "S","10.0.1.12","","false"]
# ]  