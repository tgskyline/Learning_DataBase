/*
Desafio 3 - Consultas juntando tabelas com OUTER JOIN
Neste desafio voc� vai utilizar o SQL Management Studio para fazer algumas consultas juntando dados de tabelas diferentes utilizado op��es de OUTER JOIN. Se necess�rio acesse Videoaula - Prepara��o do ambiente de pr�tica para realizar a configura��o.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Liste o n�mero de matr�cula e nome dos empregados e nome e parentesco dos seus dependentes. Considere tamb�m os funcion�rios que n�o tem dependentes.

2 - Liste o n�mero de matr�cula e nome dos empregados que n�o tem dependentes cadastrados.

3 - Listar os nomes dos projetos, os locais de execu��o, o departamento, e os gerentes respons�veis. Considere tamb�m os departamentos sem projeto e sem gerente.
*/

-- 1 - Liste o n�mero de matr�cula e nome dos empregados e nome e parentesco dos seus dependentes. Considere tamb�m os funcion�rios que n�o tem dependentes.


use bd_empresa

sp_help

select *
from empregado

select *
from dependente

select e.num_matricula, e.nom_empregado, d.nom_dependente, d.dsc_parentesco
from empregado e
left join dependente d on e.num_matricula = d.num_matricula

2 - Liste o n�mero de matr�cula e nome dos empregados que n�o tem dependentes cadastrados.


select e.num_matricula, e.nom_empregado, d.nom_dependente, d.dsc_parentesco
from empregado e
left join dependente d on e.num_matricula = d.num_matricula
where d.nom_dependente is null and d.dsc_parentesco is null


3 - Listar os nomes dos projetos, os locais de execu��o, o departamento, e os gerentes respons�veis. Considere tamb�m os departamentos sem projeto e sem gerente.

select *
from empregado

select *
from projeto

select *
from departamento

select *
from alocacao

select p.nom_projeto, p.nom_local, d.nom_depto, e.nom_empregado
from projeto p
right join departamento d on d.cod_depto = p.cod_depto 
left join empregado e on e.num_matricula = d.num_matricula_gerente

-- Resolu��o do Professor

SELECT p.nom_projeto, 
p.nom_local, 
d.nom_depto, 
nom_empregado
FROM projeto p
RIGHT JOIN departamento d on d.cod_depto = p.cod_depto
LEFT JOIN empregado e on e.num_matricula = d.num_matricula_gerente