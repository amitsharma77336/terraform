resource "azurerm_resource_group" "my-rg" {
  name     = "${local.res_name}-${random_string.random-name.id}"
  location = var.location
}
