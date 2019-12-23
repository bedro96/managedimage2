variable "resourcegroup_name" {
    description = "The name of resource group"
    default = "terraformrg"
}
variable "location" {
    description = "The Azure Region in which all resources in this example should be created."
    default = "southeastasia"
}
variable "managed_image_name" {
    description = "The name of managed image to be created."
    default = "imgtestwithdatadisk1"
}
variable "packer_os_managed_disk_id" {
    description = "The id of managed image to created from Packer Azure-chroot."
}