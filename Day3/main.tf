# Creation of Resource Group

provider "azurerm" {

  features {}
}


resource "azurerm_virtual_network" "main"{

    name = "myvent-dev"
    location = "westeurope"
    address_space = ["10.0.0.0/16"]
    resource_group_name = "azurerm_resource_group.my-rg-test-1.name"


}

resource "azurerm_resource_group" "my-rg-test-1" {

  name     = "my-test-rg-11"
  location = "westeurope"
}