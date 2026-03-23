USE ecommerce;

-- =====================================
-- 1. SELECT simples
-- =====================================
SELECT * FROM cliente;

-- =====================================
-- 2. Filtro com WHERE
-- =====================================
SELECT nome, preco, estoque
FROM produto
WHERE estoque > 20;

-- =====================================
-- 3. Atributo derivado (subtotal)
-- =====================================
SELECT 
    id_item_pedido,
    quantidade,
    preco_unitario,
    (quantidade * preco_unitario) AS subtotal
FROM item_pedido;

-- =====================================
-- 4. ORDER BY
-- =====================================
SELECT nome, preco
FROM produto
ORDER BY preco DESC;

-- =====================================
-- 5. JOIN básico
-- =====================================
SELECT 
    p.id_pedido,
    c.nome AS cliente
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
ORDER BY p.id_pedido;

-- =====================================
-- 6. Pedidos por cliente (GROUP BY)
-- =====================================
SELECT 
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY total_pedidos DESC;

-- =====================================
-- 7. HAVING
-- =====================================
SELECT 
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
HAVING COUNT(p.id_pedido) > 1;

-- =====================================
-- 8. Total por pedido
-- =====================================
SELECT 
    p.id_pedido,
    c.nome,
    SUM(ip.quantidade * ip.preco_unitario) AS total
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido, c.nome
ORDER BY total DESC;

-- =====================================
-- 9. Produtos e fornecedores
-- =====================================
SELECT 
    pr.nome AS produto,
    f.razao_social AS fornecedor,
    pr.estoque
FROM produto pr
JOIN produto_fornecedor pf ON pr.id_produto = pf.id_produto
JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor;

-- =====================================
-- 10. Fornecedores e produtos
-- =====================================
SELECT 
    f.razao_social AS fornecedor,
    pr.nome AS produto
FROM fornecedor f
JOIN produto_fornecedor pf ON f.id_fornecedor = pf.id_fornecedor
JOIN produto pr ON pf.id_produto = pr.id_produto;

-- =====================================
-- 11. Vendedor também é fornecedor
-- =====================================
SELECT 
    v.razao_social,
    v.cnpj
FROM vendedor_terceiro v
JOIN fornecedor f ON v.cnpj = f.cnpj;

-- =====================================
-- 12. Pedidos com múltiplos pagamentos
-- =====================================
SELECT 
    id_pedido,
    COUNT(*) AS qtd_pagamentos
FROM pagamento
GROUP BY id_pedido
HAVING COUNT(*) > 1;

-- =====================================
-- 13. Consulta completa (JOIN múltiplo)
-- =====================================
SELECT 
    c.nome AS cliente,
    p.id_pedido,
    pr.nome AS produto,
    ip.quantidade,
    (ip.quantidade * ip.preco_unitario) AS subtotal,
    e.status AS entrega_status
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produto pr ON ip.id_produto = pr.id_produto
LEFT JOIN entrega e ON p.id_pedido = e.id_pedido;

-- =====================================
-- 14. Vendas por período (Natal)
-- =====================================
SELECT *
FROM pedido
WHERE data_pedido BETWEEN '2024-11-30' AND '2024-12-24';

-- =====================================
-- 15. Comparação por ano (sazonalidade)
-- =====================================
SELECT 
    YEAR(p.data_pedido) AS ano,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM pedido p
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
WHERE
    (MONTH(p.data_pedido) = 11 AND DAY(p.data_pedido) >= 30)
    OR
    (MONTH(p.data_pedido) = 12 AND DAY(p.data_pedido) <= 24)
GROUP BY ano
ORDER BY ano;