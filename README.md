# Managed Image creation.
Create a managed image from packer temp file and blank data disk, place under test-imgrepo-rg resource group.
Assumption is that packer/azure-chroot will create a packer temp disk of the OS disk and the name of this temp disk is known and the resource group that contains this temp disk is known.

1. Update terraform.tfvars with required information including packer temp disk name, resource groups, and etc.
2. Run following terraform command to create the Azure managed image. Also note that this script will **DELETE** the packer temp disk, once the Azure managed image is created.
```bash
terraform plan -out=managedimage_from_packer.out
terraform apply terraform plan -out=managedimage_from_packer.out
```