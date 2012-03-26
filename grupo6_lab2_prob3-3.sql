--3: Para cada projeto localizado em 'Stafford', relacione o número do projeto, o número do
--departamento responsável e o último nome do gerente do departamento, seu endereço e sua data de
--aniversário.
SELECT pnumero AS 'Numero do Projeto',
	   dnum AS 'Numero do Departamento',
	   unome AS 'Sobrenome',
	   endereco AS 'Endereço',
	   datanasc AS 'Data de Nascimento'
FROM empregado, departamento, projeto
WHERE dnum = dnumero AND plocalizacao = 'Stafford' AND gerssn = ssn