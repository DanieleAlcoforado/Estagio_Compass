-- Dimensão Tempo:
CREATE TABLE dim_tempo (
    id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ano INTEGER,
    decada INTEGER
);
-- Inserindo dados representando décadas
INSERT INTO dim_tempo (ano, decada)
SELECT DISTINCT f.ano_lancamento, (f.ano_lancamento - (f.ano_lancamento % 10)) AS decada
FROM Filme f;



-- Dimensão Gênero:
CREATE TABLE dim_genero (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255)
);
-- Inserindo dados de gênero
INSERT INTO dim_genero(id,nome)
SELECT DISTINCT g.id, g.nome
FROM Genero g;




-- Dimensão Idioma:
CREATE TABLE dim_idioma (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(2)
);
-- Inserindo dados de idioma:
INSERT INTO dim_idioma (id,nome)
SELECT DISTINCT i.id, i.nome
FROM Idioma i;




-- Dimensão Filme:
CREATE TABLE fato_filme (
    id_filme INTEGER,
    titulo TEXT,
    ano_lancamento INTEGER,
    popularidade REAL,
    nota_media REAL,
    id_idioma VARCHAR (2),
    id_genero VARCHAR (255)
);
-- Inserir dados de filmes
INSERT INTO fato_filme (id_filme, titulo, ano_lancamento, popularidade, nota_media, id_idioma, id_genero)
SELECT
    f.id_filme,
    f.titulo,
    f.ano_lancamento,
    f.popularidade,
    f.nota_media,
	f.id_idioma,
	fg.id_genero
FROM Filme f
JOIN Filme_Genero fg ON f.id_filme = fg.id_filme




