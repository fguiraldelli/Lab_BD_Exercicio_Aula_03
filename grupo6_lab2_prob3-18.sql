--18: Recupere os números dos seguros sociais de todos os empregados que trabalham nos
--projetos 1, 2 ou 3.
SELECT essn AS 'Seguro Social',
		pno AS 'Numero do Projeto'
FROM trabalha_em
WHERE pno = 1 OR pno = 2 OR pno = 3
ORDER BY pno