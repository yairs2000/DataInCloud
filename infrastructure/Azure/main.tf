#   ===============================================================================================
#   This script does the following
#   1. Set up the initial azure provider
#   2. Set up the resource group we will use to provision all additional resources
#   3. Set up azure storage
#   ===============================================================================================

#   1. Set up provider info

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}


#   2. Create a resource group to hold all resources
module "resource_group" {
    source      =   "./modules/ResourceGroup"
    rg-name     =   var.resource_group_name
    rg-location =   var.location
  
}

# 3. Set up azure storage

#storage account
module "azure_storage_account" {
    source = "./modules/Storage/account"
    name   = var.azure_storage_actname
    resource_group_name = var.resource_group_name
    location  = var.location
}

#Storage container
module "azure_storage_container" {
  source = "./modules/Storage/container"
  name = var.azure_storage_contname
  storage_account_name = var.azure_storage_actname
}

#storage blob
module "azure_storage_blob" {
  source = "./modules/Storage/blob"
  count = length(var.blob-names)
  name  = var.blob-names[count.index]
  storage_account_name  = var.azure_storage_actname
  storage_container_name  =  var.azure_storage_contname
}