USE disciplinabd;

--Cria a Tabela Empregado
CREATE TABLE Empregado(
	Pnome VARCHAR(15) NOT NULL,
	Minicial CHAR(1),
	Unome VARCHAR(15) NOT NULL,
	SSN	CHAR(9) NOT NULL,
	DataNasc DATE NOT NULL,
	Endereco VARCHAR(50) NOT NULL,
	Sexo CHAR(1) CHECK (Sexo IN('M', 'F')),
	Salario NUMERIC(5,2),
	SuperSSN CHAR(9),
	DNO INT,
	PRIMARY KEY (SSN)
);

--Cria a Tabela Departamento
CREATE TABLE Departamento(
	Dnome VARCHAR(50) NOT NULL,
	Dnumero INT NOT NULL,
	GerSSN CHAR(9),
	GerDataInicio DATE,
	PRIMARY KEY (Dnumero)
);

--Cria a Tabela DeptoLocalizacoes
CREATE TABLE DeptoLocalizacoes(
	Dnumero INT NOT NULL,
	Dlocalizacao VARCHAR(50) NOT NULL,
	PRIMARY KEY (Dnumero, Dlocalizacao)
);

--Cria a Tabela Projeto
CREATE TABLE Projeto(
	PjNome VARCHAR(50) NOT NULL,
	Pnumero INT NOT NULL,
	Plocalizacao VARCHAR(50) NOT NULL,
	Dnum INT NOT NULL,
	PRIMARY KEY (Pnumero)
);

--Cria a Tabela Trabalha_Em
CREATE TABLE Trabalha_Em(
	ESSN CHAR(9) NOT NULL,
	PNO INT NOT NULL,
	DNUM INT NOT NULL,
	PRIMARY KEY (ESSN, PNO)
);

--Cria a Tabela Dependente
CREATE TABLE Dependente(
	ESSN CHAR(9) NOT NULL,
	NomeDependente VARCHAR(50) NOT NULL,
	Sexo CHAR(1) CHECK (Sexo IN('F', 'M')),
	DataNasc DATE NOT NULL,
	Parentesco VARCHAR(20) NOT NULL,
	PRIMARY KEY (NomeDependente)
);

--Referencia as chaves estrangeiras

ALTER TABLE Empregado
ADD CONSTRAINT fk_SuperSSN FOREIGN KEY (SuperSSN) REFERENCES Empregado (SSN);

ALTER TABLE empregado
ADD CONSTRAINT fk_dno FOREIGN KEY (DNO) REFERENCES Departamento (Dnumero)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE Departamento
ADD CONSTRAINT fk_GerSSN FOREIGN KEY (GerSSN) REFERENCES Empregado (SSN);

ALTER TABLE DeptoLocalizacoes
ADD CONSTRAINT fk_Dnumero FOREIGN KEY (Dnumero) REFERENCES Departamento(Dnumero)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Projeto
ADD CONSTRAINT fk_Dnum FOREIGN KEY (Dnum) REFERENCES Departamento(Dnumero)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Trabalha_Em
ADD CONSTRAINT fk_ESSN FOREIGN KEY (ESSN) REFERENCES Empregado(SSN)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Trabalha_Em
ADD CONSTRAINT fk_pnopnum FOREIGN KEY (PNO) REFERENCES Projeto (Pnumero);

ALTER TABLE Dependente
ADD CONSTRAINT fk_ESSND FOREIGN KEY (ESSN) REFERENCES Empregado (SSN)
ON DELETE CASCADE ON UPDATE CASCADE;

