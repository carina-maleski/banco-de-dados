create database db_pizzaria_legal;

use db_pizzaria_legal;

#criando tabelas
create table tb_categorias (
id bigint auto_increment primary key,
tipo varchar(255),
massa varchar(255)
);

create table tb_pizzas (
id bigint auto_increment primary key,
nome varchar(255),
valor decimal(5,2),
tamanho varchar(255),
categoria_id bigint,
foreign key (categoria_id) references tb_categorias (id)
);

#inserindo registros
insert into tb_categorias (tipo, massa)
values ("Salgada", "Tradicional"),
("Salgada", "Integral"),
("Doce", "Tradicional"),
("Doce", "Integral"),
("Meio a meio", "Tradicional"),
("Meio a meio", "Integral");

insert into tb_pizzas (nome, valor, tamanho, categoria_id)
values ("Portuguesa Tradicional", 69.99, "Individual", 1),
("Pepperoni Supreme", 79.99, "Grande", 2),
("Calabresa com Cebola", 59.99, "Individual", 2),
("Quatro Estações", 99.99, "Grande", 5),
("Margarita Especial", 89.99, "Grande", 1),
("Frango ao Curry", 69.99, "Individual", 2),
("Atum com Azeitonas", 79.99, "Grande", 1),
("Pizza de Camarão", 119.99, "Grande", 1),
("Chocolate com Morango", 129.99, "Grande", 4),
("Banana Caramelizada", 59.99, "Individual", 5),
("Morango com Nutella", 79.99, "Grande", 3),
("Prestígio de Chocolate", 69.99, "Individual", 4);

#visualização
select * from tb_categorias;

select * from tb_pizzas;

select * from tb_pizzas where valor > 45.00;

select * from tb_pizzas where valor > 75.00;

select * from tb_pizzas where valor between 50.00 and 100.00;

select * from tb_pizzas where valor between 90.00 and 130.00;

select * 
from tb_pizzas inner join tb_categorias
on tb_pizzas.categoria_id = tb_categorias.id;

select nome, valor, tamanho, tb_categorias.tipo, tb_categorias.massa
from tb_pizzas inner join tb_categorias
on tb_pizzas.categoria_id = tb_categorias.id;

select * 
from tb_pizzas inner join tb_categorias
on tb_pizzas.categoria_id = tb_categorias.id
where tb_categorias.id = 3 or tb_categorias.id = 4;