# Exercícios SQL da base "Loja"
### E8 - Apresente a query para listar o código e o nome do vendedor com maior número de vendas (contagem), e que estas vendas estejam com o status concluída. As colunas presentes no resultado devem ser, portanto, cdvdd e nmvdd.
```SQL
WITH vendas_concluidas AS (
SELECT
	cdvdd,
	COUNT(*) AS total_vendas
FROM
	tbvendas
WHERE
	status = 'Concluído'
GROUP BY
	cdvdd
)

SELECT
	tbvendedor.cdvdd,
	tbvendedor.nmvdd
FROM
	tbvendedor
LEFT JOIN vendas_concluidas
  ON tbvendedor.cdvdd = vendas_concluidas.cdvdd
ORDER BY
	vendas_concluidas.total_vendas DESC
LIMIT 1;
```
|cdvdd|nmvdd       |
|:-----:|:------------:|
|   2 |Vendedor 2  |

### Apresente a query para listar o código e nome do produto mais vendido entre as datas de 2014-02-03 até 2018-02-02, e que estas vendas estejam com o status concluída. As colunas presentes no resultado devem ser cdpro e nmpro.
```SQL
SELECT cdpro, nmpro
FROM tbvendas
WHERE DATE(dtven)  >= '2014-02-03' AND DATE(dtven)  <= '2018-02-02'
  AND status = 'Concluído'
GROUP BY cdpro
ORDER BY COUNT(*) DESC
LIMIT 1;
```
|cdpro|nmpro    |
|:----:|:----------:|
|    1|Produto A|

### E10 - A comissão de um vendedor é definida a partir de um percentual sobre o total de vendas (quantidade * valor unitário) por ele realizado. O percentual de comissão de cada vendedor está armazenado na coluna perccomissao, tabela tbvendedor. Com base em tais informações, calcule a comissão de todos os vendedores, considerando todas as vendas armazenadas na base de dados com status concluído. As colunas presentes no resultado devem ser vendedor, valor_total_vendas e comissao. O valor de comissão deve ser apresentado em ordem decrescente arredondado na segunda casa decimal.
```SQL
SELECT
	tbvendedor.nmvdd AS vendedor,
	SUM(tbvendas.qtd * tbvendas.vrunt) AS valor_total_vendas,
	ROUND(SUM(tbvendas.qtd * tbvendas.vrunt * tbvendedor.perccomissao/100.0), 2) AS comissao
FROM
	tbvendas
JOIN tbvendedor ON tbvendas.cdvdd = tbvendedor.cdvdd
WHERE
	tbvendas.status = 'Concluído'
GROUP BY
	tbvendas.cdvdd
ORDER BY
	comissao DESC;
```
| Vendedor    | Valor Total Vendas | Comissão |
|:-----------:|:-----------------:|:----------:|
| Vendedor 2  | 2,472,020.0       | 24,720.2 |
| Vendedor 8  | 1,237,250         | 6,186.25 |
| Vendedor 10 | 747,250           | 3,736.25 |
| Vendedor 5  | 270,122.5         | 1,350.61 |
| Vendedor 1  | 121,530.0         | 1,215.3  |
| Vendedor 3  | 57,630.0          | 576.3    |
| Vendedor 7  | 69,700.0          | 348.5    |
| Vendedor 6  | 50,830.0          | 254.15   |
| Vendedor 4  | 42,908.0          | 214.54   |
| Vendedor 9  | 39,100.0          | 195.5    |

### E11 - Apresente a query para listar o código e nome cliente com maior gasto na loja. As colunas presentes no resultado devem ser cdcli, nmcli e gasto, esta última representando o somatório das vendas (concluídas) atribuídas ao cliente.
```SQL
SELECT
	cdcli,
	nmcli,
	SUM(tbvendas.qtd * tbvendas.vrunt) AS gasto
FROM
	tbvendas
WHERE
	status = 'Concluído'
GROUP BY
	cdcli
ORDER BY
	gasto DESC
LIMIT 1;
```
|cdcli|nmcli      |gasto  |
|:-----:|:--------:|:------:|
|    9|Cliente BCA|1237250|

### E12 - Apresente a query para listar código, nome e data de nascimento dos dependentes do vendedor com menor valor total bruto em vendas (não sendo zero). As colunas presentes no resultado devem ser cddep, nmdep, dtnasc e valor_total_vendas. Observação: Apenas vendas com status concluído.
```SQL
SELECT
    tbdependente.cddep,
    tbdependente.nmdep,
    tbdependente.dtnasc,
    SUM(tbvendas.qtd * tbvendas.vrunt) AS valor_total_vendas
FROM
    tbvendas
INNER JOIN tbvendedor ON tbvendas.cdvdd = tbvendedor.cdvdd
INNER JOIN tbdependente ON tbvendas.cdvdd = tbdependente.cdvdd
WHERE
	tbvendas.status = 'Concluído'
GROUP BY
    tbvendas.cdvdd
ORDER BY
    valor_total_vendas
LIMIT 1;
```
|cddep|nmdep       |dtnasc             |valor_total_vendas|
|:-----:|:-----------:|:------------------:|:------------------:|
|   6|Dependente 6|2018-03-02 00:00:00|           39100.0|

### E13 - Apresente a query para listar os 10 produtos menos vendidos pelos canais de E-Commerce ou Matriz (Considerar apenas vendas concluídas).  As colunas presentes no resultado devem ser cdpro, nmcanalvendas, nmpro e quantidade_vendas.
```SQL
SELECT
    cdpro,
    nmcanalvendas,
    nmpro,
    SUM(qtd) as quantidade_vendas
FROM
    tbvendas
WHERE
    nmcanalvendas IN ('Ecommerce', 'Matriz')
    AND status = 'Concluído'
GROUP BY
    cdpro,
    nmcanalvendas
ORDER BY
    quantidade_vendas
LIMIT 10;
```
|cdpro|nmcanalvendas|nmpro       |quantidade_vendas|
|:-----:|:-------------:|:------------:|:---------------:|
|    2|Ecommerce    |Produto C   |            15250|
|    3|Ecommerce    |Produto E   |            19730|
|    4|Ecommerce    |Produto SL  |            72250|
|    4|Matriz       |Produto SL  |            82750|
|    3|Matriz       |Produto E   |            86300|
|    5|Matriz       |Produto CH  |           120270|
|    6|Ecommerce    |Produto TN  |           232250|
|    1|Ecommerce    |Produto A   |           255700|
|    2|Matriz       |Produto C   |           444250|
|    1|Matriz       |Produto A   |          1102500|
### E14 - Apresente a query para listar o gasto médio por estado da federação. As colunas presentes no resultado devem ser estado e gastomedio. Considere apresentar a coluna gastomedio arredondada na segunda casa decimal e ordenado de forma decrescente. Observação: Apenas vendas com status concluído.
```SQL
SELECT
    estado,
    ROUND(AVG(qtd * vrunt), 2) AS gastomedio
FROM
    tbvendas
WHERE
    status = 'Concluído'
GROUP BY
    estado
ORDER BY
    gastomedio DESC;
```
|estado             |gastomedio|
|:-------------------:|:----------:|
|Rio de Janeiro     |  176750.0|
|Rio Grande do Sul  |  120270.0|
|São Paulo          |  106750.0|
|Ceará              |  53373.33|
|Mato Grosso do Sul |  19278.18|
|Tocantins          |   10125.0|
|Paraíba            |    7480.0|
|Alagoas            |    6970.0|
|Piauí              |   6067.31|
|Santa Catarina     |    4760.0|
|Bahia              |   4363.33|
|Goiás              |    4250.0|
|Rio Grande do Norte|   4116.43|
|Minas Gerais       |   3908.74|

### E15 - Apresente a query para listar os códigos das vendas identificadas como deletadas. Apresente o resultado em ordem crescente.
```SQL
SELECT
	cdven
FROM
	tbvendas
WHERE
	deletado = 1
ORDER BY
	cdven;
```
|cdven|
|-----|
|   23|
|   55|
|   67|

### E16 - Apresente a query para listar a quantidade média vendida de cada produto agrupado por estado da federação. As colunas presentes no resultado devem ser estado e nmprod e quantidade_media. Considere arredondar o valor da coluna quantidade_media na quarta casa decimal. Ordene os resultados pelo estado (1º) e nome do produto (2º). Obs: Somente vendas concluídas.
```SQL
SELECT
    estado,
    nmpro,
    ROUND(AVG(qtd), 4) AS quantidade_media
FROM
    tbvendas
WHERE
    status = 'Concluído'
GROUP BY
    estado,
    nmpro
ORDER BY
    estado,
    nmpro;
```
|estado             |nmpro       |quantidade_media|
|:-----------------:|:----------:|:--------------:|
|Alagoas            |Produto A   |         20500.0|
|Bahia              |Produto A   |      13590.9091|
|Ceará              |Produto C   |      13282.6087|
|Goiás              |Produto A   |         12500.0|
|Mato Grosso do Sul |Produto E   |       9639.0909|
|Minas Gerais       |Produto A   |         10050.0|
|Paraíba            |Produto A   |         23250.0|
|Piauí              |Produto SL  |      12916.6667|
|Rio Grande do Norte|Produto A   |      12107.1429|
|Rio Grande do Sul  |Produto CH  |      13363.3333|
|Rio de Janeiro     |Produto C   |         25250.0|
|Santa Catarina     |Produto A   |         14000.0|
|São Paulo          |Produto C   |         15250.0|
|Tocantins          |Produto TN  |      33178.5714|




