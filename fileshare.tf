resource "azurerm_storage_account" "this" {
  name                     = "${terraform.workspace}bestrongstorage"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = azurerm_resource_group.this.tags
}

resource "azurerm_storage_share" "fileshare" {
  name                 = "fileshare"
  storage_account_name = azurerm_storage_account.this.name
  quota                = 50
}
