/*criando o database*/
CREATE DATABASE db_quitanda;

/*acessando o database*/
USE db_quitanda;

/*criando uma tabela*/
CREATE TABLE tb_produtos (
id BIGINT auto_increment,
nome VARCHAR(255) NOT NULL,
quantidade INT,
datavalidade DATE,
preco DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_produtos (nome, quantidade, datavalidade,preco)
VALUES ("Tomate",100,"2023-09-13",8.00);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, quantidade, datavalidade,preco)
VALUES ("Abacaxi",50,"2023-03-18",12.00),
("Goiaba",150,"2023-05-20",9.00),
("Morango",10,"2023-02-16",7.00),
("Mamão",100,"2023-06-30",9.00),
("Pêra",20,"2023-07-01",12.00)
;

INSERT INTO tb_produtos (nome, quantidade, datavalidade,preco)
VALUES ("Abobrinha",200,"2023-03-18",6.00);

SELECT nome FROM tb_produtos;

SELECT id,nome,preco FROM tb_produtos;

SELECT * FROM tb_produtos WHERE id =3;

SELECT * FROM tb_produtos WHERE preco <> 10.0;

DELETE FROM tb_produtos WHERE id = 3;

SELECT * FROM tb_produtos WHERE preco > 6.0 AND quantidade < 80;

ALTER TABLE tb_produtos MODIFY preco DECIMAL(6,1);

ALTER TABLE tb_produtos ADD descricao VARCHAR(255);

SET SQL_SAFE_UPDATES = 0;

UPDATE tb_produtos SET preco = 5.0 WHERE id = 5;

UPDATE tb_produtos SET descricao = "Tomate cereja" WHERE nome = "Tomate";
UPDATE tb_produtos SET descricao = "Tomate cereja" WHERE id = 1;
UPDATE tb_produtos SET descricao = "Abacaxi Pérola" WHERE id = 2;
UPDATE tb_produtos SET descricao = "Morango" WHERE id = 4;
UPDATE tb_produtos SET descricao = "Mamão Papaya" WHERE id = 5;
UPDATE tb_produtos SET descricao = "Pêra Willians" WHERE id = 6;

create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null);

select * from tb_categorias;

insert into tb_categorias (descricao)
values ("FRUTAS"),
("VERDURAS"),
("TEMPEROS"),
("OVOS"),
("OUTROS");

alter table tb_produtos add categoria_id bigint;

alter table tb_produtos add constraint fk_produtos_categorias 
foreign key (categoria_id) references tb_categorias (id);

update tb_produtos set categoria_id = 1 where id = 1;
update tb_produtos set categoria_id = 1 where id = 2;
update tb_produtos set categoria_id = 1 where id = 4;
update tb_produtos set categoria_id = 1 where id = 5;
update tb_produtos set categoria_id = 1 where id = 6;
update tb_produtos set categoria_id = 2 where id = 7;

select * from tb_produtos order by nome desc;

select * from tb_produtos order by nome;

select * from tb_produtos where preco in (5.0,7.0,8.0);
/*claúsula "in" seleciona quais registros quer ver sobre um atributo*/










