/*Dicas �teis para o SQL Management Studio
*/

-- Coment�rio para uma linha

/*Coment�rio para v�rias linhas*/

-- Trocar de banco de Dados
USE bd_filmes

--Acessar tabela de outro banco de dados
select *
from bd_filmes..filmes

-- OU
select *
from bd_filmes.dbo .filmes


/*Comando para listar as tabelas do banco de dados*/

sp_help

-- Para listar os detalhes de uma tabela

sp_help filmes
