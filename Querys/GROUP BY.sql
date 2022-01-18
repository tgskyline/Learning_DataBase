/*
Agrupando dados como fun��es que GROUP BY

Fun��es para calcular dados agrupados
� COUNT �quantidade
� SUM �soma 
� MIN �menor valor
� MAX �maior valor
� AVG �m�dia dos valores

*/

-- Fun��es de agrupamento

use bd_empresa

SELECT COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado

-- Agrupando dados 

SELECT sig_uf,
COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado
GROUP BY sig_uf
ORDER BY 3


/*
HAVING

Comando de filtro para as fun��es agregadas
HAVING x WHERE
� HAVING filtra o resultado de fun��es agregadas e
WHERE filtra linhas de uma tabela
*/

-- Usando HAVING

SELECT sig_uf,
COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado
GROUP BY sig_uf
HAVING MIN(val_salario) < 1000
ORDER BY 3

/*
Listar a m�dia e a soma dos sal�rios por departamento, quando a soma for 
maior que 2.500,00
*/

SELECT e.cod_depto, AVG(e.val_salario) AS media, SUM(e.val_salario) AS soma 
FROM empregado e
GROUP BY e.cod_depto
HAVING SUM(e.val_salario) > 2500.00

/*
Listar a m�dia e a soma dos sal�rios por departamento, quando a soma for  
maior que 2.500,00 e a m�dia maior que 2.200,00
*/

SELECT e.cod_depto, AVG(e.val_salario) AS media, SUM(e.val_salario) AS soma FROM 
empregado e
GROUP BY e.cod_depto
HAVING SUM(e.val_salario) > 2500.00 
AND AVG(e.val_salario) > 2200.00

/*
Listar os departamentos com 2 ou mais empregados
*/

SELECT e.cod_depto, d.nom_depto, COUNT(*) AS total_func
FROM empregado e 
INNER JOIN departamento d ON e.cod_depto = d.cod_depto
GROUP BY e.cod_depto, d.nom_depto
HAVING COUNT(*) >= 2




