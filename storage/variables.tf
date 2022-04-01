variable "resource_group_name" { default = "" }
variable "location" { default = "" }
variable "storages" { default = [[]] }
variable "fileshare" { default = [[]] }

# resource_group_name = module.resource_group.name              # respurce group name
# location = module.resource_group.location                     # location
# storages = [                                                  # storages : storage list (2-D array)
#   ["sttemptest20061", "S", "LRS"],                            # [ [ "storage account name", "account_tier(Standard : S, Premium : P)", "account_replication_type(LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS)" ] ]
#   ["sttemptest20062", "S", "LRS"],
# ] 