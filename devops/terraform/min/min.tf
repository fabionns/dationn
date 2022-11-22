terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.0"
    }
  }
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options
}
provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
    }
  
}