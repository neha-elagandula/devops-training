provider "azurerm" {
    features {}
    subscription_id = "modify and enter subscription id"
}

# 🔹 1️⃣ Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "acr-docker-rg-neha"
  location = "East US"
}

# 🔹 2️⃣ Create an Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "nehaacrdockerv1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# 🔹 3️⃣ Output ACR Login Server
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
