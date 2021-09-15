####################################
# Variables for Azure storage blob
####################################
variable "name" {
    type = string
    description = "The name for the azure storage blob"
}

variable "storage_account_name" {
    type = string
    description = "The storage account name for the storage blob"
}

variable "storage_container_name" {
    type = string
    description = "The storage account container name for the storage blob"
}

variable "type" {
     type = string
    description = "The stype of storage blob"
    default = "Block"
}
