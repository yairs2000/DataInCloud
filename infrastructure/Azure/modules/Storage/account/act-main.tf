###########################################
#Create Azure storage account
###########################################
resource "azurerm_storage_account" "example" {
  name                     = vars.name
  resource_group_name      = vars.resource_group_name
  location                 = vars.location
  account_tier             = vars.account_tier
  account_replication_type = vars.account_replication_type
}