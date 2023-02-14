provider "azurerm" {
  
  features{}
}
provider "random" {
  
}
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  number = false   
}

resource "azurerm_resource_group" "Mytest-RG" {
    name = "test-rg-1-${random_string.myrandom.id}"
    location = "westeurope"

}