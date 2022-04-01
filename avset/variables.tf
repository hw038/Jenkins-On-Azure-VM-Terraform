variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "avset_names" { default = [] }
variable "fd" { default = 2}
variable "ud" { default = 5}

# resource_group_name = module.resource_group.name      # respurce group name
# location = module.resource_group.location             # location
# avset_names = ["avset-subnet1", "avset-subnet2"]      # [ "avset name1", "avset name2" ...."avset nameN"]
# fd = 2                                                # fault domain
# ud = 5                                                # update domain
