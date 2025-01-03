  # Provides configuration details for Terraform
  terraform {
    required_version = ">= 0.12"
    required_providers {
      azurerm = {
          source= "hashicorp/azurerm"
          version= "~>4.1.0"
      }
    }
  }

  # Providers configuration details for the Azure Terraform provider
  provider "azurerm" {
      features {}
      subscription_id = var.subs_id
      tenant_id = var.tenant_id
     client_id = var.client_id
    client_secret = var.client_secret
  }

  # Resoure Group
  resource "azurerm_resource_group" "RahulRG" {
    name     = "first-test-resources"
    location = "Central India"
  }

  # # Storage Account
   resource "azurerm_storage_account" "testStorageAccount" {
     name                     = "rahulrautela123"
     resource_group_name      = azurerm_resource_group.RahulRG.name
     location                 = azurerm_resource_group.RahulRG.location
     account_tier             = "Standard"
     account_replication_type = "LRS"
   }


   # Service Plan
   resource "azurerm_service_plan" "testServicePlan" {
     name                = "azure-functions-test-service-plan"
     location            = azurerm_resource_group.RahulRG.location
     resource_group_name = azurerm_resource_group.RahulRG.name
     os_type = "Linux"
     sku_name = "Y1"
   }


   # Azure Function
resource "azurerm_linux_function_app" "function_app_toll_violation_system"{
  name                = "rautelarahul124"
  resource_group_name = azurerm_resource_group.RahulRG.name
  location            = azurerm_resource_group.RahulRG.location

  storage_account_name       = azurerm_storage_account.testStorageAccount.name
  storage_account_access_key = azurerm_storage_account.testStorageAccount.primary_access_key

  service_plan_id            = azurerm_service_plan.testServicePlan.id

      app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = var.blob_url
    }
  site_config {
    cors {
      allowed_origins = [ "*" ]
      support_credentials = false
    }
    application_stack {
      python_version = "3.12"
    }
  }

}

