#######################################
# Azure Storage container
#######################################
resource "azurerm_storage_container" "example" {
  name                  = vars.name
  storage_account_name  = vars.storage_account_name
  container_access_type = vars.container_access_type
}