#criação database
create database db_farmacia_bem_estar;

use db_farmacia_bem_estar;

#criação tabelas
create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null,
bula boolean not null
);

create table tb_produtos (
id bigint auto_increment primary key,
nome varchar(255) not null,
preco decimal(10,2) not null,
quantidade int not null,
datadevalidade date,
categoria_id bigint,
foreign key (categoria_id) references tb_categorias(id)
);


#inserindo dados
insert into tb_categorias (descricao, bula)
values ("Comprimido",1), #1
("Pomada",1), #2
("Solução",1), #3
("Acessórios",0), #4
("Cuidado pessoal",0), #5
("Bomboniere",0); #6

insert into tb_produtos (nome, preco, quantidade, datadevalidade, categoria_id)
values ("Analgésico SemDor", 12.99, 50, '2024-12-31', 1),
("Creme Hidratante Dermacare", 15.49, 100, '2025-06-30',5),
("Vitamina C 1000mg", 19.99, 120, '2024-09-15',1),
("Gel Antisséptico", 5.99, 200, '2025-03-01',5),
("Shampoo Anticaspa", 9.99, 80, '2024-10-15',5),
("Soro Fisiológico 250ml", 4.49, 150, '2025-04-30',3),
("Protetor Solar FPS 50", 24.99, 60, '2024-08-20',5),
("Enxaguante Bucal", 8.79, 120, '2024-11-25',5),
("Gel para Alívio de Queimaduras", 11.49, 70, '2024-09-05',2),
("Anti-inflamatório", 18.49, 90, '2025-03-20',1),
("Chocolate Ao Leite Diet 100g", 8.99, 50, '2025-06-01', 6),
("Balas Sortidas", 3.49, 80, '2024-09-30', 6);

insert into tb_produtos (nome, preco, quantidade, categoria_id)
values ("Presilha Decorativa Floral", 7.99, 40, 4),
("Faixa de Cabelo Estampada", 5.49, 60,4),
("Termômetro Digital", 17.99, 40, 4),
("Cotonetes", 2.99, 300,5);


#visualização
select * from tb_produtos;

select * from tb_categorias;

select * from tb_produtos
where preco > 50.00;

select * from tb_produtos
where preco > 10.00;

select * from tb_produtos
where preco between 5.00 and 60.00;

select * from tb_produtos
where preco between 5.00 and 15.00;

select * from tb_produtos
where nome like "%c%";

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
where tb_categorias.id = 5;

select tb_categorias.id, tb_categorias.descricao, count(tb_categorias.descricao) quantidade
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
group by tb_categorias.id;

select tb_categorias.id, tb_categorias.descricao, sum(tb_produtos.quantidade) estoque, avg(tb_produtos.preco) preco_medio
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
group by tb_categorias.id;