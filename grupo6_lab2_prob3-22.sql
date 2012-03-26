--22: Recupere o número de empregados do departamento 'Pesquisa'.
SELECT COUNT (DISTINCT ssn) AS 'Numero de Empregados'
FROM empregado, departamento
WHERE dnome = 'Pesquisa' AND dno = dnumero