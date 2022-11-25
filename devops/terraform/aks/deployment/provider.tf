terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  version = "~> 2.4"
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
#provider "libvirt" {
  # Configuration options
#}
