-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE world_warriors;
USE world_warriors;

CREATE TABLE escolha_personagem(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL
);

CREATE TABLE usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
senha VARCHAR(150) NOT NULL,
fk_escolha_personagem INT,
CONSTRAINT cfk_personagem 
	FOREIGN KEY (fk_escolha_personagem)
		REFERENCES escolha_personagem(id)
);

CREATE TABLE avaliacao(
fk_usuario INT PRIMARY KEY,
descricao VARCHAR(150),
qtd_estrelas TINYINT,
CONSTRAINT cfk_usuario 
	FOREIGN KEY (fk_usuario)
		REFERENCES usuario(id)
);


SELECT user FROM mysql.user;
