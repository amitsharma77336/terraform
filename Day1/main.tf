provider azurerm {

    features{}
}
provider random{

}
resource "random_string" "myrandomstring"{
    length = 6
    special = false

}

resource "azurerm_resource_group" "My-RG-Test"{

    name = "My-Test-RG-${random_string.myrandomstring.id}"
    location  = "westeurope"




}