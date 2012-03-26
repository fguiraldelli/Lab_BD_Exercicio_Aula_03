--25: Para cada projeto, recupere seu número, seu nome e o número de empregados que nele
--trabalham.
USE AtividadeAula03
SELECT pno AS 'Numero do Projeto',
		pjnome AS 'Nome do Projeto',
		COUNT (*) AS 'Numero de Empregados'
FROM trabalha_em , projeto 
WHERE pno = pnumero
GROUP BY pno, pjnome
