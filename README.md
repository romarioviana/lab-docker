

# Instalando o Docker no Linux

# Preparando o ambiente
Instalação do Docker Community Edition, Docker CLI, Docker Compose e Containerd que será responsável pela parte do funcionamento dos containers dentro do nosso sistema host. 

* Script instacao-docker.sh - Preparação ambiente Docker - Linux Ubutun
  ```sh
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
  ```

Para mais detalhes consulte a documentação de instalação oficial em [Instalação Docker Ubuntu].


# Verificando instalação

Vamos verificarmos se a instalação foi feita com sucesso executando a imagem hello-world

  ```sh
  sudo docker run hello-world
  ```

  ```sh
  Unable to find image 'hello-world:latest' locally
  latest: Pulling from library/hello-world
  2db29710123e: Pull complete
  Digest: sha256:c77be1d3a47d0caf71a82dd893ee61ce01f32fc758031a6ec4cf1389248bb833
  Status: Downloaded newer image for hello-world:latest

  Hello from Docker!
  This message shows that your installation appears to be working correctly.
  ```

Veja que a deu a mensagem ``Hello from Docker!``, a princípio a instalação foi feita com sucesso!!!


# Criando grupo docker no sistema

Para não precisar colocar o sudo antes de todo comando Docker, vamos criarmos um grupo docker com o nosso usuário com os seguintes comandos.

* Criando o grupo docker
  ```sh
   sudo groupadd docker
  ```

* Adicionando nosso usuário ao grupo docker
  ```sh
   sudo usermod -aG docker $USER
  ```

* Ativando o grupo docker
  ```sh
  newgrp docker
  ```
PS.: É necessário reiniciar a máquina após esse comando.


<!-- MARKDOWN LINKS & IMAGES -->
[Wiki Projeto]: ../../wiki
[Instalação Docker Ubuntu]: https://docs.docker.com/engine/install/ubuntu/

