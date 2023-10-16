-- Inserindo os dados nas tabelas
INSERT OR IGNORE INTO Pais (nome)
SELECT DISTINCT paisCliente
FROM tb_locacao;


INSERT OR IGNORE INTO Estado (idPais, nome)
SELECT DISTINCT Pais.id, tb_locacao.estadoCliente
FROM tb_locacao
JOIN Pais ON tb_locacao.paisCliente = Pais.nome
WHERE tb_locacao.estadoCliente IS NOT NULL;


INSERT OR IGNORE INTO Estado (idPais, nome)
SELECT DISTINCT null, tb_locacao.estadoVendedor
FROM tb_locacao
WHERE tb_locacao.estadoVendedor NOT IN (SELECT nome FROM Estado);


INSERT OR IGNORE INTO Cidade (idEstado, nome)
SELECT DISTINCT Estado.id, tb_locacao.cidadeCliente
FROM tb_locacao
JOIN Estado ON tb_locacao.estadoCliente = Estado.nome
WHERE tb_locacao.cidadeCliente IS NOT NULL;


INSERT OR IGNORE INTO Cliente (id, idCidade, nome)
SELECT DISTINCT tb_locacao.idCliente, Cidade.id, tb_locacao.nomeCliente
FROM tb_locacao
JOIN Cidade ON tb_locacao.cidadeCliente = Cidade.nome
WHERE tb_locacao.nomeCliente IS NOT NULL;


INSERT OR IGNORE INTO Vendedor (id, idEstado, nome, sexo)
SELECT DISTINCT tb_locacao.idVendedor, Estado.id, tb_locacao.nomeVendedor, tb_locacao.sexoVendedor
FROM tb_locacao
JOIN Estado ON tb_locacao.estadoVendedor = Estado.nome
WHERE tb_locacao.nomeVendedor IS NOT NULL;


INSERT OR IGNORE INTO MarcaCarro (nome)
SELECT DISTINCT tb_locacao.marcaCarro
FROM tb_locacao
WHERE tb_locacao.marcaCarro IS NOT NULL;


INSERT OR IGNORE INTO ModeloCarro (idMarcaCarro, nome)
SELECT DISTINCT MarcaCarro.id, tb_locacao.modeloCarro
FROM tb_locacao
JOIN MarcaCarro ON tb_locacao.marcaCarro = MarcaCarro.nome 
WHERE tb_locacao.modeloCarro IS NOT NULL;


INSERT OR IGNORE INTO Combustivel (id, nome)
SELECT DISTINCT tb_locacao.idcombustivel, tb_locacao.tipoCombustivel
FROM tb_locacao
WHERE tb_locacao.tipoCombustivel IS NOT NULL;


INSERT OR IGNORE INTO Carro (idModeloCarro, idCombustivel, ano)
SELECT DISTINCT ModeloCarro.id, Combustivel.id, tb_locacao.anoCarro
FROM tb_locacao
JOIN ModeloCarro ON tb_locacao.modeloCarro = ModeloCarro.nome
JOIN Combustivel ON tb_locacao.idcombustivel = Combustivel.id


INSERT OR IGNORE INTO CarroClassi (id, idCarro, classiCarro)
SELECT DISTINCT tb_locacao.idCarro, Carro.id, tb_locacao.classiCarro
FROM tb_locacao
JOIN ModeloCarro ON tb_locacao.modeloCarro = ModeloCarro.nome
JOIN Combustivel ON tb_locacao.idcombustivel = Combustivel.id
JOIN Carro ON tb_locacao.anoCarro = Carro.ano AND ModeloCarro.id = Carro.idModeloCarro AND Combustivel.id = Carro.idCombustivel


INSERT OR IGNORE INTO Locacao (id, idCliente, idVendedor, idCarroClassi, carroKm, dataLocacao, horaLocacao, quantidadeDias, valorDiaria, dataEntrega, horaEntrega)
SELECT DISTINCT tl.idLocacao, tl.idCliente, tl.idVendedor, tl.idCarro, tl.kmCarro, tl.dataLocacao, tl.horaLocacao, tl.qtdDiaria, tl.vlrDiaria, tl.dataEntrega, tl.horaEntrega
FROM tb_locacao as tl





