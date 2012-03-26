--2: Recupere o nome e o endereço de todos os empregados que trabalham no departamento 'Pesquisa'.
SELECT pnome AS 'Nome',
	   endereco AS 'Endereço'
FROM empregado, departamento
WHERE dnome = 'Pesquisa';