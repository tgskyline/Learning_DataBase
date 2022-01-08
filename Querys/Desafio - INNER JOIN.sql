/*Desafio 2 - Consultas juntando tabelas com INNER JOIN
Neste desafio voc� vai utilizar o SQL Management Studio para fazer algumas consultas juntando dados de tabelas diferentes.

Se necess�rio acesse Videoaula - Prepara��o do ambiente de pr�tica para realizar a configura��o.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Liste o n�mero de matr�cula e nome do empregados e nome e parentesco de todos os dependentes

2 - Liste nome dos departamentos com n�mero de matr�cula e nome de todos os funcion�rio. Ordene o resultado por departamento e nome do empregado.

3 - Para cada departamento um dos funcion�rios tem a fun��o de ger�ncia. Liste nome dos departamentos com n�mero de matr�cula e nome do gerente respons�vel.

4 - Liste o n�mero de matr�cula e nome dos supervisores e n�mero de matr�cula e nome dos funcion�rios sob sua supervis�o. Ordene os supervisores e empregados em ordem alfab�tica

5 - Liste os funcion�rios dos projetos de BH com o total de horas alocado.  Exibir nome e local do projeto, n�mero de matr�cula e nome do empregado e o total de horas alocado.

 */

 -- 1 - Liste o n�mero de matr�cula e nome do empregados e nome e parentesco de todos os dependentes

 select * 
 from empregado

 select *
 from dependente

 select *
 from departamento

 select E.num_matricula, E.nom_empregado, D.dsc_parentesco, D.nom_dependente
 from empregado E
 join dependente D on E.num_matricula = D.num_matricula

 -- 2 - Liste nome dos departamentos com n�mero de matr�cula e nome de todos os funcion�rio. Ordene o resultado por departamento e nome do empregado.

 select * 
 from empregado

 select *
 from departamento

 select d.nom_depto, e.num_matricula, e.nom_empregado
 from empregado e
 join departamento d on e.cod_depto = d.cod_depto
 order by nom_depto, nom_empregado

 -- 3 - Para cada departamento um dos funcion�rios tem a fun��o de ger�ncia. Liste nome dos departamentos com n�mero de matr�cula e nome do gerente respons�vel.

 select * 
 from empregado

 select *
 from departamento

 select d.nom_depto, e.num_matricula, e.nom_empregado
 from empregado e
 join departamento d on e.num_matricula = d.num_matricula_gerente

 -- 4 - Liste o n�mero de matr�cula e nome dos supervisores e n�mero de matr�cula e nome dos funcion�rios sob sua supervis�o. Ordene os supervisores e empregados em ordem alfab�tica

 select * 
 from empregado

 select *
 from departamento

 select sup.num_matricula as matricula_supervisor,
		sup.nom_empregado as nome_supervisor,
		e.num_matricula as matricula_empregado, 
		e.nom_empregado as nome_empregado
 from empregado e
 join empregado sup on e.num_matricula = sup.num_matricula_supervisor

 -- 5 - Liste os funcion�rios dos projetos de BH com o total de horas alocado.  Exibir nome e local do projeto, n�mero de matr�cula e nome do empregado e o total de horas alocado.

  select * 
 from empregado

  select *
 from alocacao

  select *
 from projeto

  select p.nom_projeto as nome_projeto, 
		 p.nom_local as local_projeto, 
		 e.num_matricula as matricula_empregado,
		 e.nom_empregado as nome_empregado, 
		 al.num_horas as total_horas
 from projeto p
 inner join alocacao al on p.cod_projeto = al.cod_projeto
 inner join empregado e on e.num_matricula = al.num_matricula
 Where nom_local = 'BH'

