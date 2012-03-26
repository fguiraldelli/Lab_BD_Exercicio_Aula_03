--17: Relacione os nomes dos gerentes que possuam ao menos um dependente.
SELECT DISTINCT ssn as 'Seguro Social',
		pnome AS 'Nome',
		unome AS 'Sobrenome'
FROM empregado, dependente
WHERE ssn = essn