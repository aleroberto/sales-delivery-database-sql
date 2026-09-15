
-- Operational reports for the sales and delivery database
-- SQL Server / T-SQL
-- Reference period: June 2020


-- ============================================================
-- WEEKLY SALES REPORTS
-- ============================================================

-- Week 1: June 1 to June 8
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-01' AND '2020-06-08'
ORDER BY data, codigo;


-- Week 2: June 9 to June 15
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-09' AND '2020-06-15'
ORDER BY data, codigo;


-- Week 3: June 16 to June 22
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-16' AND '2020-06-22'
ORDER BY data, codigo;


-- Week 4: June 23 to June 30
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-23' AND '2020-06-30'
ORDER BY data, codigo;


-- ============================================================
-- BIWEEKLY SALES REPORTS
-- ============================================================

-- First half of June: June 1 to June 15
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-01' AND '2020-06-15'
ORDER BY data, codigo;


-- Second half of June: June 16 to June 30
SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-16' AND '2020-06-30'
ORDER BY data, codigo;


-- ============================================================
-- MONTHLY SALES REPORT
-- ============================================================

SELECT
    codigo AS [Nr Pedido],
    data AS [Data Pedido]
FROM Pedido
WHERE data BETWEEN '2020-06-01' AND '2020-06-30'
ORDER BY data, codigo;


-- ============================================================
-- SALES BY ATTENDANT
-- ============================================================

SELECT
    Atendente.matricula AS [Matricula],
    Atendente.nomeCompleto AS [Atendente],
    COUNT(Atendente_Comissao.fk_Pedido_codigo) AS [Total de vendas]
FROM Atendente_Comissao
INNER JOIN Atendente
    ON Atendente_Comissao.fk_Atendente_matricula = Atendente.matricula
GROUP BY
    Atendente.matricula,
    Atendente.nomeCompleto
ORDER BY
    [Total de vendas] DESC;


-- ============================================================
-- SALES BY DELIVERY TYPE
-- ============================================================

SELECT
    Entrega.descricao AS [Tipo de entrega],
    COUNT(Pedido.codigo) AS [Total de pedidos]
FROM Pedido
INNER JOIN Entrega
    ON Pedido.fk_Entrega_codigo = Entrega.codigo
GROUP BY
    Entrega.codigo,
    Entrega.descricao
ORDER BY
    [Total de pedidos] DESC;


-- ============================================================
-- SALES BY PAYMENT TYPE
-- ============================================================

SELECT
    Pagamento.descricao AS [Forma de pagamento],
    COUNT(Pedido.codigo) AS [Total de pedidos]
FROM Pedido
INNER JOIN Pagamento
    ON Pedido.fk_Pagamento_codigo = Pagamento.codigo
GROUP BY
    Pagamento.codigo,
    Pagamento.descricao
ORDER BY
    [Total de pedidos] DESC;
