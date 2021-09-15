##########################
#   Main variables
##########################

variable "location"{
    default     = "eastus"
    description = "The azure region where the infastructure will be provisioned"
}

variable "resource_group_name"{
    default = "Data_in_cloud_test"
}


#azure storage
variable "azure_storage_actname" {
    type = string
    default = "lakestorageact"
}

variable "azure_storage_contname" {
    type = string
    default = "lakestoragecont"
}
variable "blob-names"{
    type = list(string)
    default=["raw", "validated", "processed"]
}