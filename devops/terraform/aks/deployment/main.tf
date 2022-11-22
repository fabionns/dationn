#Cluster Resource Group

# AKS Cluster Network

# AKS IDENTITY

# AKS LOG ANALYTICS

# AKS cLUSTER 


terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=2.48.0"
        }
    }
}

provider "azurem" {
    features {}
}

provider "helm" {
    kubernetes {
      config_path = [local_file.kubeconfig]
    }
  
}

# Cluster Resource Group
resource "azurerm_resource_group" "rGroup" {
    name = var.resource_group_name-var.env_name
    location = var.location
}

resource "azurerm_kubernetes_cluster" "clusterk8s" {
    name = "clusterk8suspup"
    location = azurerm_resource_group.rGroup.location
    resource_group_name = azurerm_resource_group.rGroup.name
    dns_prefix = var.dns_prefix

    resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
        kubernetes_cluster_id = azurerm_kubernetes_cluster.id 
        name = "uspup"
        type = "VirtualMachineScaleSets"
        tag = "nodepool"
        node_count = "2"
        vm_size = var.instance_type
        enable_aut_scaling = true
    }

    lifecycle {
        ignore_changes = [
            azurerm_kubernetes_cluster_node_pool.tag
        ]
    }

    identity {
        type = "SystemAssigned"
    }

    tags = {Enviroment = "Development"}

    addon_profile {
        http_application_routing {
            enable = true
        }
    }
}
/*


resdource "null_resdource" "ConfigureAnsible" {
provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.rGroup.name} --name ${azurerm_kubernetes_cluster.clusterk8s.name} --overwrite-existing"
}

provisioner "local-exec" "ConfigureAnsible" {
    command = "ansible-playbook -u user -i '${self.public_ip},' --private-key ${var.ssh_key_private} provision.yml"
}
*/



