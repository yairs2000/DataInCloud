###################################
# The output for storage container
###################################
output "id" {
    description = "The id for the storage container"
    value = azurerm_storage_container.actcontainer.id
}

output "name" {
    description = "The storage container name"
    value = azurerm_storage_container.actcontainer.name
}