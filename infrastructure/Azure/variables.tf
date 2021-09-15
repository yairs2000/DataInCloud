##########################
#   Main variables
##########################

variable "location"{
    default     = "eastus"
    description = "The azure region where the infastructure will be provisioned"
}

variable "resource_group_name"{
    default = "Humana_Voice_test"
}

# API manager variables
variable apim-name{
    default = "PharmacyAPI"
}

variable arc-name{
    default = "LiftCache"
}
