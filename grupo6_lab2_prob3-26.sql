--26: Para cada projeto em que trabalhem mais de dois empregados, recupere o número do
--projeto, seu nome e o número de empregados.

SELECT
	p.pnumero AS 'Cod. Projeto',
	p.pjnome AS 'Nome Projeto',
	count(t.essn) AS 'Qtde Empregados'
FROM projeto AS p, trabalha_em AS t
WHERE p.pnumero = t.pno
GROUP BY p.pnumero, p.pjnome
HAVING count(t.essn) > 2
