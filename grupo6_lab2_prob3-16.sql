--16: Recupere os nomes dos empregados que não possuem nenhum dependente.
SELECT DISTINCT ssn as 'Seguro Social',
		pnome AS 'Nome',
		unome AS 'Sobrenome'
FROM empregado, dependente
WHERE ssn NOT IN (SELECT essn FROM dependente)