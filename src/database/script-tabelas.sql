-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE world_warriors;

USE world_warriors;

CREATE TABLE escolha_personagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(150) NOT NULL,
    fk_escolha_personagem INT,
    CONSTRAINT cfk_personagem FOREIGN KEY (fk_escolha_personagem) REFERENCES escolha_personagem (id)
);

CREATE TABLE avaliacao (
    fk_usuario INT PRIMARY KEY,
    descricao VARCHAR(150),
    qtd_estrelas TINYINT,
    CONSTRAINT cfk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id)
);

INSERT INTO usuario (nome, email, senha, fk_escolha_personagem) VALUES 
	("Caique","caique@caique.com","testeteste",1);

INSERT INTO usuario (nome, email, senha, fk_escolha_personagem) VALUES 
( "Joao", "asdasdasd@aSADA.com", "testeteste", 8 );

INSERT INTO escolha_personagem (nome) VALUES 
	("Ryu"),
    ("Ken"),
    ("Chun-Li"),
    ("Guile"),
    ("Zangief"),
    ("E.Honda"),
    ("Blanka"),
    ("Dhalsim");

SELECT COUNT(usuario.fk_escolha_personagem) AS votos, escolha_personagem.nome
FROM usuario
    RIGHT JOIN escolha_personagem ON usuario.fk_escolha_personagem = escolha_personagem.id
GROUP BY
    escolha_personagem.nome
ORDER BY votos DESC;

SELECT u.id, u.nome, a.qtd_estrelas, a.descricao
FROM usuario u
LEFT JOIN avaliacao a ON a.fk_usuario = u.id;

CREATE VIEW vw_progresso_usuarios AS
SELECT
    COUNT(*) AS cadastrados,
    COUNT(u.fk_escolha_personagem) AS ja_votaram,
    COUNT(*) - COUNT(u.fk_escolha_personagem) AS faltam_votar,
    COUNT(a.fk_usuario) AS avaliaram,
    COUNT(*) - COUNT(a.fk_usuario) AS faltam_avaliar
FROM usuario u
LEFT JOIN avaliacao a ON a.fk_usuario = u.id;

SELECT * FROM vw_progresso_usuarios;

GROUP BY escolha_personagem.nome SELECT user FROM mysql.user;

SELECT * FROM usuario;

SELECT * FROM escolha_personagem;

SELECT * FROM avaliacao;

