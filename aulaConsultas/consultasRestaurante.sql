--1. Consulta de Total de Vendas por Funcionário
--Esta consulta deve retorna o total de vendas realizadas por cada funcionário, somando o valor total das vendas.
SELECT * FROM vendas

SELECT funcionario_id,
COUNT(venda_codigo),
SUM(venda_total)
FROM vendas
GROUP BY funcionario_id


--2. Consulta de Vendas e Itens Vendidos por Mesa
--Esta consulta deve retorna a quantidade total de itens vendidos e o total das vendas para cada mesa.

--3. Consulta de Produtos Mais Vendidos
--Esta consulta deve retorna os produtos mais vendidos, contando quantas vezes cada um foi vendido.

--4. Consulta de Vendas Mensais por Funcionário
--Esta consulta deve retorna o total de vendas realizadas por cada funcionário em cada mês.