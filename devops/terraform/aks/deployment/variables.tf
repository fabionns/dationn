
variable "dns_prefix" {
    description = "DNS suffix for the cluster"
    default = "uspup"
}

variable "cluster_name" {
    description = "cluster_usp_up"
}

variable "resource_group_name" {
    description = "Grupo de Recursos Rserver"
    default = "resource_group_usp_up"
}

variable "location" {
    description = "brazilsouth"
}

variable "instance_type" {
  default = "standard_d2_v2"
}

variable "instance_name" "ansible" {
  default = "tf-ansible"
}





#/usr/local/bin/
