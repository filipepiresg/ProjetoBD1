/*13.	Crie uma visão que mostra o nome do produto e o nome do seu fornecedor 
para todos os produtos descontinuados, mesmo que não tenham fornecedor associado
(null no campo id_forn da tabela Produto).*/

CREATE OR REPLACE VIEW PROD_DESCONT(NOMEP,NOMEF) AS
SELECT p.NOME, f.NOME
FROM PRODUTO p
LEFT JOIN FORNECEDOR f ON p.ID_FORN = f.ID_FORN
WHERE p.DESCONTINUADO ='S'