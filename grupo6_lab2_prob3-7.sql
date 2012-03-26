--7: Faça uma lista com todos os números de projetos nos quais esteja envolvido algum
--empregado cujo último nome seja 'Smith'; ou como empregado, ou como gerente do departamento
-- que controle o projeto.
SELECT pnumero as 'Numero do Projeto',
		pnome as 'Nome'
FROM empregado AS e, projeto AS p, departamento AS d, trabalha_em AS t
WHERE (p.dnum = d.dnumero AND d.gerssn = e.ssn AND e.unome = 'Smith') OR 
(e.unome = 'Smith' AND e.ssn = t.essn AND p.pnumero = t.pno AND p.dnum = d.dnumero)
