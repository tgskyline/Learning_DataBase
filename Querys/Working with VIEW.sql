/*
VIEW
� � uma tabela virtual baseada no conjunto de 
resultados de uma instru��o SQL
� Cont�m linhas e colunas e s�o dados de uma ou mais 
tabelas reais no banco de dados gerados 
dinamicamente no momento em que � feita                         
uma refer�ncia a ela
*/

use bd_empresa

/*
Criando VIEW
Comando para cria��o de uma VIEW
*/

CREATE VIEW VW_alocacao_projeto
AS
SELECT p.cod_projeto, p.nom_projeto,
e.num_matricula, nom_empregado
FROM empregado e
JOIN alocacao a ON a.num_matricula = e.num_matricula
JOIN projeto p ON p.cod_depto = a.cod_projeto

-- Visualizando a query da VIEW
-- Comando para visualizar o campos com tipos e tamanhos

sp_help VW_alocacao_projeto

-- Comando para visualizar a query da VIEW

sp_helptext VW_alocacao_projeto

-- ALTERAR VIEW
-- Comando para alterar uma VIEW

ALTER VIEW VW_alocacao_projeto
AS
SELECT p.cod_projeto, p.nom_projeto,
e.num_matricula, nom_empregado, num_horas
FROM empregado e
JOIN alocacao a ON a.num_matricula = e.num_matricula
JOIN projeto p ON p.cod_depto = a.cod_projeto

-- EXCLUIR VIEW
-- Comando para excluir uma VIEW

DROP VIEW VW_alocacao_projeto

-- Utilizando VIEW
-- Listar as aloca��es do projeto 'Desenvolver novo produto'

SELECT *
FROM VW_alocacao_projeto
WHERE nom_projeto = 'Desenvolver novo produto'

-- Listar o total de horas alocada por empregado

SELECT nom_empregado, sum(num_horas) AS total_horas
FROM VW_alocacao_projeto
GROUP BY nom_empregado
ORDER BY sum(num_horas) desc