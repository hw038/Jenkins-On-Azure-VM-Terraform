variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "public_ips" {default = [[]]}

# resource_group_name = module.resource_group.name              # respurce group name
# location = module.resource_group.location                     # location
# public_ips=[                                                  # public_ips : public ip list (2-D array)
#   ["test-pip-01", "S", "S"],                                  # [ "public ip name", "lb sku(basic : B, standard : S)", "public ip type(static : S, dymanic : D)"]
#   ["test-pip-02", "S", "S"]
# ] 