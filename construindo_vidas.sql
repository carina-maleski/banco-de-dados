#criação database
create database db_construindo_vidas;

use db_construindo_vidas;

#criação tabelas
create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null,
fretegratis boolean not null
);

#criação tabelas
create table tb_tamanho (
id bigint auto_increment primary key,
tamanho varchar(255) not null
);

create table tb_produtos (
id bigint auto_increment primary key,
nome varchar(255) not null,
preco decimal(10,2) not null,
quantidade int not null,
tamanho_id bigint,
categoria_id bigint,
foreign key (categoria_id) references tb_categorias(id),
foreign key (tamanho_id) references tb_tamanho(id)
);

#inserindo dados
insert into tb_categorias (descricao, fretegratis)
values ("Tijolos e Blocos", 1),
("Tintas e Revestimentos", 0),
("Cimentos e Argamassas", 0),
("Telhados e Coberturas", 1),
("Iluminação", 1),
("Ferramentas e Acessórios", 0);

insert into tb_tamanho (tamanho)
values ("Pequeno"),
("Médio"),
("Grande"),
("Extra grande");

insert into tb_produtos (nome, preco, quantidade, tamanho_id, categoria_id)
values ("Tijolo Cerâmico Vermelho", 1.99, 500,2, 1),
("Bloco de Concreto 10x20x40", 2.49, 300,2, 1),
("Tinta Acrílica Branca", 19.99, 100,2, 2),
("Revestimento Cerâmico Bege", 14.99, 150,1, 2),
("Saco de Cimento 50kg", 85.99, 50,4, 3),
("Argamassa Multiuso 5kg", 18.99, 200,2, 3),
("Telha de Cerâmica", 5.49, 120,3, 4),
("Telha de Fibrocimento Ondulada", 7.99, 80,3, 4),
("Refletor LED 30W", 34.99, 50,2, 5),
("Luminária Solar para Jardim", 22.49, 80,2, 5),
("Furadeira de Impacto 600W", 389.99, 20,3, 6),
("Esmerilhadeira Angular 4.5", 69.99, 30,3, 6),
("Broca para Concreto 10mm", 4.49, 100,1, 6),
("Vassoura para Cimento", 12.99, 70,2, 3),
("Primer para Paredes", 15.99, 60,2, 2),
("Martelo de Borracha", 19.49, 40,1, 6),
("Rolo de Pintura Profissional", 7.99, 120,1, 2),
("Escada de Alumínio 5 Degraus", 359.99, 15,4, 6),
("Serra Circular 7.25", 229.99, 10,3, 6);

#visualização
select * from tb_produtos;

select * from tb_categorias;

select * from tb_produtos where preco > 100.00;
select * from tb_produtos where preco > 20.00;

select * from tb_produtos where preco between 70.00 and 150.00;

select * from tb_produtos where nome like "%ca%";

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;

select * 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id
where tb_categorias.id = 2;

select tb_produtos.id, nome, preco, quantidade, tb_categorias.descricao, tb_categorias.fretegratis 
from tb_produtos inner join tb_categorias
on tb_produtos.categoria_id = tb_categorias.id;