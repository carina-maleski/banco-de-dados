#database
/*criando o database*/
CREATE DATABASE db_quitanda;

drop database db_quitanda;

/*acessando o database*/
USE db_quitanda;

#criando tabelas
CREATE TABLE tb_produtos (
id BIGINT auto_increment,
nome VARCHAR(255) NOT NULL,
quantidade INT,
datavalidade DATE,
preco DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id)
);

create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null);


#inserindo registros em produtos
INSERT INTO tb_produtos (nome, quantidade, datavalidade,preco)
VALUES ("Tomate",100,"2023-09-13",8.00);

INSERT INTO tb_produtos (nome, quantidade, datavalidade,preco)
VALUES ("Abacaxi",50,"2023-03-18",12.00),
("Goiaba",150,"2023-05-20",9.00),
("Morango",10,"2023-02-16",7.00),
("Mamão",100,"2023-06-30",9.00),
("Pêra",20,"2023-07-01",12.00),
("Abobrinha",200,"2023-03-18",6.00);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoria_id)
values ("Batata doce", 200, "2022-03-09", 10.00, 3),
("Alface", 300, "2022-03-10", 7.00, 2),
("Cebola", 120, "2022-03-08", 5.00, 3),
("Ovo Branco", 100, "2022-03-07", 15.00, 5),
("Agrião", 150, "2022-03-06", 3.00, 2),
("Cenoura", 1800, "2022-03-09", 3.50, 3),
("Pimenta", 1100, "2022-03-15", 10.00, 4),
("Alecrim", 130, "2022-03-10", 5.00, 4),
("Manga", 200, "2022-03-07", 5.49, 1),
("Couve", 100, "2022-03-12", 1.50, 2),
("Rabanete", 1200, "2022-03-15", 13.00, 3),
("Grapefruit", 3000, "2022-03-13", 50.00, 1);

INSERT INTO tb_produtos (nome, quantidade, preco)
values ("Sacola Cinza", 1118, 0.50),
("Sacola Verde", 1118, 0.50);

#inserindo registros em categorias
insert into tb_categorias (descricao)
values ("FRUTAS"),
("VERDURAS"),
("TEMPEROS"),
("OVOS"),
("OUTROS");

#criando novo atributo e novo relacionamento com chave estrangeira
alter table tb_produtos add categoria_id bigint;

alter table tb_produtos add constraint fk_produtos_categorias
foreign key (categoria_id) references tb_categorias (id);


#alterando atributos da tabela produtos
ALTER TABLE tb_produtos MODIFY preco DECIMAL(6,1);

ALTER TABLE tb_produtos ADD descricao VARCHAR(255);

#inserindo registros em descricao e em categoria
#UPDATE tb_produtos SET descricao = "Tomate cereja" WHERE nome = "Tomate";
UPDATE tb_produtos SET descricao = "Tomate cereja" WHERE id = 1;
UPDATE tb_produtos SET descricao = "Abacaxi Pérola" WHERE id = 2;
UPDATE tb_produtos SET descricao = "Morango" WHERE id = 4;
UPDATE tb_produtos SET descricao = "Mamão Papaya" WHERE id = 5;
UPDATE tb_produtos SET descricao = "Pêra Willians" WHERE id = 6;

update tb_produtos set categoria_id = 1 where id = 1;
update tb_produtos set categoria_id = 1 where id = 2;
update tb_produtos set categoria_id = 1 where id = 4;
update tb_produtos set categoria_id = 1 where id = 5;
update tb_produtos set categoria_id = 1 where id = 6;

#deletando um item
DELETE FROM tb_produtos WHERE id = 3;

#desativando modo seguro
#SET SQL_SAFE_UPDATES = 0;

#alterando o preço do produto com id 5
UPDATE tb_produtos SET preco = 5.0 WHERE id = 5;

#visualizações
select * from tb_categorias;

select * from tb_produtos order by nome desc;

select * from tb_produtos order by nome;

select * from tb_produtos order by nome, preco asc;

select * from tb_produtos where preco in (5.0,7.0,8.0);
/*claúsula "in" seleciona quais registros quer ver sobre um atributo*/

select * from tb_produtos where preco between 5.00 and 10.00;

select * from tb_produtos where nome like "tomate";

select * from tb_produtos where nome like "a%";

select * from tb_produtos where nome like "a_o%";
/*"a_o%" significa: 
primeira letra == a; 
segunda letra = _ == pode ser qualquer uma; 
terceira letra == o; 
quarta letra em diante = qualquer coisa*/

SELECT * FROM tb_produtos WHERE preco > 6.0 AND quantidade < 80;

SELECT nome FROM tb_produtos;

SELECT id,nome,preco FROM tb_produtos;

SELECT * FROM tb_produtos WHERE id =3;

SELECT * FROM tb_produtos WHERE preco <> 10.0;

SELECT @@collation_database;


#criando joins
SELECT nome, tb_produtos.quantidade, tb_produtos.datavalidade, tb_produtos.preco, tb_categorias.descricao
FROM tb_produtos
inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;
/*inner join traz registros relacionados*/

SELECT *
FROM tb_produtos
left join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;
/*left join traz todos os registros da tabela da esquerda e relacionamento com a da direita*/

SELECT *
FROM tb_produtos
right join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;
/*right join traz todos os registros da tabela da direita e relacionamento com a da esquerda*/


#funções matemáticas
select avg(preco) as media
from tb_produtos;

select sum(quantidade) as soma
from tb_produtos;

select max(preco) as maior_preço
from tb_produtos;

#agrupamento
select tb_categorias.descricao, avg(preco) preco_medio
from tb_produtos inner join tb_categorias
on tb_categorias.id = tb_produtos.categoria_id
group by tb_categorias.descricao;

select tb_categorias.descricao, sum(quantidade) total
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
group by tb_categorias.descricao;