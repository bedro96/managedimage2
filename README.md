# Managed Image creation.
Create a managed image from packer temp file and blank data disk, place under test-imgrepo-rg resource group.

1. Run Packer that will create a temp file, which has PackerTemp-xxxxxxxxxx as name convention.
2. Execute following command where AZ Cli and terraform are installed. This will search for a latest managed disk which has been created, with name starting as PackerTemp. Then this will be exported as system environment variable, which could be as input variable for terraform. Please note that in terraform.tfvars, the variable packer_os_managed_disk_id is commented out. Since this value is not assigned nor it has default value, terraform will search TF_VAR_packer_os_managed_disk_id in system environment variable. With following command, TF_VAR_packer_os_managed_disk_id will be used as input values for packer_os_managed_disk_id.
```bash 
source ./update_managed_disk_id.sh
```
3. Run rest of terraform command to update the Azure managed image.
```bash
terraform plan -out=managedimage_from_packer.out
terraform apply terraform plan -out=managedimage_from_packer.out
```
4. Once these codes are applied, imgtestwithdatadisk image will be provision under test-imgrepo-rg resource group.
