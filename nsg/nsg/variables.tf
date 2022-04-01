variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "nsg_names" { default = [] }
variable "nsg_rules" {default = [[]]}


# resource_group_name = module.resource_group.name              # respurce group name
# location = module.resource_group.location                     # location
# nsg_names = ["nsg-subnet1","nsg-subnet2"]                     # nsg_names : nsg name list
# nsg_rules = [                                                 # nsg_rules : nsg rule list (2-D array)
#       ["nsg-subnet1", 100, "port-tcp-22", 22, "*", "tcp"]     # [ [ "nsg name", priority, "rule name", port, "source_address_prefix", "protocol" ] ]
# ] 
