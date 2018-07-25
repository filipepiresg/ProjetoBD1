SELECT  CLI.ID_CLIENTE AS "ID", 
        (CLI.END_RUA || ', ' || NVL(CLI.END_NUM,'S/N') || ' ' || CLI.END_CEP ||  '. '|| CLI.END_CIDADE || '-' || CLI.END_ESTADO || ' ' || CLI.END_PAIS) AS "Endereço",
        CLI.SEXO AS "Sexo"
FROM CLIENTE CLI
INNER JOIN VENDA V ON CLI.ID_CLIENTE = V.ID_CLIENTE
INNER JOIN ITENS_VENDA ITEM ON V.ID_VENDA = ITEM.ID_VENDA 
WHERE ((CLI.SEXO = 'F' and )/*  or () */)
-- falta a condicao de o cliente do sexo feminino pegar o valor maximo e o masculino o valor minimo
-- ORDER BY SUM(ITEM.QUANTIDADE * ITEM.PRECO_UNITARIO)
GROUP BY CLI.NOME
