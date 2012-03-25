--Insercao Empregado
INSERT INTO empregado VALUES ('John','B','Smith','123456789',1965-01-09, '731 Fondren, Houston, TX','M',30000,'333445555', 5);
INSERT INTO empregado VALUES ('Franklin', 'T', 'Wong', '333445555', 1955-12-08, '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO empregado VALUES ('Alicia', 'J', 'Zelaya', '999887777', 1968-01-19, '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO empregado VALUES ('Jennifer', 'S', 'Wallace', '987654321', 1941-06-20, '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO empregado VALUES ('Ramesh', 'K', 'Narayan', '666884444', 1962-09-15, '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO empregado VALUES ('Joyce', 'A', 'English', '453453453', 1972-07-31, '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO empregado VALUES ('Ahmad', 'V', 'Jabbar', '987987987', 1969-03-29, '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO empregado VALUES ('James', 'E', 'Borg', '888665555', 1937-11-10, '450 Stone, Houston, TX', 'M', 55000, null, 1);

--Insercao Departamento
INSERT INTO departamento VALUES ('Pesquisa', 5,'333445555', 1988-05-22);
INSERT INTO departamento VALUES ('Administração', 4,'987654321', 1995-01-01);
INSERT INTO departamento VALUES ('Sede administrativa', 1,'888665555', 1981-06-19);

--Insercao depto_localizacoes
INSERT INTO dpto_localizacoes VALUES (1, 'Houston');
INSERT INTO dpto_localizacoes VALUES (4, 'Stafford');
INSERT INTO dpto_localizacoes VALUES (5, 'Bellaire');
INSERT INTO dpto_localizacoes VALUES (5, 'Sugarland');

--Insercao trabalha_em
INSERT INTO trabalha_em VALUES ('123456789'.1.32.5);
INSERT INTO trabalha_em VALUES ('123456789'.2.75);
INSERT INTO trabalha_em VALUES ('666884444'.3.40.0);
INSERT INTO trabalha_em VALUES ('453453453'.1.20.0);
INSERT INTO trabalha_em VALUES ('453453453'.2.200);
INSERT INTO trabalha_em VALUES ('333445555'.2.10.0);
INSERT INTO trabalha_em VALUES ('333445555'.3.10.0);
INSERT INTO trabalha_em VALUES ('333445555'.10.10.0);
INSERT INTO trabalha_em VALUES ('333445555'.20.10.0);
INSERT INTO trabalha_em VALUES ('999887777'.30.30.0);
INSERT INTO trabalha_em VALUES ('999887777'.10.10.0);
INSERT INTO trabalha_em VALUES ('987987987'.10.35.0);
INSERT INTO trabalha_em VALUES ('987987987'.30.5.0);
INSERT INTO trabalha_em VALUES ('987654321'.30.20.0);
INSERT INTO trabalha_em VALUES ('987654321'.20.15.0);
INSERT INTO trabalha_em VALUES ('888665555'.20.null);