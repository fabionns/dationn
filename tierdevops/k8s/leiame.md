# Para habilitar o microk8s no wsl

1. <https://docs.microsoft.com/windows/wsl/wsl-config#wslconf>

2. Adicione a seguinte linha no arquivo /etc/wsl.conf
[boot]
systemd=true

3. Reinicie o wsl
wsl --shutdown

4. Check o comando
systemctl list-unit-files --type=service

5. Instale o microk8s


# Para habilitar o minikube no wsl
