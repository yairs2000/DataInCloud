###########################################
# Storage account variables
###########################################

variable "name"{
    type = string
    description = "Storage account name"
}

variable "resource_group_name" {
    type = string
    description = "Resource group name"
}

                  
variable "location" {
    type = string
    description = "Account location"
}

variable "account_tier" {
    type = string
    description = "The account tier for the storage account"
    default = "Standard"
}
    
variable "account_replication_type"{
    type = string
    description = "The account replication type"
    default = "LRS"
}        