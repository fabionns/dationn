FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install ssh ansible -y && ansible-galaxy collection install debops.debops kubernetes.core
RUN echo 'root:dation' | chpasswd 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication/PasswordAlink