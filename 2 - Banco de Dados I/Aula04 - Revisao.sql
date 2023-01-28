-- PROGRAMAÇÃO PARA AS PRÓXIMAS AULAS
-- 09/01 - Revisão e Resolução da lista I | CONSTRAINS, Chaves (primaria e estrangeira)
-- 11/01 - Joins e Unions (Otimização)
-- 13/01 - CAST, Subqueries, Manipulação de Datas e Textos
-- 16/01 - Lista de Exercícios II
-- 18/01 - Revisão Lista II, Grouping Setes e Window Functions
-- 20/01 - Avaliação por Rubrica | Prova

----------------------------------------------------------------------------------------

-- REVISÃO: CONSTRUÇÃO DE TABELAS

-- DELETANDO UMA TABELA
DROP TABLE mercado;

-- CRIANDO UMA TABELA
CREATE TABLE mercado(
	produto_id integer,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2));
	
-- INSERIR ALGUNS DADOS
INSERT INTO mercado (produto_id, nome_produto, tipo_produto, valor_produto)
	VALUES (1, 'Pasta de Dente', 'Higiene', 5.50)
	
-- CONSTRAINTS
-- SERIAL e NOT NULL
CREATE TABLE mercado(
	produto_id SERIAL NOT NULL,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2));
	
INSERT INTO mercado (nome_produto, tipo_produto, valor_produto)
	VALUES ('Pasta de Dente', 'Higiene', 5.50)
	
-- UNIQUE

DROP TABLE IF EXISTS mercado;

CREATE TABLE mercado(
	produto_id integer UNIQUE NOT NULL,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2));

INSERT INTO mercado (produto_id, nome_produto, tipo_produto, valor_produto)
	VALUES 
	(1, 'Pasta de Dente', 'Higiene', 5.50),
	(2, 'Refrigerante', 'Bebidas', 9.80),
	(3, 'Pão de Forma', 'Padaria', 6.20),
	(4, 'Batata Frita', 'Congelados', 17.00);
	
-- DEFAULT
DROP TABLE IF EXISTS mercado;

CREATE TABLE mercado(
	produto_id integer UNIQUE NOT NULL,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2) DEFAULT 0.0);

INSERT INTO mercado (produto_id, nome_produto, tipo_produto, valor_produto)
	VALUES 
	(1, 'Pasta de Dente', 'Higiene', 5.50),
	(2, 'Refrigerante', 'Bebidas', 9.80),
	(3, 'Pão de Forma', 'Padaria', 6.20),
	(4, 'Batata Frita', 'Congelados', 17.00);

INSERT INTO mercado (produto_id, nome_produto, tipo_produto)
	VALUES (5, 'Leite', 'Laticínios');

-- CHECK
DROP TABLE IF EXISTS mercado;

CREATE TABLE mercado(
	produto_id integer UNIQUE NOT NULL,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	estoque integer CHECK(estoque > 0),
	valor_produto numeric(8,2) DEFAULT 0.0);

INSERT INTO mercado (produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	VALUES 
	(1, 'Pasta de Dente', 'Higiene', 20, 5.50),
	(2, 'Refrigerante', 'Bebidas', 50, 9.80),
	(3, 'Pão de Forma', 'Padaria', 4, 6.20),
	(4, 'Batata Frita', 'Congelados', 15, 17.00),
	(5, 'Leite', 'Laticínios', 10, 8.00);

INSERT INTO mercado (produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	VALUES (6, 'Maçã', 'Hortifruti', 2, 2.73);

-- CHAVES - CHAVE PRIMÁRIA (PRIMARY KEY) e ESTRANGEIRA (FOREIGN KEY)
-- pedido ID
-- cliente ID
-- produto IDs (mais de um produto)
-- fornecedor ID

DROP TABLE IF EXISTS mercado, vendas;

CREATE TABLE mercado(
	produto_id integer PRIMARY KEY,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	estoque integer CHECK(estoque > 0),
	valor_produto numeric(8,2) DEFAULT 0.0);

CREATE TABLE vendas (
	venda_id integer PRIMARY KEY,
	quantidade integer,
	produto_id integer REFERENCES "mercado" (produto_id));

-- REVISÃO DE QUERIES

-- TABELAS SALES DA LISTA DE EXERCÍCIOS

-- COMANDO SELECT
SELECT * FROM sales;

SELECT 
	data_pedido,
	cidade,
	custo_garrafa
FROM sales;

-- LIMIT
SELECT *
FROM sales
LIMIT 5;

-- DISTINCT
SELECT
	DISTINCT cidade
FROM
	sales;

-- ORDER BY
SELECT DISTINCT  
	municipio,
	loja_id 
FROM sales
ORDER BY 2, 1;

-- WHERE
SELECT *
FROM sales
WHERE cidade = 'WATERLOO';

-- GROUP BY e AGREGADORES (COUNT, MAX, MIN, SUM, AVG)
SELECT 
	pedido_id,
	count(item_id) AS quantidade,
	sum(total_venda) AS total_pedido
FROM sales
GROUP BY 1
ORDER BY 1;

-- COMANDO HAVING - Condicionantes em agregação
SELECT 
	DISTINCT data_pedido,
	COUNT(DISTINCT pedido_id) AS total_pedidos
FROM 
	sales
GROUP BY 1
HAVING count(DISTINCT pedido_id) > 250
ORDER BY 1;

-- EXERCÍCIOS:

--1- Quais são as 10 marcas que lucraram acima de 1000 dolares no dia 30/11/2022?

SELECT 
	DISTINCT marca_id,
	SUM(total_venda - custo_garrafa*garrafas_vendidas) AS lucro_marca
FROM 
	sales
WHERE data_pedido = '2022-11-30'
GROUP BY 1
HAVING SUM(total_venda - custo_garrafa*garrafas_vendidas) >= 1000
ORDER BY 2 DESC;

--2- Qual a cidade que mais vendeu litros para aqueles que venderam mais do que 2000 litros de bebidas?

SELECT 
	DISTINCT cidade,
	SUM(volume_litros_vendidos) AS litros_vendidos
FROM 
	sales
GROUP BY 1
HAVING SUM(volume_litros_vendidos) >= 2000
ORDER BY 2 DESC;

--3-  Qual o municipio que mais vendeu em dolares para totais menores que 15 mil dolares?

SELECT 
	DISTINCT municipio,
	SUM(total_venda) AS sum_total_venda
FROM 
	sales
GROUP BY 1
HAVING SUM(total_venda) <= 15000
ORDER BY 2 DESC;

--4- Quais as 5 marcas que tiveram os menores custos nas cidades de WATERLOO e DES MOINES?

SELECT 
	DISTINCT marca_id,
	SUM(pacote*custo_garrafa) AS sum_custo_garrafa
FROM 
	sales
WHERE cidade = 'WATERLOO' OR cidade = 'DES MOINES'
GROUP BY 1
ORDER BY 2
LIMIT 5;