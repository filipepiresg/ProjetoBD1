SELECT  CLI.ID_CLIENTE AS "ID_CLIENTE",
        SUM(ITEM.PRECO_UNITARIO * ITEM.QUANTIDADE) as "TOTAL_GASTO"
FROM CLIENTE CLI
INNER JOIN VENDA VENDA ON CLI.ID_CLIENTE = VENDA.ID_CLIENTE
INNER JOIN ITEM_VENDA ITEM ON VENDA.ID_VENDA = ITEM.ID_VENDA
GROUP BY CLI.ID_CLIENTE