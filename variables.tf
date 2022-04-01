
variable "cred" {
  description = "user ID / Password"
  type = map
  default = {
    id = "azureuser"
    pw = "Azurexptmxm123"
  }
}

variable "storage"{
  default = {
    storages = [ 
      ["", "S", "LRS"],
    ]
    file_share = [
      ["","50"],
    ]
  }
}