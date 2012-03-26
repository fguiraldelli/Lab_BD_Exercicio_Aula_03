--20: Encontre a soma dos salários de todos os empregados do departamento 'Pesquisa', bem
--como o maior salário, o menor salário e a média salarial desse departamento.
SELECT SUM(salario) AS 'Total de Salarios',
		MAX(salario) AS 'Maior Salario',
		MIN(salario) AS 'Menor Salario',
		AVG(salario) AS 'Media dos Salarios'
FROM empregado, departamento
WHERE dnome = 'Pesquisa' AND dno = dnumero
