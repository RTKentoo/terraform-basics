# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group "myrg" " {
    name = "kent_test"
    location = "US West2"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
    name                = "kent_test-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location            = azurerm_resource_group.myrg.location
    address_space       = ["10.0.0.0/16"]
}

# Create a subnet within the vnet
resource "azurerm_subnet" "mysubnet" {
    name                = "kent_test-subnet"
    resource_group_name = azurerm_resource_group.myrg.location
    location            = azurerm_resource_group.myrg.location
    address_space       = ["10.0.1.0/24"]
}

