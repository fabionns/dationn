terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  version = "~> 2.4"
  features {}
}

provider "aws" {
    version = "~> 2.0"
    region  = "us-east-2"
}
  

#provider "libvirt" {
  # Configuration options
#}
