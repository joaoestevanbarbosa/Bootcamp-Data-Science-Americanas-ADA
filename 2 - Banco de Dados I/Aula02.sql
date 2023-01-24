/*Comando para criar tabelas*/
CREATE TABLE professores(
	professor_id SERIAL NOT NULL,
	nome VARCHAR(40),
	dominio1 VARCHAR(40),
	dominio2 VARCHAR(40),
	dominio3 VARCHAR(40));

/*Comando para inserir valores na tabela*/
INSERT INTO professores (nome, 
						dominio1, 
						dominio2, 
						dominio3)
			VALUES ('Sandro Saorin', -- Sempre usar Aspas simples. Aspas Duplas subentende-se para descrever coluna. Ex.: "nome completo"
					'SQL',
					'Machine Learning',
					'Data Science');
								
/*Excluir a tabela*/
DROP TABLE professores;

/*Inserindo mais dados*/
INSERT INTO professores (nome, 
						dominio1, 
						dominio2, 
						dominio3)
	VALUES 	('André Juan', 'Python', 'Data Science', 'Estatística'),
			('Renata Marchese', 'Estatística', 'Daa Science', 'Machine Learning'),
			('Larissa Moreira', 'Python', 'SQL', 'Deep Learning'),
			('Rafael Moreira', 'Power BI', 'Tableau', 'Microstrategy');

/*Deletando conteúdo da tabela*/
DELETE FROM professores WHERE professor_id = 6;

/*Atualizando um dado na tabela*/
UPDATE professores SET dominio2 = 'Data Science' WHERE professor_id =2;

/*Testando o Serial do ID*/
UPDATE professores SET professor_id  = 9 WHERE nome ='André Juan';

INSERT INTO professores (nome, 
						dominio1, 
						dominio2, 
						dominio3)
			VALUES ('Eduardo', 'Python', 'R', 'Spark');

INSERT INTO professores (nome, 
						dominio1, 
						dominio2, 
						dominio3)
	VALUES 	('Pedro', 'Python', 'Estatística', 'Spark'),
			('Cristiano', 'Python', 'Dados Não Estruturados', 'Big Data');

/*O que acontece se fizer um UPDATE sem o WHERE*/
UPDATE professores SET dominio2 = 'POO'

/*EXERCÍCIOS*/
--Criar uma tabela nomeado como funcionarios
--e nessa tabela deve conter:
--	funcionario_id (integer)
--	nome
--	departamento
--	cargo
--	senioridade
--	salario numeric
CREATE TABLE funcionarios(
	funcionario_id INTEGER,
	nome VARCHAR(40),
	departamento VARCHAR(40),
	cargo VARCHAR(40),
	senioridade VARCHAR(40),
	salario NUMERIC(8,2));	
DROP TABLE funcionarios;

--Criar uma tabela nomeada como vendas e nessa tabela deve conter:
--	pedido_id integer
--	produto_id integer
--	nome_produto
--	quantidade integer
--	valor_unidade numeric
CREATE TABLE vendas(
	pedido_id INTEGER,
	produto_id INTEGER,
	nome_produto VARCHAR(40),
	quantidade INTEGER,
	valor_unidade NUMERIC(16,2));	
DROP TABLE vendas;

/*APRENDENDO CONSULTAS EM SQL*/
INSERT INTO funcionarios VALUES
	(1,'João Paulo','RH','Analista','Junior',2000),
	(2,'Lúcia','RH','Analista','Pleno',3000),
	(3,'Rosana','RH','Analista','Senior',4000),
	(4,'Elisabete','RH','Coordenador','Liderança',5000),
	(5,'Amanda','RH','Gerente','Gerência',7000),
	(6,'Rafael','Analytics','Analista','Junior',3000),
	(7,'Pedro','Analytics','Analista','Pleno',5000),
	(8,'Lucas','Analytics','Analista','Pleno',5000),
	(9,'Luiz Antônio','Analytics','Analista','Senior',7000),
	(10,'Giovanni','Analytics','Analista','Senior',7000),
	(11,'Nadia','Analytics','Coordenador','Liderança',9000),
	(12,'Carmen','Analytics','Gerente','Gerência',11000),
	(13,'Maurício','Dados','Analista','Pleno',5000),
	(14,'Bruno Silva','Dados','Analista','Senior',8000),
	(15,'Andressa','Dados','Cientista','Junior',5000),
	(16,'José de Sousa','Dados','Cientista','Junior',6500),
	(17,'Helena','Dados','Cientista','Pleno',7000),
	(18,'Bruna','Dados','Cientista','Pleno',7000),
	(19,'Bruno Pereira','Dados','Cientista','Pleno',8000),
	(20,'Bianca','Dados','Cientista','Senior',11000),
	(21,'Murilo','Dados','Coordenador','Liderança',12000),
	(22,'Gisele','Dados','Coordenador','Liderança',14000),
	(23,'Paulo','Dados','Gerente','Gerência',18000),
	(24,'Wesley','Dados','Engenheiro','Junior',6000),
	(25,'Vagner','Dados','Engenheiro','Pleno',9000),
	(26,'Léticia','Dados','Engenheiro','Pleno',9000),
	(27,'Sandro','Dados','Engenheiro','Senior',11000),
	(28,'Enzo','Dados','Engenheiro','Senior',12000),
	(29,'Lavinia','Dados','Engenheiro','Senior',12000),
	(30,'Andrei','Dev','Engenheiro de Software','Junior',4000),
	(31,'George','Dev','Engenheiro de Software','Junior',4000),
	(32,'Caio','Dev','Engenheiro de Software','Pleno',5000),
	(33,'Edna','Dev','Engenheiro de Software','Pleno',5000),
	(34,'Debora','Dev','Engenheiro de Software','Pleno',6500),
	(35,'Luiza','Dev','Engenheiro de Software','Pleno',6000),
	(36,'Pedro Henrique','Dev','Engenheiro de Software','Pleno',6000),
	(37,'Willian','Dev','Engenheiro de Software','Senior',7000),
	(38,'Viviane','Dev','Engenheiro de Software','Senior',9000),
	(39,'Mnnuel','Dev','Coordenador','Liderança',8000),
	(40,'Lurdes','Dev','Coordenador','Liderança',9500),
	(41,'Hygor','Dev','Gerente','Gerência',10000),
	(42,'Ana Paula','Financeiro','Analista','Junior',2000),
	(43,'Luciana','Financeiro','Analista','Junior',2000),
	(44,'Lorena','Financeiro','Analista','Junior',2500),
	(45,'Sara','Financeiro','Analista','Junior',2500),
	(46,'Cintia','Financeiro','Analista','Pleno',3000),
	(47,'Karina','Financeiro','Analista','Pleno',3000),
	(48,'Camila','Financeiro','Analista','Senior',3500),
	(49,'Afonso','Financeiro','Coordenador','Liderança',4500),
	(50,'Cibele','Financeiro','Gerente','Gerência',5000);

/*COMANDO SELECT*/
SELECT * FROM funcionarios;

SELECT 
	nome, 
	senioridade 
FROM funcionarios;

SELECT 
	salario
FROM funcionarios;

/*COMANDO LIMIT*/
SELECT *
FROM funcionarios 
LIMIT 3;

/*COMANDO ORDER BY*/
SELECT *
FROM funcionarios 
ORDER BY funcionario_id DESC
LIMIT 3;

/*COMANDO WHERE*/
SELECT *
FROM funcionarios 
WHERE funcionario_id > 40;

SELECT 
	departamento,
	salario
FROM funcionarios 
WHERE senioridade = 'Junior'
ORDER BY salario DESC;

/*COMANDO GROUP BY*/
SELECT 
	departamento,
	SUM(salario) AS total_salarios
FROM funcionarios 
GROUP BY departamento
ORDER BY departamento;

/*SEQUENCIA DE COMANDOS NO SQL
		SELECT
		FROM
		WHERE
		GROUP BY
		ORDER BY
		LIMIT
*/

SELECT 
	departamento,
	senioridade,
	AVG(salario) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*ARREDONDANDO COM O ROUND*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*CONTAR QTD DE SALARIOS*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(salario),2) AS media_salarial,
	COUNT(salario) AS qtd_func
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*SALARIO MEDIO*/
SELECT 
	departamento,
	ROUND(AVG(salario),2) AS media_salarial,
	COUNT(salario) AS qtd_func,
	ROUND(SUM(salario)/COUNT(salario), 2) AS salario_medio
FROM funcionarios 
GROUP BY departamento
ORDER BY departamento;


/*COMANDO CAST - Converte o tipo de variável*/
SELECT 
	departamento,
	senioridade,
	ROUND(AVG(CAST(salario AS NUMERIC)),2) AS media_salarial
FROM funcionarios 
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;

/*COMANDO DISTINCT*/
SELECT
	DISTINCT senioridade
FROM funcionarios;

/*INSERT DE DADOS NA TABELA VENDAS*/
INSERT INTO vendas VALUES
	(1,1,'Arroz',1,22.50),
	(1,2,'Feijão',1,8.90),
	(1,3,'Óleo',2,7.50),
	(1,4,'Sal',1,4.20),
	(1,5,'Macarrão',2,4.50),
	(2,6,'Cerveja',36,2.5),
	(2,7,'Refrigerante',4,9.80),
	(2,8,'Carne',2,45.00),
	(2,9,'Linguiça',2,15.80),
	(3,1,'Arroz',1,22.50),
	(3,2,'Feijão',1,8.90),
	(3,5,'Macarrão',4,4.50),
	(3,10,'Molho',6,2.20),
	(3,7,'Refrigerante',2,9.80),
	(3,11,'Leite',12,4.60),
	(4,11,'Leite',6,4.60),
	(4,12,'Fralda',1,62.50),
	(4,7,'Refrigerante',2,9.80),
	(4,13,'Sorvete',1,25.50),
	(4,5,'Macarrão',1,4.50),
	(5,1,'Arroz',2,22.50),
	(5,2,'Feijão',2,8.90),
	(5,4,'Sal',1,4.20),
	(5,14,'Açúcar',1,3.90),
	(5,15,'Café',2,8.90),
	(5,11,'Leite',12,4.60),
	(5,16,'Bolacha',4,2.40),
	(6,17,'Morango',1,6.20),
	(6,18,'Banana',1,4.99),
	(6,11,'Leite',4,4.60),
	(6,14,'Açúcar',1,3.90),
	(6,1,'Arroz',1,22.50),
	(6,2,'Feijão',1,8.90),
	(7,19,'Lasanha',1,8.70),
	(7,10,'Molho',4,2.20),
	(7,20,'Presunto',3,8.70),
	(7,21,'Mussarela',3,7.30),
	(7,7,'Refrigerante',1,9.80),
	(7,13,'Sorvete',1,25.50),
	(8,5,'Macarrão',3,4.50),
	(8,3,'Óleo',1,7.50),
	(8,4,'Sal',1,4.20),
	(8,7,'Refrigerante',2,9.80),
	(8,10,'Molho',2,2.20),
	(9,1,'Arroz',1,22.50),
	(9,2,'Feijão',1,8.90),
	(9,3,'Óleo',1,7.50),
	(9,13,'Sorvete',2,25.50),
	(10,5,'Macarrão',2,4.50),
	(10,10,'Molho',4,2.20),
	(10,7,'Refrigerante',2,9.80),
	(10,6,'Cerveja',12,2.5),
	(10,8,'Carne',1,45.00),
	(10,4,'Sal',1,4.20);

/*
PERGUNTAS A RESOLVER
1)Qual é o valor total de cada uma das compras?

2)Qual o produto mais vendido em quantidade?

3)Qual o produto que mais vendeu em valor?
*/

/*1)Qual é o valor total de cada uma das compras?*/
SELECT * FROM vendas;

SELECT 
	pedido_id,
	SUM(quantidade * valor_unidade) AS valor_total 
FROM 
	vendas
GROUP BY 1
ORDER BY 1;

/*2)Qual o produto mais vendido em quantidade?*/
SELECT * FROM vendas;

SELECT 
	nome_produto,
	SUM(quantidade) AS total_qtds
FROM
	vendas
GROUP BY nome_produto
ORDER BY SUM(quantidade) DESC;
--LIMIT 1;

/*3)Qual o produto que mais vendeu em valor?*/
SELECT * FROM vendas;

SELECT 
	nome_produto,
	SUM(quantidade * valor_unidade) AS valor_total 
FROM
	vendas
GROUP BY nome_produto
ORDER BY SUM(quantidade * valor_unidade) DESC;
--LIMIT 1;



-- Tabela vendas
-- Calcule quantos produtos distintos tem por pedido?
SELECT 
	pedido_id,
	count(nome_produto)
FROM
	vendas
GROUP BY pedido_id
ORDER BY 1;

SELECT *
FROM funcionarios;
-- Tabela funcionários
-- Calcule o total de salários por departamento mas apenas com senioridade Liderança e Gerencia
SELECT 
	departamento, 	
	senioridade,
	sum(salario)
FROM
	funcionarios
WHERE senioridade IN ('Liderança', 'Gerência')
GROUP BY departamento, senioridade;

-- Calcule quantos funcionários tem por departamento
SELECT 
	departamento, 	
	COUNT(nome)
FROM
	funcionarios
GROUP BY departamento;

-- Calcule quantos funcionários tem por senioridade
SELECT 
	senioridade, 	
	COUNT(nome)
FROM
	funcionarios
GROUP BY senioridade;