--Consulta 13: Recupere os nomes de todos os empregados que não têm supervisor.
SELECT e.pnome AS 'Nome' FROM empregado AS e
WHERE e.superssn IS NULL