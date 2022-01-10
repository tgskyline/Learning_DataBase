use bd_empresa

/*
Uso do FULL, INNER, LEFT e RIGHT JOIN
*/

-- Situa��o 1: Listar todos os empregados e seus departamentos usando JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
join departamento d on d.cod_depto = e.cod_depto

-- Situa��o 2: Listar todos os empregados e seus departamentos, incluindo empregados que n�o tem departamento associado usando LEFT JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
left join departamento d on d.cod_depto = e.cod_depto

-- Situa��o 3: Listar todos os empregados e seus departamentos, incluindo departamentos que n�o tem empregados associados usando RIGTH JOIN

 select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
 from empregado e
 right join departamento d on d.cod_depto = e.cod_depto

 -- Situa��o 4: Listar todos os empregados e seus departamentos, incluindo empregados sem departamento e departamento de empregados usando FULL JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
full join departamento d on d.cod_depto = e.cod_depto

-- Situa��o 5: Listar todos os empregados que n�o tem departamento associado usando LEFT JOIN com WHERE

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
left join departamento d on d.cod_depto = e.cod_depto
where d.cod_depto is null

-- Situa��o 6: Listar todos os departamentos que n�o tem empregado associado RIGHT JOIN com WHERE		

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
right join departamento d on d.cod_depto = e.cod_depto
where e.cod_depto is null