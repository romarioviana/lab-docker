#
FROM node:14
WORKDIR /app-node
# Variável para usar em tempo de build da imagem
ARG PORT_BUILD=6000
# Variável para usar dentro do container
ENV PORT=$PORT_BUILD
# Para expor a porta do container
EXPOSE $PORT_BUILD
# Para copiar o conteúdo do diretório atual
COPY . .
# Para instalar o node
RUN npm install
# Para startar o node
ENTRYPOINT npm start
