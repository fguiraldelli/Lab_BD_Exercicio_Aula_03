--Consulta 14: Recupere o nome de cada um dos empregados que tenham um dependente cujo
--primeiro nome e sexo sejam o mesmo do empregado em questão.
SELECT pnome AS 'Nome'
FROM empregado AS e, dependente AS d
WHERE d.essn = e.ssn AND e.pnome = d.nome_dependente AND e.sexo = d.sexo