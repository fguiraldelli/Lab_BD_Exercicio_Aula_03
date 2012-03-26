--Consulta 12: Recupere a lista dos empregados e os respectivos projetos nos quais eles trabalham,
--ordenada por departamento, e, dentro de cada departamento, também por ordem alfabética do último
--nome, e depois, pelo primeiro nome do empregado.
SELECT DISTINCT
		pnome AS 'Nome',
		unome AS 'Sobrenome',
		dnumero AS 'Departamento',
		pnumero AS 'Cod. Projeto',
		pjnome AS 'Nome Projeto'
FROM empregado AS e, projeto AS p, departamento AS d, trabalha_em AS t
WHERE (e.dno = d.dnumero) AND (t.essn = e.ssn) AND (p.pnumero = t.pno)
ORDER BY d.dnumero, e.unome, e.pnome
