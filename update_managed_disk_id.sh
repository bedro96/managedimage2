#/!bin/bash
az logout
az login --identity

export TF_VAR_packer_os_managed_disk_id=$(az disk list --query "reverse(sort_by([?contains(name,'PackerTemp')].{name:name, id:id},&name))|[0].id" -otsv)

echo "ENV TF_VAR_packer_os_managed_disk_id : $TF_VAR_packer_os_managed_disk_id"

