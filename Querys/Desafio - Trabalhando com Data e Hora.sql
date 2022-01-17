/*
Desafio 1 - Trabalhando com data e hora
Neste desafio voc� vai utilizar o SQL Management Studio para fazer algumas consultas utilizando campos do tipo data e hora. Se necess�rio acesse Videoaula - Prepara��o do ambiente de pr�tica para realizar a configura��o.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Gerar a lista de aniversariantes da empresa com m�s, dia e nome do empregado ordem cronol�gica

2 - Listar os departamentos e seus gerentes com tempo de ger�ncia em anos ordenando pelo mais antigo

3 - Listar os funcion�rios  que ter�o mais que 65 a partir de 2021
*/

use bd_empresa

-- 1 - Gerar a lista de aniversariantes da empresa com m�s, dia e nome do empregado ordem cronol�gica

SELECT MONTH(dat_nascimento) AS M�s, 
       DAY (dat_nascimento) AS Dia, 
       nom_empregado
FROM empregado
ORDER BY 1, 2

-- 2 - Listar os departamentos e seus gerentes com tempo de ger�ncia em anos ordenando pelo mais antigo

-- Op��o 1
SELECT nom_depto, 
       nom_empregado, 
       YEAR(getdate()) - YEAR(dat_inicio_gerente) tempo_gerencia
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente
ORDER BY 3 DESC

-- Op��o 2
SELECT nom_depto, 
       nom_empregado, 
       DATEDIFF(year, dat_inicio_gerente, getdate())tempo_gerencia
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente
ORDER BY 3 DESC

-- 3 - Listar os funcion�rios  que ter�o mais que 65 a partir de 2021

-- Op��o 1
SELECT nom_empregado, 
       YEAR(getdate()) - YEAR(dat_nascimento) AS idade_atual,
       YEAR(getdate()) + 1 - YEAR(dat_nascimento) AS idade_proximo_ano
FROM empregado
WHERE YEAR(getdate()) + 1 - YEAR(dat_nascimento) >= 65

-- Op��o 2
SELECT nom_empregado, 
       DATEDIFF(year, dat_nascimento, getdate()) AS idade_atual,
       DATEDIFF(year, dat_nascimento, DATEADD(year, 1, getdate()) ) AS idade_proximo_ano
FROM empregado
WHERE YEAR(getdate()) + 1 - YEAR(dat_nascimento) >= 65
