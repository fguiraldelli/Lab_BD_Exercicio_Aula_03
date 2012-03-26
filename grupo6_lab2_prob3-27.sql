--27: Para cada projeto, recupere seu número, seu nome e o número de empregados do
--departamento 5 que nele trabalhem.
SELECT t.pno AS 'Numero do Projeto',
		p.pjnome AS 'Nome do Projeto',
		COUNT (t.essn) AS 'Numero de empregados'
FROM projeto AS p, trabalha_em AS t
WHERE p.dnum = 5 AND t.pno = p.pnumero
GROUP BY t.pno, p.pjnome