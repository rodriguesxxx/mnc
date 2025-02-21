# Docker

Docker é uma plataforma que permite criar, empacotar, distribuir e executar aplicativos de forma isolada usando containers.

## O que é um container?

Um container é um ambiente leve e independente que contém tudo o que um software precisa para rodar:

✅ Código do aplicativo

✅ Bibliotecas e dependências

✅ Configurações específicas

Isso significa que, independente do sistema operacional ou da máquina onde o container for executado, ele funcionará da mesma forma.

## Por que usar Docker?

-   ✔ Elimina o famoso "na minha máquina funciona" → Como o container é idêntico em qualquer ambiente, evita problemas de compatibilidade.
-   ✔ Consome menos recursos do que máquinas virtuais → Containers compartilham o mesmo sistema operacional, ao contrário de VMs que precisam de um SO completo.
-   ✔ Facilita a implantação de aplicações → Em vez de configurar um ambiente do zero, basta rodar um comando para subir o container.
-   ✔ Escalabilidade → É fácil aumentar ou diminuir o número de containers rodando um serviço.

## O que são imagens

A imagem do Docker é, basicamente, uma série de instruções
que o Docker seguirá para criar um container.
Em seguida, com o container criado, o Docker irá executá-lo.

https://hub.docker.com/

```bash
docker pull <image> #hello-world
```

-   busca e faz o download no Docker Hub!

```bash
docker run <image> #hello-world
```

-   Veriﬁca se temos a imagem localmente
-   Caso contrário, busca e faz o download no Docker Hub!
-   roda a imagem

```bash
docker images #lista as imagens baixadas
```

```bash
docker ps #lista containers que estão sendo executados
docker ps -a #lista todos os containers
```

```bash
docker rmi <image> #remove uma imagem
```

## Comandos básicos com containers

**Roda a imagem de alpine(linux leve) e executa um comando shell**

```bash
docker run alpine cat /etc/os-release
```

**Para instanciarmos um container e executarmos um comando
no background, podemos utilizar a ﬂag -d.**

```bash
docker run -d alpine sleep 20
```

**Evitando repetição de containers**

```bash
docker run -d --rm alpine sleep 10
```

**Caso queiramos executar comandos adicionais em um container que já está em execução, podemos utilizar o
comando exec.**

```bash
docker exec <ID> ls
```

**Utilizando o terminal do container**

```bash
docker run -it <image> #alpine
```

```bash
apk update
apk add nano
```

**Iniciando um container novamente**

```bash
docker start <ID>
```

**Pausando um container**

```bash
docker stop <ID>
```

**Removendo um container**

```bash
docker rm <ID>
```

```bash
docker container prune #remove todos inativos
```

## Criando um Dockerﬁle

Até agora utilizamos imagens prontas direto do Docker Hub,
mas ainda não criamos nossas próprias imagens para
distribuição.
Para criarmos uma imagem, precisamos criar uma receita de
bolo para ela: o Dockerﬁle.

O Dockerﬁle que vamos criar nada mais é do que um arquivo
de texto com a extensão .dockerfile.
Exemplo: mongo.dockerfile.
Em geral, criamos novas imagens baseados em uma primeira
imagem base.
Se não especiﬁcarmos um nome, podemos escolher apenas
Dockerfile.

**construir a imagem**

```bash
docker build -t teste-mysql -f mysql.dockerfile .
```

**rodar container**

```bash
docker run -d --name container-mysql -p 3306:3306 teste-mysql
docker run -d --name container-mysql -p 3307:3306 teste-mysql
```

**acessando shell do container**

```bash
docker exec -it CONTAINER_NAME /bin/bash
```

**acessando mysql**

```bash
mysql -u root -p
```

```sql
SHOW DATABASES;

USE minicurso;

SHOW TABLES;

CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

```
