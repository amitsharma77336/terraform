# Edited lines

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.43.0"
    }
    random{
      source = "hashicorp/random"
      version = "3.4.3"

    }
  }
}


provider "azurerm"{

  
    features {
      
    }

}



resource "azurerm_resource_group" "RG-amit" {
  name     = "test-rg"
  location = "West Europe"
}