
resource "azurerm_resource_group" "salahrg"{
    name = "salahrg"
    location = "northeurope"
  
}

resource "azurerm_virtual_network" "vnet-1"{
    name = "vnet-1"
    address_space = ["10.1.0.0/24"]
    location = azurerm_resource_group.salahrg.location
    resource_group_name = azurerm_resource_group.salahrg.name
  
}

resource "azurerm_subnet" "subnet-1"{
    name = "subnet-1"
    address_prefixes = ["10.1.0.0/25"]
    resource_group_name = azurerm_resource_group.salahrg.name
    virtual_network_name = azurerm_virtual_network.vnet-1.name
  
}

resource "azurerm_network_interface" "network-interface-1"{
    name = "network-interface-1"
    location = azurerm_resource_group.salahrg.location
    resource_group_name = azurerm_resource_group.salahrg.name
    
    ip_configuration{
      name = "internal"
      subnet_id = azurerm_subnet.subnet-1.id
      private_ip_address_allocation = "Dynamic"
    }

}

resource "azurerm_linux_virtual_machine" "salah-vm"{
  disable_password_authentication = false

    name = "salah-vm"
    resource_group_name = azurerm_resource_group.salahrg.name
    location = azurerm_resource_group.salahrg.location
    size = "Standard_B1s"
    admin_username = "salah"
    admin_password = "S@l@h_917"
    network_interface_ids = [ 
        azurerm_network_interface.network-interface-1.id
    ]
    os_disk{
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
   source_image_reference{
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}



