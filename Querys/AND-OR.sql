-- AND e OR com Where

select *
from empregado
where val_salario >= 2000
and sex_empregado = 'M'
or sig_uf = 'MG'

-- Aplica��o de preced�ncia para firmar uma exatid�o na busca

select *
from empregado
where val_salario >= 2000
and (sex_empregado = 'M'
or sig_uf = 'MG')