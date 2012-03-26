--10: Mostre o resultado dos salários caso fosse dado a todos os empregados que trabalham
--no 'ProductX' 10% de aumento.
SELECT
		e.ssn AS 'SSN',
		e.pnome AS 'Nome',
		e.salario AS 'Salário Atual',
		e.salario*1.1 AS 'Salario com Aumento 10% aumento',
		t.pno AS 'Projeto'
FROM empregado AS e, trabalha_em AS t
WHERE e.ssn = t.essn AND t.pno = 1
