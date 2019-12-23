# Configure the Microsoft Azure Provider

data "azurerm_subscription" "current" {}
data "azurerm_subscription" "primary" {}
data "azurerm_subscription" "subscription" {}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "imgreporg" {
    name     = "${var.resourcegroup_name}"
    location = "${var.location}"

    tags = {
        environment = "Terraform Deployment"
    }
}

resource "azurerm_managed_disk" "blank_datadisk" {
  name                 = "blank_250GB"
  location             = "${var.location}"
  resource_group_name  = "${azurerm_resource_group.imgreporg.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "250"

  tags = {
    environment = "Terraform Deployment"
  }
}

resource "azurerm_image" "packer-img-w-datadisk" {
    name                = "${var.managed_image_name}"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.imgreporg.name}"

    os_disk {
        os_type  = "Linux"
        os_state = "Generalized"
        managed_disk_id = "${var.packer_os_managed_disk_id}"
        size_gb  = 50
    }

    data_disk {
        lun = 0
        caching = "ReadWrite"
        managed_disk_id = "${azurerm_managed_disk.blank_datadisk.id}"
        size_gb = 250
    }
}
