# Configure Terraform
terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# Azure AD provider configuration
provider "azuread" {
  tenant_id = var.tenant_id
}