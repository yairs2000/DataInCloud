#   ===============================================================================================
#   This script does the following
#   1. Set up the initial azure provider
#   2. Set up the resource group we will use to provision all additional resources
#   3. Set up azure api manager
#   4. Set up redis Cache
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


#   3. Create azure api manager
module "api_manager"{
    source = "./modules/Web/ApiManager"
    apim-name   = var.apim-name
    apim-location = var.location
    apim-rg-name = var.resource_group_name
}

# 4. Set up redis Cache

module "redis_cache"{
  source = "./modules/Redis"
  arc-name = var.arc-name
  arc-location = var.location
  arc-rg-name = var.resource_group_name
}