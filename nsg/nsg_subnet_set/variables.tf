variable "nsg_subnet_set" { default = [[]] }
variable "nsg_id" { default = {} }
variable "subnet_id" { default = {} }


# nsg_id = module.nsg.id                    # nsg_id : nsg_id list
# subnet_id = module.vnet.subnet_id         # subnet_id : subnet_id list
# nsg_subnet_set=[                          # nsg_subnet_set : subnet & nsg connect list (2-D array)
#   ["subnet1", "nsg-subnet1"],             # [ [ "subnet name", "nsg name"] ]
#   ["subnet2", "nsg-subnet2"]
# ] 