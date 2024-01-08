create database db_escola;
/*1. Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola.*/

use db_escola;

create table tb_estudantes (
matricula bigint auto_increment primary key,
nome varchar(255) not null,
sobrenome varchar(255),
idade int,
anoescolar int,
turma char(1)
);
/*2. Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.*/


/*
6 anos - 1º ano escolar
7 a - 2º
8 a - 3º
9 a - 4º
10 a - 5º
11 a - 6º
12 a - 7º
13 a - 8º
14 a - 9º
*/


insert into tb_estudantes (nome, sobrenome, idade, anoescolar, turma)
values ("Pedro", "Silveira", 11, 6, 'B'),
("Isabela", "Martins", 9, 4, 'A'),
("Lucas", "Rocha", 14, 9, 'C'),
("Mariana", "Lima", 7, 2, 'B'),
("Gabriel", "Oliveira", 13, 8, 'A'),
("Julia", "Pereira", 10, 5, 'C'),
("Luciana", "Almeida", 12, 7, 'A'),
("Rafael", "Costa", 6, 1, 'B'),
("Larissa", "Rodrigues", 8, 3, 'C'),
("Gustavo", "Santana", 14, 9, 'B'),
("Camila", "Fernandes", 11, 6, 'C'),
("Felipe", "Vieira", 7, 2, 'A'),
("Amanda", "Cardoso", 9, 4, 'B'),
("Eduardo", "Nascimento", 13, 8, 'C'),
("Leticia", "Carvalho", 12, 7, 'B'),
("Bruno", "Mendes", 6, 1, 'A'),
("Carolina", "Dias", 10, 5, 'B'),
("Rodrigo", "Gomes", 8, 3, 'A'),
("Bianca", "Rocha", 14, 9, 'C'),
("Thiago", "Sousa", 11, 6, 'B');
/*3. Insira nesta tabela no mínimo 8 dados (registros).*/

alter table tb_estudantes add column nota decimal (4,2);

select * from tb_estudantes;

select * from tb_estudantes order by anoescolar;

update tb_estudantes set nota = 4.00 where matricula = 1;
update tb_estudantes set nota = 8.00 where matricula = 2;
update tb_estudantes set nota = 9.00 where matricula = 3;
update tb_estudantes set nota = 5.50 where matricula = 4;
update tb_estudantes set nota = 4.50 where matricula = 5;
update tb_estudantes set nota = 10.00 where matricula = 6;
update tb_estudantes set nota = 8.00 where matricula = 7;
update tb_estudantes set nota = 6.00 where matricula = 8;
update tb_estudantes set nota = 7.00 where matricula = 9;
update tb_estudantes set nota = 5.00 where matricula = 10;
update tb_estudantes set nota = 8.50 where matricula = 11;
update tb_estudantes set nota = 9.00 where matricula = 12;
update tb_estudantes set nota = 10.00 where matricula = 13;
update tb_estudantes set nota = 6.50 where matricula = 14;
update tb_estudantes set nota = 4.50 where matricula = 15;
update tb_estudantes set nota = 7.50 where matricula = 16;
update tb_estudantes set nota = 8.00 where matricula = 17;
update tb_estudantes set nota = 6.00 where matricula = 18;
update tb_estudantes set nota = 6.50 where matricula = 19;
update tb_estudantes set nota = 9.00 where matricula = 20;

select * from tb_estudantes where nota > 7.00;
/*4. Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.*/

select * from tb_estudantes where nota < 7.00;
/*5. Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.*/

update tb_estudantes set nota = 6.99 where matricula = 8;
/*6. Ao término atualize um registro desta tabela através de uma query de atualização.*/
