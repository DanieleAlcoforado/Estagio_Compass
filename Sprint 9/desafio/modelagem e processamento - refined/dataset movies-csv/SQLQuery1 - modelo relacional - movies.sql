CREATE TABLE Genero (
	id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nome VARCHAR (50)
);
INSERT INTO Genero (nome)
SELECT DISTINCT c.genero
FROM dbo.df_crime_trusted c;

select * from Genero
---------------------------------

CREATE TABLE Filme_Genero (
	id_filme INTEGER,
	id_genero INTEGER
);
INSERT INTO Filme_Genero (id_filme, id_genero)
SELECT c.idFilme, g.id
FROM dbo.df_crime_trusted c
JOIN dbo.Genero g ON c.genero = g.nome;

select * from Filme_Genero

---------------------------------	

CREATE TABLE Sexo (
	id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nome VARCHAR (10)
);
INSERT INTO Sexo (nome)
SELECT DISTINCT generoArtista
FROM dbo.df_elenco;

---------------------------------

CREATE TABLE Artista (
	id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nome VARCHAR (200),
	id_sexo INTEGER
);
INSERT INTO Artista (nome, id_sexo)
SELECT DISTINCT e.nomeArtista, s.id
FROM dbo.df_elenco e
JOIN dbo.Sexo s ON e.generoArtista = s.nome;

---------------------------------

CREATE TABLE Filme_Artista (
	id_filme INTEGER,
	id_artista INTEGER
);
INSERT INTO Filme_Artista (id_filme, id_artista)
SELECT e.idFilme, a.id
FROM dbo.df_elenco e
JOIN dbo.Artista a ON e.nomeArtista = a.nome;

----------------------------------

CREATE TABLE Filme (
	id_filme INTEGER PRIMARY KEY,
	titulo TEXT,
	ano_lancamento INTEGER,
	duracao_min INTEGER,
	nota_media REAL,
	qtd_votos INTEGER
);
INSERT INTO Filme (id_filme,titulo,ano_lancamento,duracao_min,nota_media,qtd_votos)
SELECT DISTINCT idFilme, tituloPincipal, anoLancamento, tempoMinutos, notaMedia, numeroVotos
FROM dbo.df_crime_trusted