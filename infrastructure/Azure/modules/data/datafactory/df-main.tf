#########################################
# Set up azure data factory
#########################################

resource "azurerm_data_factory" "example" {
  name                = vars.name
  location            = vars.location
  resource_group_name = vars.resource_group_name
}