#!/bin/bash
#Ambiente para o Docker
echo "Preparando ambiente Docker"

#Atualizando pakages e instalando dependências para uso repositórios com HTTPS
echo "Intalando Terraform"
sudo apt update
sudo apt-get install \
     ca-certificates \
     curl \
     gnupg \
     lsb-release -y

#Adicione a chave GPG oficial do Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Configurando repositório
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Instalando Docker Engine, containerd, e Docker Compose
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "Fim preparação ambiente Docker !!!"
