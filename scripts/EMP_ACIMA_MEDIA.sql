/*10. Mostre as matrículas, nomes, funções e salários dos
empregados que ganham acima da média. */

SELECT MATRICULA, NOME, FUNCAO, SALARIO
FROM EMPREGADO
WHERE SALARIO > (SELECT AVG(SALARIO)
                 FROM EMPREGADO);
