--28: Para cada departamento que tenha mais de cinco empregados, recupere o número do
--departamento e o número dos empregados que recebem mais de 40 mil dólares.
SELECT
	d.dnumero AS 'Departamento',
	e.ssn AS 'Numero Empregado'
FROM departamento AS d, empregado AS e
WHERE e.dno = d.dnumero AND e.salario > 40000 AND d.dnumero IN
(SELECT
	d.dnumero AS 'Numero Departamento'
FROM departamento AS d, empregado AS e
WHERE e.dno = d.dnumero
GROUP BY d.dnumero
HAVING count(*) > 5)