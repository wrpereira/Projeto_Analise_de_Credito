SELECT*
FROM clientes

//*Profissão dos clientes*//
SELECT DISTINCT profissao
FROM clientes

//*Qtde. de clientes por profissão*//
SELECT DISTINCT count (id_cliente) as 'Qtd. de Clientes', profissao
FROM clientes
group by profissao

//*Média de idade dos cliente por profissão *//

SELECT AVG(CAST(idade as numeric)) as 'Média de Idade' , profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'Média de Idade' desc

//*Média de salário anual dos clientes por profissão*//
SELECT AVG(CAST(salario_anual as numeric)) as 'Média de Salario Anual', profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'Média de Salario Anual' desc

//*Média mensal salários dos clientes por profissão *//
SELECT (AVG(CAST(salario_anual as numeric))/12) as 'Média de Salario Mensal', profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'Média de Salario Mensal' desc

//*Maiores salários dos clientes por profissão*//

//*Menores salários dos clientes por profissão*//

SELECT TOP (15) profissao , salario_anual
FROM clientes
GROUP BY profissao , salario_anual
ORDER BY salario_anual asc

//* faixa de salários *//

SELECT DISTINCT profissao,
	CASE
		WHEN cast(salario_anual as decimal) BETWEEN 0 AND 40000.00 THEN 'ate 40k'
		WHEN cast(salario_anual as decimal) BETWEEN 40000.01 AND 80000.00 THEN '40K ate 80k'
		WHEN cast(salario_anual as decimal) BETWEEN 80000.01 AND 120000.00 THEN '80K ate 120k'
		WHEN cast(salario_anual as decimal) BETWEEN 120000.01 AND 160000.00 THEN '120K ate 160k'
		ELSE 'ACIMA DE 160K'
	END as 'Faixa de salario'
FROM clientes
ORDER BY profissao asc

//* % de salários por profissão   *///

SELECT cast(count(p.salario_anual) as numeric(10,3)) as 'Qtd. de Clientes', p.profissao,
cast((count (p.salario_anual) / tmp.total)*100 as numeric(10,3)) as '% de salários por profissão'
from clientes p , (SELECT cast(count (salario_anual) as numeric(10,3)) total from clientes ) tmp
group by p.profissao , tmp.total

//*Qtde. de contas e cartões por profissão*//

SELECT DISTINCT profissao , SUM (CAST (num_contas as numeric)) as 'Qtde de Contas por Profissão'
FROM clientes
GROUP BY  profissao
ORDER BY 'Qtde de Contas por Profissão' desc

SELECT DISTINCT profissao , SUM (CAST (num_cartoes as numeric)) as 'Qtde de Cartões por Profissão'
FROM clientes
GROUP BY  profissao
ORDER BY 'Qtde de Cartões por Profissão' desc