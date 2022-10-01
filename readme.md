# Instalar o ansible localmente
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible $ sudo apt update
sudo apt install ansible

# Criar um container com o ansible control 
# Criar os containers
docker-compose -up -d
docker exec -it master bash
cd /root/ansible/ && ls && ansible -i hosts all -m ping

# execute o playbook
ansible-playbook init nome_projeto
ansible-playbook -i ../hosts main.yaml


# Exemplo de playbook
--- 
   name: install and configure DB
   hosts: testServer
   become: yes

   vars: 
      oracle_db_port_value : 1521
   
   tasks:
   -name: Install the Oracle DB
      yum: <code to install the DB>
    
   -name: Ensure the installed service is enabled and running
   service:
      name: <your service name>

      