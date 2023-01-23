# Lab Docker

O Docker é uma plataforma open source que facilita a criação e administração de ambientes isolados. Ele possibilita o empacotamento de uma aplicação ou ambiente dentro de um container, se tornando portátil para qualquer outro host que contenha o Docker instalado.

O que iremos ver nesse Lab:
* Instalação e configuração do Docker README;
* Entender os Containers e suas camadas;
* Conhecer os principais comandos Docker;
* O que é um container;
* Quais são as características de um container;
* Como ele vai funcionar;
* Como interagir os containers;
* Como criar nossas imagens;
* Usar imagens de terceiros;
* Persistência de dados através de volumes;
* Tipos de redes do docker;
* Comunicação entres containers;
* Coordenação de containers com o docker;


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


# Acesse a WiKi para ver como fazer esse ```Lab Docker```

Na [Wiki Projeto] tem toda a documentação, onde é explicamos com detalhes todos os passos do ```Lab Docker```.


# Contribuindo
As contribuições são o que torna a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Quaisquer contribuições que você fizer são muito apreciadas.

Se você tiver uma sugestão para melhorar isso, bifurque o repositório e crie uma pull request.

1. Fork o Projeto
2. Crie o seu Branch Feature (git checkout -b feature/amazing-feature)
3. Commit sua alterações (git commit -m 'Add some amazing-feature')
4. Push para o Branch (git push origin feature/amazing-feature)
5. Abra um Pull Request


---

Referências:
* [Wiki Projeto]
* [Docker]
* [Docker Exemplos Images]
* [Docker Hub]
* [Cgroups]
* [Instalação Docker Ubuntu]


:rocket::rocket::rocket:


<!-- MARKDOWN LINKS & IMAGES -->
[Wiki Projeto]: ../../wiki
[Cgroups]: https://access.redhat.com/documentation/pt-br/red_hat_enterprise_linux/6/html/resource_management_guide/ch01
[Docker Hub]: https://hub.docker.com 
[Docker Exemplos Images]:https://docs.docker.com/engine/reference/commandline/images/   
[Docker]: https://docs.docker.com/get-started/overview/
[Instalação Docker Ubuntu]: https://docs.docker.com/engine/install/ubuntu/



