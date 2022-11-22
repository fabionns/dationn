provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "ansible_control" {
  count = var.instance_count
  instance_type = var.instance_type
  ami = var.ami_id
  key_name = var.ssh_key_name
  subnet_id = var.subnet_id
  tags {
    Name = var.instance_name
  }
}

resource "null_resource" "ConfigureAnsibleLocal" {
    provisioner "local-exec" {
        command = "echo [var.dev_host_label:vars] > /etc/ansible/hosts"
    }
    provisioner "local-exec" {
        command = "echo ansible_user=${var.ssh_user_name} >> /etc/ansible/hosts"
    }
    provisioner "local-exec" {
        command = "echo ansible_ssh_private_key_file=${var.ssh_key_path} >> /etc/ansible/hosts"
    }
    provisioner "local-exec" {
        command = "echo [var.dev_host_label] >> /etc/ansible/hosts"
    }
}

resource "null_resource" "ConfigureAnsibleRemote" {
    count = var.instance_count
    connection {
        type = "ssh"
        user = var.ssh_user_name
        host = aws_instance.ansible_control[count.index].public_ip
        private_key = file(var.ssh_key_path)
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update -y",
            "sudo apt install python-setuptools python-pip -y",
            "sudo pip install httplib2"
        ]
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.ansible_control[count.index].public_ip} >> /etc/ansible/hosts"
    }
}

resource "null_resource" "ApplyAnsiblePlaybook" {
    depends_on = [null_resource.ConfigureAnsibleRemote]

    provisioner "local-exec" {
        command = "sed -i -e '/hosts:/ s/: .*/: ${var.dev_host_label}/' ~/proj/ansible/main.yml"   
    }
    provisioner "local-exec" {
        command = "sleep 10; ansible-palybook -i /etc/ansible/hosts ~/proj/ansible/main.yml"
    }
}


