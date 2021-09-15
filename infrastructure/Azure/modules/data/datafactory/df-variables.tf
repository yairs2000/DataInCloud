####################################
# Variables for azure data factory
####################################
variable "name" {
    type = string
    description = "The name for the azure data factory"
}

variable "location" {
    type = string
    description = "The location for the azure data factory"
}

variable "resource_group_name" {
    type = string
    description = "The resource group name for the azure data factory"
}
