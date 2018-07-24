SELECT  C.ID_CLIENTE AS "ID", 
        (C.END_RUA || ', ' || NVL(C.END_NUM,'S/N') || ' ' || C.END_CEP ||  '. '|| C.END_CIDADE || '-' || C.END_ESTADO || ' ' || C.END_PAIS) AS "Endereço",
        C.SEXO AS "Sexo"
FROM CLIENTE C
INNER JOIN VENDA V ON C.ID_CLIENTE = V.ID_CLIENTE
ORDER BY C.SEXO
