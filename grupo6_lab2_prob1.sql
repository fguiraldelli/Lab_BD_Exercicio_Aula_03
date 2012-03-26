--Laboratório de Banco de Dados - Prof. Tiago
--Turma 06 - Exercício Aula 03
--Criação Banco de Dados e Tabelas


--Cria o Banco
CREATE DATABASE AtividadeAula03;
go
--Utilizar o banco criado
USE AtividadeAula03;

--Cria a tabela Empregado
CREATE TABLE empregado (
pnome VARCHAR(15),
minicial CHAR(1),
unome VARCHAR(15),
ssn CHAR(9) ,
datanasc DATE,
endereco VARCHAR (50),
sexo CHAR(1) CHECK(sexo IN ('F','M')),
salario INT,
superssn CHAR(9),
dno INT,
PRIMARY KEY (ssn)
);

--Cria a tabela Departamento
CREATE TABLE departamento(
dnome VARCHAR(25),
dnumero INT,
gerssn CHAR(9),
gerdatainicio DATE,
PRIMARY KEY (dnumero),
FOREIGN KEY (gerssn) REFERENCES empregado(ssn)
);

--Cria a tabela Departamento_Localizacoes
CREATE TABLE depto_localizacoes (
dnumero INT,
dlocalizacao VARCHAR(50)
PRIMARY KEY (dnumero, dlocalizacao),
FOREIGN KEY (dnumero) REFERENCES departamento(dnumero)
);

--Cria a tabela Projeto
CREATE TABLE projeto(
pjnome VARCHAR(20),
pnumero INT,
plocalizacao VARCHAR(50),
dnum INT,
PRIMARY KEY (pnumero),
FOREIGN KEY (dnum) REFERENCES departamento(dnumero)
);

--Cria a tabela Trabalha_Em
CREATE TABLE trabalha_em(
	essn CHAR(9),
	pno INT,
	horas INT,
	
	PRIMARY KEY (essn, pno),
	FOREIGN KEY (essn) REFERENCES empregado (ssn),
	FOREIGN KEY (pno) REFERENCES projeto (pnumero)
);

--Cria a tabela Dependentes
CREATE TABLE dependente(
	essn CHAR(9),
	nome_dependente VARCHAR(20),
	sexo CHAR(1) CHECK (sexo IN('F','M')),
	datanasc DATE,
	parentesco VARCHAR(15),
	
	PRIMARY KEY (essn, nome_dependente),
	FOREIGN KEY (essn) REFERENCES empregado (ssn)
);

--						####################################
--						   ALTERAÇÕES CHAVES ESTRANGEIRAS
--						####################################

--Arruma a chave estrangeira de superssn
ALTER TABLE empregado 
ADD CONSTRAINT fk_emp FOREIGN KEY (superssn) REFERENCES empregado (ssn);

--Arruma a chave estrangeira dno
ALTER TABLE empregado 
ADD CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES departamento (dnumero);