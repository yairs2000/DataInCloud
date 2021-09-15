###############################
# Set up Azure storage blob
###############################
resource "azurerm_storage_blob" "example" {
  name                   = var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.type
}