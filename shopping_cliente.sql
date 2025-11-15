use shopping_client;
CREATE TABLE shopping_cliente (
    id_cliente INT,
    idade INT,
    genero VARCHAR(20),
    item_comprado VARCHAR(50),
    categoria VARCHAR(50),
    valor_compra DECIMAL(10,2),
    localizacao VARCHAR(100),
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    estacao VARCHAR(20),
    avaliacao FLOAT,
    assinatura VARCHAR(10),
    tipo_envio VARCHAR(50),
    desconto_aplicado VARCHAR(10),
    compras_anteriores INT,
    metodo_pagamento VARCHAR(30),
    frequencia_compras VARCHAR(30),
    faixa_etaria VARCHAR(30),
    dias_frequencia_compra INT
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shopping_cliente.csv'
INTO TABLE shopping_cliente
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from shopping_cliente limit 10;

-- 1) Qual é a receita total gerada por clientes do sexo masculino vs feminino?
select genero, sum(valor_compra) as valor from shopping_cliente
group by genero;

-- 2) Quais clientes usaram um desconto, mas ainda assim gastaram mais do que o valor médio de compra?
select id_cliente, valor_compra from shopping_cliente
where desconto_aplicado = "Sim" and valor_compra >= (select avg(valor_compra) from shopping_cliente);

-- 3) Quais são os 5 produtos com a maior avaliação média de reviews?
select item_comprado, Round(avg(avaliacao), 2) as "Avaliacao do Produto" from shopping_cliente
group by item_comprado
order by avg(avaliacao) desc
limit 5;

-- 4) Compare os valores médios de compra entre frete padrão e frete expresso
select tipo_envio, Round(avg(valor_compra), 2) from shopping_cliente
where tipo_envio in ( 'Padrão', 'Expresso')
group by tipo_envio;

-- 5) Qual é a contribuição de receita de cada faixa etária?
SELECT 
    faixa_etaria,
    SUM(valor_compra) AS valor_total
FROM shopping_cliente
GROUP BY faixa_etaria
ORDER BY valor_total desc;

-- 6) Quais são os 3 produtos mais comprados em cada categoria 
WITH contagem_produto AS (
    SELECT categoria,
           item_comprado,
           COUNT(id_cliente) AS total_clientes,
           ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY COUNT(id_cliente) DESC) AS produto_placar
    FROM shopping_cliente
    GROUP BY categoria, item_comprado
)
SELECT produto_placar,categoria, item_comprado, total_clientes
FROM contagem_produto
WHERE produto_placar <=3;

-- 7) Clientes assinantes gastam mais? Compare o gasto médio e a receita total entre assinantes e não assinantes. 5
SELECT assinatura,
       COUNT(id_cliente) AS total_clientes,
       ROUND(AVG(valor_compra),2) AS valor_medio_compra,
       ROUND(SUM(valor_compra),2) AS total
FROM shopping_cliente
GROUP BY assinatura
ORDER BY total,valor_medio_compra DESC;

-- 8) Quais 5 produtos têm a maior porcentagem de compras com desconto aplicado? 
SELECT item_comprado,
       ROUND(100.0 * SUM(CASE WHEN desconto_aplicado = 'Sim' THEN 1 ELSE 0 END)/COUNT(*),2) AS taxa_desconto
FROM shopping_cliente
GROUP BY item_comprado
ORDER BY taxa_desconto DESC
LIMIT 5;

-- 9) Segmente os clientes em Novos, Retornantes e Fiéis com base no total de compras anteriores, e mostre a contagem de cada segmento. 
WITH tipo_de_cliente AS (
    SELECT  
        id_cliente,  
        compras_anteriores,
        CASE  
            WHEN compras_anteriores = 1 THEN 'Novo'
            WHEN compras_anteriores BETWEEN 2 AND 10 THEN 'Retornante'
            ELSE 'Fiél'
        END AS segmento_de_clientes
    FROM shopping_cliente
)
SELECT segmento_de_clientes, COUNT(*) AS total_clientes
FROM tipo_de_cliente
GROUP BY segmento_de_clientes;

-- 10) Clientes que compram repetidamente (mais de 5 compras anteriores) também tendem a assinar?
SELECT assinatura,
       COUNT(id_cliente) AS compradores_recorrentes
FROM shopping_cliente
WHERE compras_anteriores > 5
GROUP BY assinatura;









