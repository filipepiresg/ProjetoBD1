CREATE VIEW VALORES_FRETES_ABRIL AS
    select  T.NOME as "Transportadora", 
            sum(V.FRETE) as "Valor dos Fretes"
    from TRANSPORTADORA T
    inner join VENDA V on T.ID_TRANSP = V.ID_TRANSP
    where (EXTRACT(MONTH from V.DT_ENTREGA) = 4 and EXTRACT(YEAR from V.DT_ENTREGA) = 2018)
    group by T.NOME