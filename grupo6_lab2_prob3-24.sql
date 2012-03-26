--24: Para cada departamento, recupere seu número, o número de empregados que nele
--trabalham e a média de seus salários.
SELECT dno AS 'Numero do Departamento',
		COUNT (*) AS 'Numero de empregados',
		AVG (salario) AS 'Media de Salarios'
FROM departamento AS d, empregado as e
WHERE dno = dnumero
GROUP BY dno
