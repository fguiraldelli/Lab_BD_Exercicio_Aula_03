--1: Recupere o aniversário e o endereço do(s) empregado(s) cujo nome seja 'John B. Smith'.
SELECT datanasc AS 'Data de Nascimento',
	   endereco AS 'Endereço'
FROM empregado 
WHERE pnome = 'John' AND minicial = 'B' AND unome = 'Smith';
