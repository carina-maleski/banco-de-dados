create database db_generation_game_online;

use db_generation_game_online;

create table tb_classes (
id bigint auto_increment primary key,
grupo varchar(255),
origem varchar(255),
fortaleza varchar(255),
fraqueza varchar(255)
);
#add 2 atributos alem da pk

create table tb_personagens (
id bigint auto_increment primary key,
nome varchar(255),
poderdeataque int,
poderdedefesa int,
classes_id bigint,
foreign key (classes_id) references tb_classes(id)
);
#add 4 atributos alem da pk + 1 fk de classes

drop table tb_personagens;

#inserindo dados
insert into tb_classes (grupo, origem, fortaleza, fraqueza)
values ("Guerreire", "Montanha","Alta resistência","Baixa velocidade"),
("Arqueire", "Floresta","Combate à distância","Baixa resistência"),
("Bruxe", "Bosque", "Combate à distância","Baixa resistência"),
("Ninja", "Deserto","Altíssimo dano","Baixa resistência"),
("Curandeire","Lago","Alta resistência","Baixo dano");

insert into tb_personagens (nome, poderdeataque, poderdedefesa, classes_id)
values ('Dragão de Ébano', 8000, 6000, 1),
('Tempestade Astral', 5500, 1500, 2),
('Sábio das Estrelas', 3000, 1000, 3),
('Caçador de Sombras', 7000, 5500, 4),
('Lobo da Lua', 2000, 8000, 5),
('Espectro do Abismo', 9000, 5000, 3),
('Cavaleiro da Aurora', 6000, 7000, 1),
('Círculo de Fogo', 1500, 4000, 5),
('Arpoador Sombrio', 5000, 8500, 4),
('Fênix da Alvorada', 8500, 1500, 2);

#visualizações
select * from tb_personagens;

select * from tb_classes;

select * from tb_personagens where poderdeataque > 2000;

select * from tb_personagens where poderdedefesa between 1000 and 2000;

select * from tb_personagens where nome like "%c%";

select * 
from tb_personagens inner join tb_classes
on tb_personagens.classes_id = tb_classes.id;

select * 
from tb_personagens inner join tb_classes
on tb_personagens.classes_id = tb_classes.id
where tb_classes.id = 1;