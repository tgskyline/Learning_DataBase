/*
Manipula��o  do banco de dados com INSERT
*/

--  A sintaxe do comando insert � INSERT INTO

insert into empregado (MatEmp, NomEmp, EndEmp, CidEmp) 
values (10, 'Marcos Ramos', 'Rua X', 'Itabira');

select *
from empregado

/*
No exemplo abaixo � mostrado que � poss�vel fazer inser��es sem descrever os campos,
mas � necess�rio ter conhecimento das caracteristicas deles, como quais s�o n�mericos ou caracteres
*/

insert into empregado values (11, 'Marcos Ramos', null, 'SP');

insert into empregado (MatEmp, NomEmp, EndEmp, CidEmp) 
values (12, 'Mario Andrade', 'Rua 4', 'Belo Horizonte');

/*
Inserindo Dependentes
*/

insert into dependente (nomdep, datnasc, matemp)
values ('Carlos Ramos', '2003-01-10', 10); 

insert into dependente (nomdep, datnasc, matemp)
values ('Carlos Ramos', '2003-01-10', 11); 

select *
from dependente

/*
Dele��o de dados
*/

delete 
from empregado
where matemp = 12

/*
Update
*/

update empregado
set EndEmp = 'Rua Branca'
where matemp = 10

update dependente
set nomdep = 'Joa Andrade'
where matemp = 11


/*
Pr�tica

Agora altere a tabela dependente para propagar a exclus�o de um registro
empregado a todos os seus dependentes.
*/

--Uso do comando cria um relacionamento de dele��o em cascata quando o registro pai for exclu�do os relacionado tamb�m ser�o.

alter table dependente drop constraint fk_emp_dep

alter table dependente add constraint fk_emp_dep foreign key
(matemp) references empregado (matemp) On delete cascade

delete 
from empregado
where matemp = 11

select *
from empregado

select *
from dependente