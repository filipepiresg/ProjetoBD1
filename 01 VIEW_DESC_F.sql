CREATE VIEW DESC_F AS

      SELECT c.NOME, c.ID_CLIENTE
      FROM CLIENTE c, (SELECT vp.FK_VENDA_ID_VENDA, v.ID_VENDA, v.ID_CLIENTE
                       FROM VENDA_PRODUTO vp, VENDA v
                       WHERE vp.DESCONTO > 20 AND vp.FK_VENDA_ID_VENDA = v.ID_VENDA) x
      WHERE SEXO = 'F' AND x.ID_CLIENTE = c.ID_CLIENTE