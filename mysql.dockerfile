# Usa a imagem oficial do MySQL
FROM mysql:latest

# Define variáveis de ambiente para configurar o banco
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=meubanco
ENV MYSQL_USER=aluno
ENV MYSQL_PASSWORD=ifnmg

# Expõe a porta padrão do MySQL
EXPOSE 3306

# Define o comando padrão ao iniciar o container
CMD ["mysqld"]
