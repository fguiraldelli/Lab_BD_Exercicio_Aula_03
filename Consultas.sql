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
SELECT DISTINCT salario AS 'Salário'FROM empregado
	ORDER BY salario

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
SELECT
		e.ssn AS 'SSN',
		e.pnome AS 'Nome',
		e.salario AS 'Salário Atual',
		e.salario*1.1 AS 'Salario com Aumento 10% aumento',
		t.pno AS 'Projeto'
FROM empregado AS e, trabalha_em AS t
WHERE e.ssn = t.essn AND t.pno = 1

--11:Recupere todos os empregados do departamento 5 que ganham entre 30 mil e 40 mil dolares
SELECT pnome AS 'nome',
		salario AS 'Salário'
FROM empregado
WHERE (dno = '5') AND (salario > 30000) AND (salario <= 40000)

--Consulta 12: Recupere a lista dos empregados e os respectivos projetos nos quais eles trabalham,
--ordenada por departamento, e, dentro de cada departamento, também por ordem alfabética do último
--nome, e depois, pelo primeiro nome do empregado.
SELECT DISTINCT
		pnome AS 'Nome',
		unome AS 'Sobrenome',
		dnumero AS 'Departamento',
		pnumero AS 'Cod. Projeto',
		pjnome AS 'Nome Projeto'
FROM empregado AS e, projeto AS p, departamento AS d, trabalha_em AS t
WHERE (e.dno = d.dnumero) AND (t.essn = e.ssn) AND (p.pnumero = t.pno)
ORDER BY d.dnumero, e.unome, e.pnome

--Consulta 13: Recupere os nomes de todos os empregados que não têm supervisor.
SELECT e.pnome AS 'Nome' FROM empregado AS e
WHERE e.superssn IS NULL

--Consulta 14: Recupere o nome de cada um dos empregados que tenham um dependente cujo
--primeiro nome e sexo sejam o mesmo do empregado em questão.
SELECT pnome AS 'Nome'
FROM empregado AS e, dependente AS d
WHERE d.essn = e.ssn AND e.pnome = d.nome_dependente AND e.sexo = d.sexo

--Consulta 15: Recupere o nome de cada um dos empregados que trabalham em todos os projetos 
--controlados pelo departamento 5
SELECT DISTINCT
		e.ssn AS 'SSN',
		pnome AS 'Nome',
		d.dnumero AS 'Departamento'
FROM empregado AS e, departamento AS d, trabalha_em AS t, projeto AS p
WHERE e.dno = 5 AND p.dnum = 5 AND e.dno = d.dnumero AND e.ssn = t.essn

--16: Recupere os nomes dos empregados que não possuem nenhum dependente.
SELECT DISTINCT ssn as 'Seguro Social',
		pnome AS 'Nome',
		unome AS 'Sobrenome'
FROM empregado, dependente
WHERE ssn NOT IN (SELECT essn FROM dependente)

--17: Relacione os nomes dos gerentes que possuam ao menos um dependente.
SELECT DISTINCT ssn as 'Seguro Social',
		pnome AS 'Nome',
		unome AS 'Sobrenome'
FROM empregado, dependente
WHERE ssn = essn

--18: Recupere os números dos seguros sociais de todos os empregados que trabalham nos
--projetos 1, 2 ou 3.
SELECT essn AS 'Seguro Social',
		pno AS 'Numero do Projeto'
FROM trabalha_em
WHERE pno = 1 OR pno = 2 OR pno = 3
ORDER BY pno

--19: Encontre a soma dos salários, o maior salário, o menor salário e a média salarial de todos
--os empregados.
SELECT SUM(salario) AS 'Total de Salarios',
		MAX(salario) AS 'Maior Salario',
		MIN(salario) AS 'Menor Salario',
		AVG(salario) AS 'Media dos Salarios'
FROM empregado

--20: Encontre a soma dos salários de todos os empregados do departamento 'Pesquisa', bem
--como o maior salário, o menor salário e a média salarial desse departamento.
SELECT SUM(salario) AS 'Total de Salarios',
		MAX(salario) AS 'Maior Salario',
		MIN(salario) AS 'Menor Salario',
		AVG(salario) AS 'Media dos Salarios'
FROM empregado, departamento
WHERE dnome = 'Pesquisa' AND dno = dnumero

--21: Recupere o número total de empregados da empresa.
SELECT COUNT (DISTINCT ssn) AS 'Numero de Empregados'
FROM empregado

--22: Recupere o número de empregados do departamento 'Pesquisa'.
SELECT COUNT (DISTINCT ssn) AS 'Numero de Empregados'
FROM empregado, departamento
WHERE dnome = 'Pesquisa' AND dno = dnumero

--23: Conte o número dos diferentes valores de salário contidos no banco de dados.
SELECT COUNT (DISTINCT salario) AS 'Salarios'
FROM empregado

--24: Para cada departamento, recupere seu número, o número de empregados que nele
--trabalham e a média de seus salários.
SELECT dno AS 'Numero do Departamento',
		COUNT (*) AS 'Numero de empregados',
		AVG (salario) AS 'Media de Salarios'
FROM departamento AS d, empregado as e
WHERE dno = dnumero
GROUP BY dno

--25: Para cada projeto, recupere seu número, seu nome e o número de empregados que nele
--trabalham.
USE AtividadeAula03
SELECT pno AS 'Numero do Projeto',
		pjnome AS 'Nome do Projeto',
		COUNT (*) AS 'Numero de Empregados'
FROM trabalha_em , projeto 
WHERE pno = pnumero
GROUP BY pno, pjnome

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

--27: Para cada projeto, recupere seu número, seu nome e o número de empregados do
--departamento 5 que nele trabalhem.
SELECT t.pno AS 'Numero do Projeto',
		p.pjnome AS 'Nome do Projeto',
		COUNT (t.essn) AS 'Numero de empregados'
FROM projeto AS p, trabalha_em AS t
WHERE p.dnum = 5 AND t.pno = p.pnumero
GROUP BY t.pno, p.pjnome

--28: Para cada departamento que tenha mais de cinco empregados, recupere o número do
--departamento e o número dos empregados que recebem mais de 40 mil dólares.
SELECT
	d.dnumero AS 'Departamento',
	e.ssn AS 'Numero Empregado'
FROM departamento AS d, empregado AS e
WHERE e.dno = d.dnumero AND e.salario > 40000 AND d.dnumero IN
(SELECT
	d.dnumero AS 'Numero Departamento'
FROM departamento AS d, empregado AS e
WHERE e.dno = d.dnumero
GROUP BY d.dnumero
HAVING count(*) > 5)