--11:Recupere todos os empregados do departamento 5 que ganham entre 30 mil e 40 mil dolares
SELECT pnome AS 'nome',
		salario AS 'Salário'
FROM empregado
WHERE (dno = '5') AND (salario > 30000) AND (salario <= 40000)