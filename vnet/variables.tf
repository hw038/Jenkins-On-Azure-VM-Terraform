variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "vnet_name" { default = "" }

variable "address_space" { default = ["10.0.0.0/8"] }
variable "subnets" { default = [[]] }


# vnet_name = "vnet-tf-test"                            # vnet name
# resource_group_name = module.resource_group.name      # respurce group name
# location = module.resource_group.location             # location
# address_space = ["10.0.0.0/16"]                       # address_space : vnet private address space
# subnets=[                                             # subnets : subnet list (2-D array)
#   ["subnet1", "10.0.1.0/24"],                         # [ [ "subnet name", "address_prefix"] ]
#   ["subnet2", "10.0.2.0/24"]
# ]