##############################
# Create Azure resource group
##############################
resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.rg-location
}