# Exercícios de Exportação de Dados
### Os 10 livros mais caros
```SQL
SELECT
	livro.cod AS CodLivro,
	livro.titulo AS Titulo,
	autor.codautor AS CodAutor,
	autor.nome AS NomeAutor,
	livro.valor AS Valor,
	editora.codeditora AS CodEditora,
	editora.nome AS NomeEditora
FROM
	livro
LEFT JOIN autor ON livro.autor = autor.codautor
LEFT JOIN editora ON livro.editora = editora.codeditora
ORDER BY
	livro.valor DESC
LIMIT 10
```
### As 5 editoras com mais livros
```SQL
SELECT
	livro.cod AS CodLivro,
	livro.titulo AS Titulo,
	autor.codautor AS CodAutor,
	autor.nome AS NomeAutor,
	livro.valor AS Valor,
	editora.codeditora AS CodEditora,
	editora.nome AS NomeEditora
FROM
	livro
LEFT JOIN autor ON livro.autor = autor.codautor
LEFT JOIN editora ON livro.editora = editora.codeditora
ORDER BY
	livro.valor DESC
LIMIT 10
```
