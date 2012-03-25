--1: Recupere o aniversário e o endereço do(s) empregado(s) cujo nome seja 'John B. Smith'.
SELECT datanasc AS 'Data de Nascimento',
	   endereco AS 'Endereço'
FROM empregado 
WHERE pnome = 'John' AND minicial = 'B' AND unome = 'Smith';

--2: Recupere o nome e o endereço de todos os empregados que trabalham no departamento 'Pesquisa'.
SELECT pnome AS 'Nome',
	   endereco AS 'Endereço'
FROM empregado, departamento
WHERE dnome = 'Pesquisa';

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

--4: Para cada empregado, recupere o primeiro e o último nome do empregado e o primeiro e
--o último nome de seu superior imediato.
SELECT em.pnome AS 'Nome do Funcionario', 
		em.unome AS 'Sobrenome do Funcionario',
		e.pnome AS 'Nome Supervisor',
		e.unome AS 'Sobrenome Supervisor' 
FROM empregado AS em, empregado AS e
WHERE em.superssn = e.ssn

--5: Selecione todas as combinações dos SSN de EMPREGADO e dos DNOME de DEPARTAMENTO.
SELECT ssn AS 'SSN',
	   dnome as 'Nome do Departamento'
FROM empregado, departamento
WHERE dno = dnumero

--6: Recupere o salário de todos os empregados e todos os diferentes valores de salários.


--7: Faça uma lista com todos os números de projetos nos quais esteja envolvido algum
--empregado cujo último nome seja 'Smith'; ou como empregado, ou como gerente do departamento
-- que controle o projeto.
SELECT pnumero as 'Numero do Projeto',
		pnome as 'Nome'
FROM empregado AS e, projeto AS p, departamento AS d, trabalha_em AS t
WHERE (p.dnum = d.dnumero AND d.gerssn = e.ssn AND e.unome = 'Smith') OR 
(e.unome = 'Smith' AND e.ssn = t.essn AND p.pnumero = t.pno AND p.dnum = d.dnumero)

--8: Recupere todos os empregados cujos endereços sejam em Houston, Texas.
SELECT * FROM empregado WHERE endereco LIKE '%Houston, TX'

--9: Encontre todos os empregados que nasceram durante a década de 50.
SELECT * FROM empregado WHERE datanasc > '1949-12-31' AND datanasc < '1960-01-01'

--10: Mostre o resultado dos salários caso fosse dado a todos os empregados que trabalham
--no 'ProductX' 10% de aumento.
SELECT ssn AS 'SSN',
		salario AS 'Salario'
FROM empregado