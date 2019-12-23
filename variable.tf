variable "baseos_resourcegroup_name" {
    description = "The name of resource group, where packer temp disk is located"
    default = "terraformrg"
}
variable "packertempdisk_name" {
    description = "The name of PackerTemp disk"
    default = "PackerTemp"
}
variable "image_resourcegroup_name" {
    description = "The name of resource group, where managed image will be created"
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