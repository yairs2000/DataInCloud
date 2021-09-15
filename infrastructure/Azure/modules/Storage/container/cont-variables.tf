################################
# Variables for azure containers
################################
variable "name" {
    type = string
    description = "Azure container name"
}

variable "storage_account_name" {
    type = string
    description = "Azure storage account name"
}

variable "container_access_type" {
     type = string
    description = "Azure storage acontainer access type"
    default = "private"
}
