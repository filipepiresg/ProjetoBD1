CREATE OR REPLACE TRIGGER frete_bonus 
AFTER UPDATE OF DT_ENTREGA ON VENDA
FOR EACH ROW
WHEN (TRUNC(NEW.DT_ENTREGA - NEW.DT_VENDA) > 30)
DECLARE 
    bonus NUMBER(6, 2);
BEGIN
    SELECT BONUS INTO bonus
    FROM CLIENTE c
    WHERE c.ID_CLIENTE = :NEW.ID_CLIENTE;
    
    IF (bonus IS NULL) THEN
        UPDATE CLIENTE a
        SET a.BONUS = :NEW.FRETE
        WHERE a.ID_CLIENTE = :NEW.ID_CLIENTE;
    ELSE
        UPDATE CLIENTE a
        SET a.BONUS = a.BONUS + :NEW.FRETE
        WHERE a.ID_CLIENTE = :NEW.ID_CLIENTE;
    END IF;
END;
