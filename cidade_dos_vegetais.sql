#criação database
create database db_cidade_dos_vegetais;

use db_cidade_dos_vegetais;

#criação tabelas
create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null,
porcionado boolean not null
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
insert into tb_categorias (descricao, porcionado)
values ("Frutas",1), #1
("Legumes",1), #2
("Verduras",0), #3
("Ovos",0), #4
("Congelados",0), #5
("Outros",0); #6

insert into tb_produtos (nome, preco, quantidade, datadevalidade, categoria_id)
values ("Maçã Gala", 2.99, 50, '2025-01-15',1),
("Alface Crespa", 1.49, 30, '2024-12-10',3),
("Cenoura Orgânica", 3.99, 40, '2024-11-30',2),
("Banana Prata", 2.49, 60, '2025-02-20',1),
("Tomate Italiano", 2.79, 45, '2025-01-05',1),
("Uva Thompson Sem Sementes", 5.99, 25, '2025-02-10',1),
("Pepino Japonês", 1.79, 35, '2024-12-20',2),
("Morango Orgânico", 7.99, 20, '2025-03-05',5),
("Abacaxi Maduro", 8.49, 15, '2025-01-25',1),
("Kiwi Fresco", 4.29, 30, '2025-02-15',1),
("Pêra Williams", 3.49, 40, '2025-03-20',1),
("Couve-Flor Orgânica", 2.99, 25, '2025-01-30',2),
("Limão Siciliano", 1.99, 50, '2024-12-15',1),
("Melancia Docinha", 12.99, 10, '2025-02-05',1),
("Laranja Valencia", 2.29, 45, '2025-01-10',1),
("Ovos Brancos - Dúzia", 5.99, 20, '2024-12-15',4),
("Ovos Orgânicos - Meia Dúzia", 8.49, 15, '2025-01-10',4);

#visualização
select * from tb_produtos;

select * from tb_categorias;

select * from tb_produtos where preco > 50.00;
select * from tb_produtos where preco > 10.00;

select * from tb_produtos where preco between 50.00 and 150.00;
select * from tb_produtos where preco between 5.00 and 10.00;

select * from tb_produtos where nome like "%c%";

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
where tb_categorias.id = 2;