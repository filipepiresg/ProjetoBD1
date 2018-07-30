/*3.	Mostre o(s) nome(s) do(s) fornecedor(s) do(s) produto(s) mais vendido(s) 
(produtos que estão em mais vendas) */


SELECT f.NOME
FROM FORNECEDOR f, PRODUTO p, (SELECT v.ID_PROD
                               FROM ITENS_VENDA v
                               WHERE v.QUANTIDADE = (SELECT MAX(QUANTIDADE) 
                         FROM ITENS_VENDA )) iv
WHERE p.ID_PROD = iv.ID_PROD AND f.ID_FORN =  p.ID_FORN                     
                

               
             
