terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-State-Backend"
    storage_account_name = "statestoragetf"                      
    container_name       = "test-terraform-container"                       
    key = "terraform.tfstate"        
  }
}
