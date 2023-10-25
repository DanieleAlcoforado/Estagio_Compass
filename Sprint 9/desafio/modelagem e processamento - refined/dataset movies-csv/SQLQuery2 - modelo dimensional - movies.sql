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

---------------------------------------

-- Dimensão Gênero:
CREATE TABLE dim_genero (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50)
);
-- Inserindo dados de gênero
INSERT INTO dim_genero(id,nome)
SELECT DISTINCT g.id, g.nome
FROM Genero g;

---------------------------------------

-- Dimensão Atores:
CREATE TABLE dim_ator (
    id_ator INTEGER,
	id_filme INTEGER,
    nome VARCHAR(200),
	sexo VARCHAR (10)
);
-- Inserindo dados de atores:
INSERT INTO dim_ator (id_ator,id_filme,nome,sexo)
SELECT fa.id_artista,fa.id_filme,a.nome,s.nome
FROM Filme_Artista fa
JOIN Artista a ON fa.id_artista = a.id
JOIN Sexo s ON a.id_sexo = s.id

----------------------------------------

-- Dimensão Filme:
CREATE TABLE fato_filme (
    id_filme INTEGER,
    titulo TEXT,
    ano_lancamento INTEGER,
    nota_media REAL,
	qtd_votos INTEGER,
    id_genero INTEGER,
	id_artista INTEGER
);
-- Inserir dados de filmes
INSERT INTO fato_filme (id_filme, titulo, ano_lancamento, nota_media, qtd_votos, id_genero, id_artista)
SELECT
    f.id_filme,
    f.titulo,
    f.ano_lancamento,
    f.nota_media,
	f.qtd_votos,
	fg.id_genero,
	fa.id_artista
FROM Filme f
JOIN Filme_Genero fg ON f.id_filme = fg.id_filme
JOIN Filme_Artista fa ON f.id_filme = fa.id_filme;