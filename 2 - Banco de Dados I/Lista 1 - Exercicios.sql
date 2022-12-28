-- Base de dados - sales

-- Exercicio 1: Quantos itens distintos foram vendidos (item_id)?
select count(distinct item_id) 
from sales

-- Exercicio 2: Quantas lojas existem na base (loja_id)?
select count(distinct loja_id) 
from sales

-- Exercicio 3: Qual Ã© a cidade que mais tem lojas (loja_id)?
select cidade
		, count(distinct loja_id) 
from sales 
group by 1 
order by 2 desc
limit 1

-- Exercicio 4: Em qual municipio foi vendido mais itens?
select
	municipio
	,sum(garrafas_vendidas)
from sales
group by 1 
order by 2 desc
limit 1

-- Exercicio 5: Qual a cidade mais vendeu em dolares?
select municipio
	,sum(total_venda) 
from sales s 
group by 1 
order by 2 desc
limit 1

-- Exercicio 6: Qual foi o dia que mais vendeu itens distintos?
select
	data_pedido 
	, count(distinct item_id )
from sales
group by 1
order by 2 desc
limit 1

-- Exercicio 7: Monte o top 5 bebidas (item_id) mais vendidas por valor?
select item_id 
		, sum(total_venda)  
from sales
group by 1
order by 2 desc
limit 5


-- Exercicio 8: Monte o top 5 bebidas (item_id) mais vendidas por volume em litros
select item_id 
		, sum(volume_litros_vendidos)  
from sales
group by 1
order by 2 desc
limit 5

-- Exercicio 9: Quais sÃ£o as 10 empresas (marca_id) que mais lucram com a venda de bebidas?
select 
	marca_id 
	,sum((venda_garrafa - custo_garrafa) * garrafas_vendidas) as "lucro final"
from sales
group by 1
order by 2 desc
limit 10

-- Exercicio 10: Monte uma tabela com a quantidade de vendas distintas por dia.
select data_pedido 
	,count(distinct item_id)
from sales
group by 1
order by 2 desc
