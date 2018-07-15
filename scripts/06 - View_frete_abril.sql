CREATE VIEW VALORES_FRETES_ABRIL AS
select 
 NOME as "Transportadora", sum(FRETE) as "Valor dos Fretes"
 from TRANSPORTADORA
 inner join VENDA
 on ID_TRANSP = FK_TRANSPORTADORA_ID_TRANSP
 where EXTRACT(MONTH from DT_ENTREGA) = 4
group by NOME