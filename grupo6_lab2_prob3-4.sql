--4: Para cada empregado, recupere o primeiro e o último nome do empregado e o primeiro e
--o último nome de seu superior imediato.
SELECT em.pnome AS 'Nome do Funcionario', 
		em.unome AS 'Sobrenome do Funcionario',
		e.pnome AS 'Nome Supervisor',
		e.unome AS 'Sobrenome Supervisor' 
FROM empregado AS em, empregado AS e
WHERE em.superssn = e.ssn
