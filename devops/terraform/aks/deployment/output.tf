# output

#Gera o arquivo de configuração do cluster 
resource "local_file" "kubeconfig" {
    depends_on = [azurerm_kubernetes_cluster.clusterk8s]
    filename = "kubeconfig"
    content = azurerm_kubernetes_cluster.clusterk8s.kube_config_raw
}

# Gera o arquivo de inventario do ansible
resource "null_resource" "ansible" {
    depends_on = [local_file.kubeconfig]
    connection {
        type = "ssh"
        user = "root"
        host = azurerm_public_ip.ip.address
        hostname = azurerm_public_host.host.name
        private_key = file(var.ssh_key_private)
    }

    provisioner "local-exec" {
        command = "echo [${file.kubeconfig.hostname}:nodes] > /etc/ansible/hosts"
    }
    provisioner "local-exec" {
        command = "ansible-playbook -u user -i '${self.public_ip},' --private-key ${var.ssh_key_private} provision.yml"
    }       
}




