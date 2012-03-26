--19: Encontre a soma dos salários, o maior salário, o menor salário e a média salarial de todos
--os empregados.
SELECT SUM(salario) AS 'Total de Salarios',
		MAX(salario) AS 'Maior Salario',
		MIN(salario) AS 'Menor Salario',
		AVG(salario) AS 'Media dos Salarios'
FROM empregado