--Consulta 15: Recupere o nome de cada um dos empregados que trabalham em todos os projetos 
--controlados pelo departamento 5
SELECT DISTINCT
		e.ssn AS 'SSN',
		pnome AS 'Nome',
		d.dnumero AS 'Departamento'
FROM empregado AS e, departamento AS d, trabalha_em AS t, projeto AS p
WHERE e.dno = 5 AND p.dnum = 5 AND e.dno = d.dnumero AND e.ssn = t.essn