/*
Desafio 4 - Unindo resultados de queries - UNION
Neste desafio voc� vai utilizar o SQL Management Studio para fazer algumas consultas unindo resultado de queries diferentes. Se necess�rio acesse Videoaula - Prepara��o do ambiente de pr�tica para realizar a configura��o.

Acesse o banco de dados bd_filmes e construa consultas SQL conforme solicitado em cada item:

1 - Listar os filmes que s�o do g�nero Guerra ou do G�nero A��o

2 - Listar os filmes que s�o do g�nero Guerra e tamb�m do G�nero A��o

3 - Listar os filmes que s�o do g�nero Guerra e n�o s�o do G�nero A��o

 */

 -- 1 - Listar os filmes que s�o do g�nero Guerra ou do G�nero A��o

 use bd_filmes

 sp_help

 select *
 from filmes

 select *
 from filmes_genero

  select *
 from generos

 select f.dsc_filme, g.dsc_genero
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

UNION

 select f.dsc_filme, g.dsc_genero
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'A��o'

order by dsc_genero 

-- 2 - Listar os filmes que s�o do g�nero Guerra e tamb�m do G�nero A��o

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

INTERSECT

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'A��o'

order by dsc_genero 

-- 3 - Listar os filmes que s�o do g�nero Guerra e n�o s�o do G�nero A��o

select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

EXCEPT

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'A��o'

order by dsc_genero 


-- Resolu��es com duas op��es pela professora

-- 1 - Listar os filmes que s�o do g�nero Guerra ou do G�nero A��o

-- Op��o 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
UNION
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
SELECT DISTINCT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero IN ('Guerra', 'A��o')

-- 2 - Listar os filmes que s�o do g�nero Guerra e tamb�m do G�nero A��o

-- Op��o 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
INTERSECT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'A��o')

-- 3 - Listar os filmes que s�o do g�nero Guerra e n�o s�o do G�nero A��o

-- Op��o 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
EXCEPT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'A��o'

-- Op��o 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme NOT IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'A��o')