-- Tabelas de locais
create TABLE Pais(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome VARCHAR(100)
);

CREATE TABLE Estado(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idPais INTEGER,
	nome VARCHAR(100),
	FOREIGN KEY (idPais) REFERENCES Pais(id)
);

CREATE TABLE Cidade (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idEstado INTEGER,
	nome VARCHAR(100),
	FOREIGN KEY (idEstado) REFERENCES Estado(id)
);

-- Tabelas de pessoas
CREATE TABLE Cliente (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idCidade INTEGER,
    nome VARCHAR(100),
    FOREIGN KEY (idCidade) REFERENCES Cidade(id)
);

CREATE TABLE Vendedor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idEstado INTEGER,
    nome VARCHAR(255),
    sexo CHAR(1),
    FOREIGN KEY (idEstado) REFERENCES Estado(id)
);


-- Tabelas de carros
CREATE TABLE MarcaCarro (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(80)
);

CREATE TABLE ModeloCarro (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMarcaCarro INTEGER,
    nome VARCHAR(80),
    FOREIGN KEY (idMarcaCarro) REFERENCES MarcaCarro(id)
);

CREATE TABLE Combustivel(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome VARCHAR(20)
);

CREATE TABLE Carro(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idModeloCarro INTEGER,
	idCombustivel INTEGER,
	ano INT,
	FOREIGN KEY (idModeloCarro) REFERENCES ModeloCarro(id),
	FOREIGN KEY (idCombustivel) REFERENCES Combustivel(id)
);

CREATE TABLE CarroClassi(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idCarro INTEGER,
	classiCarro VARCHAR(50),
	FOREIGN KEY (idCarro) REFERENCES Carro(id)
);

-- Tabela Locacao
CREATE TABLE Locacao(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	idCliente INTEGER,
	idVendedor INTEGER,
	idCarroClassi INTEGER,
	carroKm INT,
	dataLocacao DATETIME,
	horaLocacao TIME,
	quantidadeDias INT,
	valorDiaria DECIMAL,
	dataEntrega DATETIME,
	horaEntrega TIME,
	FOREIGN KEY (idCliente) REFERENCES Cliente(id),
	FOREIGN KEY (idVendedor) REFERENCES Vendedor(id),
	FOREIGN KEY (idCarroClassi) REFERENCES CarroClassi(id)
); 