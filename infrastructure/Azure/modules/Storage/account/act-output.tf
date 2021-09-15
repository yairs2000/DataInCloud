#############################
# Output for storage account
#############################

output "id" {
    description = "The id for the storage account"
    value = azurerm_storage_account.actstorage.id
}

output "name" {
    description = "The storage account name"
    value = azurerm_storage_account.actstorage.name
}