-- A tabela Fato permite que sejam feitas análises importantes, como quais clientes mais frequentes,
-- pode-se fazer um groupby para analisar quais vendedores mais venderam, quais carros foram mais escolhidos,
-- com os atributo totalPago gerado nessa view e com as datas de locação podem ser analisadas as receitas geradas
-- de acordo com os períodos de interesse. 
CREATE VIEW fato_locacao AS
SELECT
    id as idLocacao,
    idCliente as idCliente,
    idVendedor as idVendedor,
    dataLocacao as dataLocacao,
    idCarroClassi as idCarro,
    quantidadeDias * valorDiaria as totalPago
FROM Locacao;


-- A dimensão Cliente permite que sejam feitas análises mais específicas a partir da Fato. Por exemplo,
-- podem ser observados os nomes dos clientes mais frequentes e em quais cidades ou estados a empresa possui
-- mais clientes.
CREATE VIEW dim_cliente AS
SELECT
    C.nome AS NomeCliente,
    CI.nome AS Cidade,
    E.nome AS Estado
FROM Cliente C
JOIN Cidade CI ON C.idCidade = CI.id
JOIN Estado E ON CI.idEstado = E.id;


-- A dimensão Carro permite análises específicas sobre os carros, como por exemplo, pode ser analisado
-- quais modelos de carros mais foram locados, podendo indicar, aqueles que mais agradam os clientes.
CREATE VIEW dim_carro AS
SELECT
    M.nome AS Marca,
    MC.nome AS Modelo,
    C.ano AS Ano,
    COUNT(L.id) AS ContagemLocacoes
FROM Carro C
JOIN ModeloCarro MC ON C.idModeloCarro = MC.id
JOIN MarcaCarro M ON MC.idMarcaCarro = M.id
LEFT JOIN CarroClassi CC ON C.id = CC.idCarro
LEFT JOIN Locacao L ON CC.id = L.idCarroClassi
GROUP BY M.nome, MC.nome, C.ano;


-- A dimensão Vendedor permite que sejam analisadas quantas locações foram feitas por vendedor e informações
-- específicas a respeito deles, o que pode ser interessante para a empresa entender o perfil de seus funcionários.
CREATE VIEW dim_vendedor AS
SELECT
    V.nome AS NomeVendedor,
    V.sexo AS Sexo,
    E.nome AS Estado,
    COUNT(L.id) AS QuantidadeLocacoes
FROM Vendedor V
JOIN Estado E ON V.idEstado = E.id
LEFT JOIN Locacao L ON V.id = L.idVendedor
GROUP BY V.nome, V.sexo, E.nome;








