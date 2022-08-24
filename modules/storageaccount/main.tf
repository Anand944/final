resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.loaction
}
resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storage_accput_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}
resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "blob" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.storageaccount.name
  storage_container_name = azurerm_storage_container.cpntainer.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}