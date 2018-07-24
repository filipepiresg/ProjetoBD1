 select  ID_DEP as "COD",
        NOME AS "Dependente",
        DT_NASC AS "Dt Nasc", 
        SEXO as "Sexo"
from    DEPENDENTE
where   (EXTRACT(YEAR from DT_NASC) = 2005) and 
        (UPPER(NOME) LIKE '%SILVA%')
order by ID_DEP