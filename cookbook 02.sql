create database db_bbquitanda;
use db_bbquitanda;
create table tb_produtos(
id bigint auto_increment not null,
nome varchar(255) not null,
quantidade int,
datavalidade date,
preco decimal(6,2) not null,
primary key (id));

select * from tb_produtos;

select * from tb_produtos where id = 1;

select * from tb_produtos where preco > 5 and quantidade < 100;

select nome, preco from tb_produtos;

insert into tb_produtos (nome, quantidade, datavalidade, preco)
values ("Tomate", 100, "2023-12-15", 8.00),
("Maçã", 20, "2023-12-15", 5.00),
("Laranja", 50, "2023-12-15", 10.00),
("Banana", 200, "2023-12-15", 12.00),
("Uva", 1200, "2023-12-15", 30.00),
("Pêra", 500, "2023-12-15", 2.99);

alter table tb_produtos add descricao varchar(255);

insert into tb_produtos (descricao)
values
("Tomate Italiano"),
("Maçã Gala"),
("Laranja Pêra"),
("Banana Prata"),
("Uva Thompson"),
("Pêra Willians");

update tb_produtos set 
descricao = "Pêra Willians"
where id = 6
;

alter table tb_produtos add column teste varchar(2);

alter table tb_produtos drop teste;

delete from tb_produtos where id = 6;

select * from tb_produtos where id = 6;

delete from tb_produtos;

alter table tb_produtos change nome nomeproduto varchar(255);