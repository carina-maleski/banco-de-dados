create database db_rh;
/*1. Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. */

use db_rh;

create table tb_cargo (
id bigint auto_increment primary key,
nomedocargo varchar(255)
);

create table tb_funcionarios (
id bigint auto_increment primary key,
nome varchar(255) not null,
sobrenome varchar(255) not null,
datadeadmissao date,
cargo_id bigint,
salario decimal (10,2),
foreign key (cargo_id) references tb_cargo (id)
);
/*2. Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.*/

insert into tb_cargo (nomedocargo)
values ("Gerência"),
("Técnico"),
("Operacional"),
("Administrativo"),
("Vendas"),
("Marketing");

insert into tb_funcionarios (nome, sobrenome, datadeadmissao, cargo_id, salario) 
values ("João", "Silva", "2022-01-08", 2, 5000.00),
("Maria", "Santos", "2021-03-15", 4, 4000.00),
("Pedro", "Oliveira", "2023-05-20", 1, 10000.00),
("Ana", "Pereira", "2020-11-10", 3, 1800.00),
("Carlos", "Costa", "2022-09-02", 5, 5500.00),
("Juliana", "Martins", "2021-07-12", 6, 3000.00),
("Ricardo", "Rodrigues", "2023-02-28", 2, 1900.00),
("Fernanda", "Lima", "2020-06-08", 4, 4500.00),
("Gabriel", "Almeida", "2022-12-05", 1, 12200.00),
("Isabel", "Gomes", "2021-04-18", 3, 2800.00);
/*3. Insira nesta tabela no mínimo 5 dados (registros).*/

select * from tb_funcionarios;

select * from tb_funcionarios where salario > 2000.00;
/*4. Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.*/

select * from tb_funcionarios where salario > 2000.00 order by nome;

select * from tb_funcionarios where salario < 2000.00;
/*5. Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.*/

update tb_funcionarios set salario = 4300.99 where id = 2;
/*6. Ao término atualize um registro desta tabela através de uma query de atualização.*/

