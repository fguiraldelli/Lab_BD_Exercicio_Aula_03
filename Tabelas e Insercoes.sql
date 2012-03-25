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

--						#################
--							INSERCOES
--						#################

--Insercao Empregado
INSERT INTO empregado VALUES ('John','B','Smith','123456789','1965-01-09', '731 Fondren, Houston, TX','M',30000,'333445555', 5);
INSERT INTO empregado VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO empregado VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO empregado VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO empregado VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO empregado VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO empregado VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO empregado VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, null, 1);

--Arruma a chave estrangeira de superssn
ALTER TABLE empregado 
ADD CONSTRAINT fk_emp FOREIGN KEY (superssn) REFERENCES empregado (ssn);

--Insercao Departamento
INSERT INTO departamento VALUES ('Pesquisa', 5,'333445555', '1988-05-22');
INSERT INTO departamento VALUES ('Administração',4,'987654321','1995-01-01');
INSERT INTO departamento VALUES ('Sede Administrativa', 1,'888665555', '1981-06-19');

--Arruma a chave estrangeira dno
ALTER TABLE empregado 
ADD CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES departamento (dnumero);

--Insercao depto_localizacoes
INSERT INTO depto_localizacoes VALUES (1, 'Houston');
INSERT INTO depto_localizacoes VALUES (4, 'Stafford');
INSERT INTO depto_localizacoes VALUES (5, 'Bellaire');
INSERT INTO depto_localizacoes VALUES (5, 'Sugarland');

--Insercao projeto
INSERT INTO projeto VALUES ('ProdutoX',1,'Bellair',5);
INSERT INTO projeto VALUES ('ProdutoY',2,'Sugarland',5);
INSERT INTO projeto VALUES ('ProdutoZ',3,'Houston',5);
INSERT INTO projeto VALUES ('Automatização',10,'Stafford',4);
INSERT INTO projeto VALUES ('Reorganização',20,'Houston',1);
INSERT INTO projeto VALUES ('Novos Benefícios',30,'Stafford',4);

--Insercao trabalha_em
INSERT INTO trabalha_em VALUES ('123456789',1,32.5);
INSERT INTO trabalha_em VALUES ('123456789',2,75);
INSERT INTO trabalha_em VALUES ('666884444',3,40.0);
INSERT INTO trabalha_em VALUES ('453453453',1,20.0);
INSERT INTO trabalha_em VALUES ('453453453',2,200);
INSERT INTO trabalha_em VALUES ('333445555',2,10.0);
INSERT INTO trabalha_em VALUES ('333445555',3,10.0);
INSERT INTO trabalha_em VALUES ('333445555',10,10.0);
INSERT INTO trabalha_em VALUES ('333445555',20,10.0);
INSERT INTO trabalha_em VALUES ('999887777',30,30.0);--10
INSERT INTO trabalha_em VALUES ('999887777',10,10.0);
INSERT INTO trabalha_em VALUES ('987987987',10,35.0);
INSERT INTO trabalha_em VALUES ('987987987',30,5.0);--13
INSERT INTO trabalha_em VALUES ('987654321',30,20.0);--14
INSERT INTO trabalha_em VALUES ('987654321',20,15.0);
INSERT INTO trabalha_em VALUES ('888665555',20,null);

--Insercao dependente
INSERT INTO dependente VALUES ('333445555','Alice','F','1986-04-05','FILHA');
INSERT INTO dependente VALUES ('333445555','Theodore','M','1983-10-25','FILHO');
INSERT INTO dependente VALUES ('333445555','Joy','F','1958-05-03','CÔNJUGE');
INSERT INTO dependente VALUES ('987654321','Abner','M','1942-02-28','CÔNJUGE');
INSERT INTO dependente VALUES ('123456789','Michael','M','1988-01-04','FILHO');
INSERT INTO dependente VALUES ('123456789','Alice','F','1988-12-30','FILHA');
INSERT INTO dependente VALUES ('123456789','Elizabeth','F','1967-05-05','CÔNJUGE');