locals {
  
  # 개인 변수 설정
  ###########################################
  resource_group = "test-${local.vm_name}"
  location = "Korea Central"
  storagename = "${local.vm_name}teststor"
  vm_name= "jenkins"
  vm_pip_prefix = "hh"


  # 변수 정의 (고정)
  ###########################################
  storage = {
    storages = [ 
      ["${local.storagename}", "S", "LRS"],
    ]
    file_share = [
      ["${local.vm_name}testfile","50"],
    ]
  }

  nsg = {
    nsg_names = ["${local.vm_name}-NSG01"] 
    nsg_rules = [ 
      ["${local.vm_name}-NSG01", 100, "port-tcp-22", 22, "*", "tcp"],
      ["${local.vm_name}-NSG01", 110, "port-tcp-80", 80, "*", "tcp"],
      ["${local.vm_name}-NSG01", 120, "8080-Jenkins", 8080, "*", "tcp"],
    ],
    nsg_subnet_set = [
      ["${local.vm_name}-Subnet01", "${local.vm_name}-NSG01"],
    ]     
  }

  vnet = {
    address_space = ["10.0.0.0/8"]
    subnets = [
      ["${local.vm_name}-Subnet01", "10.0.0.0/16"]
    ] 
  }


  avset_names = ["${local.vm_name}-AVset01"]

  vm = {
      public_ips = [
        ["${local.vm_pip_prefix}-${local.vm_name}-pip", "S", "S"],
      ],
      nics = [
        ["${local.vm_name}-nic", "${local.vm_name}-Subnet01", "S","10.0.0.100", "${local.vm_pip_prefix}-${local.vm_name}-pip","false"],
      ],
      vms=[
        ["${local.vm_name}", ["${local.vm_name}-nic"], "Standard_F2s", "",["Canonical","UbuntuServer","18.04-LTS","latest"], ["P", 32], "", ["DevOps", "CI/CD"]],
      ],
      data_disks=[
        ["${local.vm_name}", 0, "${local.vm_name}-disk-data-0", "H", 32, "ReadWrite"],
      ],
      extension=[
      ["nginx_hostname","Microsoft.Azure.Extensions","CustomScript","2.0","apt-get -y update"],
    ]
  }
}

module "resource_group" {
  source = "./resource_group"  
  name = local.resource_group
  location = local.location
}

# module "storage" {
#   source = "./storage"
  
#   resource_group_name = module.resource_group.name
#   location = module.resource_group.location
#   storages = local.storage.storages
#   fileshare = local.storage.file_share
# }

module "nsg" {
  source = "./nsg/nsg"

  location = module.resource_group.location
  resource_group_name = module.resource_group.name

  nsg_names = local.nsg.nsg_names
  nsg_rules = local.nsg.nsg_rules
}

module "vnet" {
  source = "./vnet"  
  vnet_name = "${local.vm_name}-VNet01"      
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space = local.vnet.address_space
  subnets = local.vnet.subnets
}

module "nsg_subnet_set" {
  source = "./nsg/nsg_subnet_set"

  nsg_id = module.nsg.id
  subnet_id = module.vnet.subnet_id
  nsg_subnet_set = local.nsg.nsg_subnet_set
}


module "avset" {
  source = "./avset"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  avset_names = local.avset_names
}

module "pip" {
  source = "./pip"

  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  public_ips = local.vm.public_ips
}

module "nic" {
  source = "./nic"

  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  subnet_id = module.vnet.subnet_id
  pip_id = module.pip.id
  nics = local.vm.nics
}


module "vm" {
  source = "./vm/vm"

  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  nic_id = module.nic.id
  avset_id = module.avset.id
  admin_username = "azureuser"
  admin_password = "Azurexptmxm123"
  vms = local.vm.vms
  extension = local.vm.extension
}

module "data_disk" {
  source = "./vm/disk/data_disk_create_attach"

  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  disks = local.vm.data_disks
  vm_id = module.vm.id
}


# module "data_disk_create" {
#    source = "./vm/disk/data_disk"

#   resource_group_name = module.resource_group.name
#   location = module.resource_group.location
# }

# module "data_disk_attach" {
#    source = "./vm/disk/data_disk_attach"

#   resource_group_name = module.resource_group.name
#   location = module.resource_group.location
#   data_disk_id = module.data_disk_create.id
#   vm_id = module.vm.id
# }


output "avset_id" {
  value = module.avset.id
}


output "nic_id" {
  value = module.nic.id
}

output "nsg_id" {
  value = module.nsg.id
}

output "nsg_subnet_set_info" {
  value = module.nsg_subnet_set.info
}

output "pip_id" {
  value = module.pip.id
}

output "vnet_name" {
  value = module.vnet.name
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_location" {
  value = module.resource_group.location
}

output "storage_id" {
  value = module.storage.id
}
output "storage_name" {
  value = module.storage.storagename
}

output "storage_file_share_name" {
  value = module.storage.filesharename
}




