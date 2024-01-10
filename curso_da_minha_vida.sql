#criação database
create database db_curso_da_minha_vida;

use db_curso_da_minha_vida;

#criação tabelas
create table tb_categorias (
id bigint auto_increment primary key,
descricao varchar(255) not null,
nivel varchar(255)
);

create table tb_cursos (
id bigint auto_increment primary key,
nome varchar(255) not null,
preco decimal(10,2) not null,
quantidade int not null,
prerequisitos boolean,
categoria_id bigint,
foreign key (categoria_id) references tb_categorias(id)
);

#inserindo dados
insert into tb_categorias (descricao, nivel)
values ("Desenvolvimento Web", "Intermediário"),
("Marketing Digital", "Avançado"),
("Design Gráfico", "Básico"),
("Inteligência Artificial", "Avançado"),
("Gestão de Projetos", "Intermediário");

insert into tb_cursos (nome, preco, quantidade, prerequisitos, categoria_id)
values ("Desenvolvimento Web Completo", 499.99, 150, 0, 1),
("Marketing Digital para Iniciantes", 549.99, 200, 0, 2),
("Photoshop do Básico ao Avançado", 579.99, 100, 0, 3),
("Introdução à Inteligência Artificial", 1129.99, 80, 1, 4),
("Gestão Ágil de Projetos", 1069.99, 120, 0, 5),
("JavaScript Avançado: Programação Funcional", 2189.99, 70, 1, 1),
("SEO e Estratégias de Conteúdo", 459.99, 180, 0, 2),
("Python para Ciência de Dados", 2109.99, 60, 1, 4),
("UI/UX Design: Princípios Fundamentais", 674.99, 90, 0, 3),
("Machine Learning com TensorFlow", 849.99, 40, 1, 4),
("Fundamentos de HTML e CSS", 929.99, 250, 0, 1),
("Estratégias de Vendas Online", 1054.99, 160, 0, 2),
("Java Básico: Introdução à Programação", 379.99, 110, 0, 1),
("Redes Sociais para Negócios", 739.99, 220, 0, 2),
("React.js: Construindo Aplicações Web", 1094.99, 80, 1, 1),
("Gestão de Equipes e Liderança", 564.99, 140, 0, 5),
("Vue.js: Desenvolvimento de Interfaces", 784.99, 100, 1, 1);

#visualização
select * from tb_cursos;

select * from tb_categorias;

select * from tb_cursos where preco > 500.00;

select * from tb_cursos where preco between 600.00 and 1000.00;

select * from tb_cursos where nome like "%j%";

select * 
from tb_cursos inner join tb_categorias
on tb_cursos.categoria_id = tb_categorias.id;

select * 
from tb_cursos inner join tb_categorias
on tb_cursos.categoria_id = tb_categorias.id
where tb_categorias.id = 1;

select tb_cursos.id, nome, preco, quantidade, tb_categorias.descricao, tb_categorias.nivel 
from tb_cursos inner join tb_categorias
on tb_cursos.categoria_id = tb_categorias.id;