SELECT*
FROM clientes

//*Profiss�o dos clientes*//
SELECT DISTINCT profissao
FROM clientes

//*Qtde. de clientes por profiss�o*//
SELECT DISTINCT count (id_cliente) as 'Qtd. de Clientes', profissao
FROM clientes
group by profissao

//*M�dia de idade dos cliente por profiss�o *//

SELECT AVG(CAST(idade as numeric)) as 'M�dia de Idade' , profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'M�dia de Idade' desc

//*M�dia de sal�rio anual dos clientes por profiss�o*//
SELECT AVG(CAST(salario_anual as numeric)) as 'M�dia de Salario Anual', profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'M�dia de Salario Anual' desc

//*M�dia mensal sal�rios dos clientes por profiss�o *//
SELECT (AVG(CAST(salario_anual as numeric))/12) as 'M�dia de Salario Mensal', profissao
FROM clientes
GROUP BY profissao 
ORDER BY 'M�dia de Salario Mensal' desc

//*Maiores sal�rios dos clientes por profiss�o*//

//*Menores sal�rios dos clientes por profiss�o*//

SELECT TOP (15) profissao , salario_anual
FROM clientes
GROUP BY profissao , salario_anual
ORDER BY salario_anual asc

//* faixa de sal�rios *//

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

//* % de sal�rios por profiss�o   *///

SELECT cast(count(p.salario_anual) as numeric(10,3)) as 'Qtd. de Clientes', p.profissao,
cast((count (p.salario_anual) / tmp.total)*100 as numeric(10,3)) as '% de sal�rios por profiss�o'
from clientes p , (SELECT cast(count (salario_anual) as numeric(10,3)) total from clientes ) tmp
group by p.profissao , tmp.total

//*Qtde. de contas e cart�es por profiss�o*//

SELECT DISTINCT profissao , SUM (CAST (num_contas as numeric)) as 'Qtde de Contas por Profiss�o'
FROM clientes
GROUP BY  profissao
ORDER BY 'Qtde de Contas por Profiss�o' desc

SELECT DISTINCT profissao , SUM (CAST (num_cartoes as numeric)) as 'Qtde de Cart�es por Profiss�o'
FROM clientes
GROUP BY  profissao
ORDER BY 'Qtde de Cart�es por Profiss�o' desc