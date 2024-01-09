create database db_ecommerce;
/*1. Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. */

use db_ecommerce;

create table tb_marca (
id bigint auto_increment primary key,
marca varchar(255)
);

create table tb_tamanho (
id bigint auto_increment primary key,
tamanho varchar(5)
);

create table tb_categoria (
id bigint auto_increment primary key,
categoria varchar(255)
);

create table tb_produto (
id bigint auto_increment primary key,
nome varchar(255) not null,
tamanho_id bigint,
preco decimal(10,2),
categoria_id bigint,
quantidade bigint,
marca_id bigint,
foreign key (marca_id) references tb_marca (id),
foreign key (tamanho_id) references tb_tamanho (id),
foreign key (categoria_id) references tb_categoria (id)
);
/*2. Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.*/

insert into tb_marca (marca)
values ("Havaianas"),
("Farm"),
("Cantão"),
("Animale"),
("Hering");

select * from tb_marca;

insert into tb_tamanho (tamanho)
values ("PP"),
("P"),
("M"),
("G"),
("GG"),
("XGG");

select * from tb_tamanho;

insert into tb_categoria (categoria)
values ("Camisetas"),
("Calças"),
("Vestidos"),
("Casacos"),
("Shorts"),
("Biquínis"),
("Saias"),
("Calçados"),
("Pijama");

select * from tb_categoria;

insert into tb_produto (nome, tamanho_id, preco, categoria_id, quantidade, marca_id)
values ("Camiseta Branca", 3, 129.99, 1, 50, 1),
("Calça Jeans Skinny", 4, 289.99, 2, 30, 2),
("Vestido Floral", 2, 169.99, 3, 20, 3),
("Jaqueta de Couro", 5, 529.99, 4, 15, 4),
("Shorts de Corrida", 6, 59.99, 5, 40, 5),
("Biquíni Estampado", 1, 119.99, 6, 25, 1),
("Conjunto Listrado", 6, 139.99, 9, 35, 2),
("Camiseta estampada", 1, 169.99, 1, 60, 3),
("Alpargata Lisa", 1, 149.99, 8, 100, 1),
("Camisola de Algodão", 2, 159.99, 9, 10, 3),
("Vestido de Festa", 3, 659.99, 3, 10, 4),
("Camiseta Azul", 2, 59.99, 1, 100, 2);
/*3. Insira nesta tabela no mínimo 8 dados (registros).*/

select * from tb_produto;

select * from tb_produto where preco > 500;
/*4. Faça um SELECT que retorne todes os produtos com o valor maior do que 500.*/

select * from tb_produto where preco < 500;
/*5. Faça um SELECT que retorne todes os produtos com o valor menor do que 500.*/

update tb_produto set quantidade = 99 where id = 10;
/*6. Ao término atualize um registro desta tabela através de uma query de atualização.*/


select tb_produto.nome, tb_produto.preco, tb_produto.quantidade, tb_marca.marca
from tb_produto
inner join tb_marca
on tb_produto.marca_id = tb_marca.id
where tb_produto.quantidade > 30;

