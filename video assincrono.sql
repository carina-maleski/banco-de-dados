create database db_estoque;

use db_estoque;

create table tb_marcas (
id bigint auto_increment,
nome varchar(255),
ativo boolean,
primary key (id)
);

insert into tb_marcas (nome, ativo)
values ("Adidas",true);

insert into tb_marcas (nome, ativo)
values ("Farm",true),
("Puma",true),
("Salinas",true),
("Antix",true),
("Converse",true),
("Dakota",true),
("Grenda",true),
("Havaianas",true),
("Sidewalk",true),
("Mob",true),
("Vix",true),
("Zara",true);

update tb_marcas set ativo = true where id = 2;

delete from tb_marcas where id = 3;

alter table tb_marcas add descricao varchar(255);
alter table tb_marcas drop column descricao;

create table tb_produtos (
id bigint auto_increment,
nome varchar(255) not null,
preco decimal,
marca_id bigint not null,
primary key (id),
foreign key (marca_id) references tb_marcas (id)
);

select * from tb_marcas;

select nome from tb_marcas;

select nome,ativo from tb_marcas where id <> 2;

select * from tb_produtos;

select * from tb_produtos where nome like "C%";

insert into tb_produtos (nome, preco, marca_id)
values ("Casaco", 459.9, 15),
("Camiseta", 149.9, 2),
("Tênis", 299.9, 3),
("Vestido", 349.9, 4),
("Bermuda", 159.9, 5),
("Maiô", 259.9, 6),
("Saia", 199.9, 7),
("Tênis", 359.9, 8),
("Sapatilha", 150, 9),
("Chinelo", 110, 10),
("Papete", 220, 12),
("Mochila", 379, 12);

alter table tb_produtos modify column preco decimal (10,2);