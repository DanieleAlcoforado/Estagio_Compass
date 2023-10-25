-- Criando a tabela filme_genero
CREATE TABLE Filme_Genero (
	id_filme INTEGER,
    id_genero INTEGER
);
-- Insira os dados na tabela filme_genero usando uma consulta de junção (JOIN)
INSERT INTO Filme_Genero (id_filme, id_genero)
SELECT f.id_filme, g.id
FROM dbo.df_tmdb_trusted f
JOIN dbo.Genero g ON f.id_genero = g.id;



-- Criando tabela idioma
CREATE TABLE Idioma (
    id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nome VARCHAR (2)
);
-- Inserindo os dados na tabela 
INSERT INTO Idioma (nome)
SELECT DISTINCT idioma_original
FROM dbo.df_tmdb_trusted



-- Criando tabela filme
CREATE TABLE Filme (
    id_filme INTEGER,
    id_idioma INTEGER,
    titulo TEXT,
    ano_lancamento INTEGER,
    popularidade REAL,
    nota_media REAL,
    qtd_votos INTEGER
);
-- Inserindo os dados na tabela
INSERT INTO Filme (id_filme,id_idioma,titulo,ano_lancamento,popularidade,nota_media,qtd_votos)
SELECT DISTINCT t.id_filme, i.id, t.titulo, t.ano_lancamento, t.popularidade, t.nota_media, t.qtd_votos
FROM dbo.df_tmdb_trusted t
JOIN dbo.Idioma i ON t.idioma_original = i.nome;

SELECT * FROM Filme




