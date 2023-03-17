resource "azurerm_resource_group" "pavan_rg" {
  name     = var.rg_name
  location = var.rg_location
}
resource "azurerm_virtual_network" "pavan_vnet" {
  name                = var.vnet1_name
  address_space       = var.cider1_vnet
  location            = azurerm_resource_group.pavan_rg.location
  resource_group_name = azurerm_resource_group.pavan_rg.name
}

resource "azurerm_subnet" "pavan_subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.pavan_rg.name
  virtual_network_name = azurerm_virtual_network.pavan_vnet.name
  address_prefixes     = var.cider3_subnet
  }
resource "azurerm_virtual_network" "pavan_vnet2" {
  name                = var.vnet2_name
  address_space       = var.cider2_vnet
  location            = azurerm_resource_group.pavan_rg.location
  resource_group_name = azurerm_resource_group.pavan_rg.name
}

resource "azurerm_subnet" "pavan_subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = azurerm_resource_group.pavan_rg.name
  virtual_network_name = azurerm_virtual_network.pavan_vnet2.name
  address_prefixes     = var.cider4_subnet
}
resource "azurerm_virtual_machine" "Pavan_VM" {
  name                  = var.vm_name
  location              = azurerm_resource_group.pavan_rg.location
  resource_group_name   = azurerm_resource_group.pavan_rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  