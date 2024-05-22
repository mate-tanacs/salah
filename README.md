The task is to create a Linux Virtual Network on Azure with all the necessary resources using infrastructure as code. The tool for that will be terraform.

As step zero create a file "main.tf". This file should contain all the resources you will create. There is already a "provider.tf" file, you don't have to anything with that one.

First create a resource group called "salahrg".
From now on every resource should be created in this resource group.

Once the resource group is created, create a Virtual Network with "10.1.0.0/24" address space and name it "vnet-1".

It is recommended to segment the virtual network into smaller networks. For this create a subnet resource. The subnet should be called "subnet-1", and its address prefix has to be the first 128 IP addresses of the virtual network.

For the Virtual Machine a network interface will be required. Name it "network-interface-1" and it should use an IP address from the previously created subnet. Name the ip configuration of the network interface "internal", and the private ip address allocation should be "Dynamic".

Finally, create the Linux Virtual Machine. The VM's name should be "salah-vm". The password authentication can be enabled. The admin username and admin password is up to you. (For security reason it's enough if you give a username and password you'd like in the file, create the resource, and before commiting just delete those values and leave them empty.) For the OS disk "Standard_LRS" storage account with ReadWrite caching will be enough. The source image can be whatever you like.

Every resource should be created in "northeurope" location, and the name of the terraform resources can be arbitrary.

To test your code, first run a "terraform init", then a "terraform plan", and if the output of the plan operation seems good, then run a "terraform apply".

Please commit and push your code to the repository, so I can have a look at it.

The necessary documentations to solve the task can be found below.

https://developer.hashicorp.com/terraform/tutorials/azure-get-started

https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

https://learn.microsoft.com/en-us/azure/virtual-network/concepts-and-best-practices
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface?tabs=azure-portal
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface

https://learn.microsoft.com/en-us/azure/virtual-machines/overview
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
