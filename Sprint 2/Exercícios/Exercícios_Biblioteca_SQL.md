# Exercícios SQL da base "Biblioteca"

### E1 - Apresente a query para listar todos os livros publicados após 2014. Ordenar pela coluna cod, em ordem crescente, as linhas. Atenção às colunas esperadas no resultado final: cod, titulo, autor, editora, valor, publicacao, edicao, idioma.
```SQL
SELECT
	*
FROM
	livro
WHERE
	publicacao > '2014-12-31'
ORDER BY
	cod
```
|   cod  |                     titulo                     | autor | editora |  valor | publicacao | edicao |  idioma   |
|:------:|:---------------------------------------------:|:-----:|:-------:|:------:|:----------:|:------:|:---------:|
|   8    |             Artesào de saberes                 |   47  |   13    | 512.22 | 2017-08-23 |   2    | portugues |
|   9    |         Fundamentos de eletrônica              |   46  |   13    | 515.04 | 2016-09-05 |   3    | portugues |
|   25   |              Odontogeriatria                   |   9   |   13    | 357.35 | 2017-02-24 |   2    | portugues |
|   38   | Autos-de-fé como espetáculos de massa          |   36  |   13    | 463.27 | 2018-05-31 |   3    | portugues |
|   45   |            O texto estranho                    |   72  |   13    | 511.84 | 2017-12-24 |   2    | portugues |
|   46   |   Citaçào e modernidade em Alvares de Azevedo  |   18  |   13    | 185.16 | 2017-06-18 |   2    | portugues |
|   49   |          Marx e a liberdade                    |   8   |   13    |  45.62 | 2016-05-31 |   2    | portugues |
|   61   |           A nova obscuridade                   |   47  |   13    | 411.06 | 2017-02-09 |   1    | portugues |
|   62   |           Curso de cunicultura.-               |   12  |   13    | 272.59 | 2015-12-08 |   1    | portugues |
|   69   |          A revoluçào do amor                   |   67  |   13    | 290.22 | 2016-08-14 |   5    | portugues |
|   70   |         Ninguém gosta de mim?                   |   16  |   13    | 175.25 | 2018-02-08 |   1    | portugues |
|   71   |           àtomo e natureza                      |   61  |   13    | 273.76 | 2015-05-23 |   2    | portugues |
|   74   |         Artes marciais mistas                   |   30  |   13    | 144.72 | 2015-05-06 |   1    | portugues |
|   77   |     Por que os gêmeos sào tào iguais?           |   58  |   13    |  46.75 | 2016-07-23 |   2    | portugues |
|   78   |       Ensayos filosofico-juridicos              |   24  |   13    | 313.92 | 2017-11-07 |   3    | portugues |
|   80   | Epidemiologia das helmintoses de bovinos...     |   15  |   13    | 271.93 | 2018-07-28 |   3    | portugues |
|   81   |           Rainforest cities                     |   36  |   13    | 465.83 | 2018-02-19 |   3    | portugues |
|   90   | Desenvolvimento de um protítipo para...          |   52  |   13    | 119.74 | 2017-07-03 |   4    | portugues |
|   95   | Marco de referência de educaçào alimentar...    |   40  |   13    |  284.1 | 2016-05-30 |   1    | portugues |
|   97   |        A psicologia dos psicílogos              |   66  |   13    | 381.36 | 2018-09-02 |   5    | portugues |
|  108   |            San Agustân                          |   49  |   13    | 431.35 | 2015-04-21 |   3    | portugues |
|  119   |         Organizaçào de eventos                   |   33  |   13    | 255.68 | 2015-11-10 |   2    | portugues |
|  128   |             O milho                              |   6   |   13    | 459.11 | 2015-04-07 |   2    | portugues |
|  136   |                Drums                             |   7   |   13    | 253.94 | 2015-07-06 |   3    | portugues |
|  141   |           Shakespeare                           |   8   |   13    | 257.53 | 2015-10-29 |   2    | portugues |
|  142   | Data quality and record linkage techniques       |   6   |   13    | 241.45 | 2017-04-02 |   1    | portugues |
|  147   | Os temas de movimento de Rudolf Laban            |   36  |   1     | 363.6  | 2017-06-20 |   2    | portugues |
|  157   | As bases do processo classificatírio em...       |   11  |   1     | 148.58 | 2018-09-15 |   1    | portugues |
|  161   |         O casamento da Bruxa Onilda              |   36  |   1     | 480.81 | 2015-06-14 |   1    | portugues |
|  165   | Molecular markers, natural history, and...       |   24  |   1     | 324.77 | 2015-05-12 |   1    | portugues |
|  169   | Projeto de aberturas em almas de vigas...        |   38  |   1     | 156.7  | 2018-10-11 |   1    | portugues |
|  172   |         Problemas de estética                    |   72  |   1     | 210.01 | 2016-03-21 |   3    | portugues |


### E2 - Apresente a query para listar os 10 livros mais caros. Ordenar as linhas pela coluna valor, em ordem decrescente. Atenção às colunas esperadas no resultado final:  titulo, valor.
```SQL
SELECT
	titulo,
	valor
FROM
	livro
ORDER BY
	valor DESC
LIMIT 10
```
| título                                      |  valor |
|:---------------------------------------------:|:--------:|
| Princípios de fisiologia animal             | 515.64 |
| Fundamentos de eletrônica                   | 515.04 |
| O verão das rosas                           | 514.7  |
| Artesão de saberes                          | 512.22 |
| O texto estranho                            | 511.84 |
| Limitaciones y usos del derecho de construir| 496.59 |
| Agente penitenciário                        | 489.27 |
| O casamento da Bruxa Onilda                 | 480.81 |
| Direito social na União Européia e Mercosul | 480.8  |
| Machinapolis e a caosmologia do ser         | 479.9  |


### E3 - Apresente a query para listar as 5 editoras com mais livros na biblioteca. O resultado deve conter apenas as colunas quantidade, nome, estado e cidade. Ordenar as linhas pela coluna que representa a quantidade de livros em ordem decrescente.
```SQL
SELECT 
	COUNT(titulo) AS quantidade,
	nome,
	estado,
	cidade
FROM
	livro
LEFT JOIN editora
	ON
	livro.editora = editora.codeditora
LEFT JOIN endereco
	ON
	editora.endereco = endereco.codendereco
GROUP by
	livro.editora
ORDER by
	quantidade DESC
LIMIT 5
```
| quantidade | nome |  estado  |   cidade  |
|------------|------|----------|-----------|
|    138     | CBMM |  PARANÁ  | Guaratuba |
|     30     | Ática| SÃO PAULO| São Paulo |


### E4 - Apresente a query para listar a quantidade de livros publicada por cada autor. Ordenar as linhas pela coluna nome (autor), em ordem crescente. Além desta, apresentar as colunas codautor, nascimento e quantidade (total de livros de sua autoria).
```SQL
SELECT
	autor.nome,
	autor.codautor,
	autor.nascimento,
	COUNT(livro.titulo) AS quantidade
FROM
	autor
LEFT JOIN livro
	ON
	autor.codautor = livro.autor
GROUP BY
	autor.codautor
ORDER BY
	autor.nome;
```
|             nome                      | codautor | nascimento | quantidade |
|:-------------------------------------:|:--------:|:----------:|:----------:|
|          AADNOY, Bernt                |     3    | 1976-04-01 |      2     |
|         ABBASCHIAN,  R                |     4    | 1981-11-23 |      3     |
|        ABE, Jair Minoro               |     5    | 1982-08-12 |      2     |
|       ABRAHAM, Martin A               |     6    | 1983-01-04 |      4     |
|     ABRAMCZUK, André A.               |     7    | 1983-07-27 |      2     |
|       ABRAMOVAY, Ricardo              |     8    | 1984-04-24 |      6     |
|    ABREU, Antônio Suárez              |     9    | 1985-04-17 |      4     |
|   ABUNAHMAN, Sérgio Antonio           |    10    | 1985-06-08 |      0     |
| ACEVEDO MARIN, Rosa Elizabeth         |    11    | 1986-03-03 |      2     |
|    ACEVEDO, Claudia Rosa              |    12    | 1986-03-11 |      2     |
|         AENGEL, Yunus A               |     1    | 1964-12-21 |      1     |
|   AGOSTINHO,  Oswaldo  Luiz           |    14    | 1987-05-30 |      3     |
| AGÊNCIA NACIONAL DE ENERGIA ELÉTRICA...|    13    | 1986-11-03 |      1     |
|      AKABANE, Getulio K.              |    15    | 1988-02-04 |      2     |
|     ALBANO, Ricardo Sonaglio          |    16    | 1988-02-09 |      2     |
| ALBERGUINI, Leny Borghesan A          |    17    | 1988-02-28 |      3     |
|      ALBERTIN, Alberto Luiz           |    18    | 1989-05-24 |      1     |
|         ALBERTS, Bruce                |    19    | 1990-09-13 |      1     |
|  ALEKSEEV, Vladimir Nikolaevich       |    20    | 1991-04-01 |      1     |
|    ALENCAR FILHO, Edgard De           |    21    | 1991-06-06 |      2     |
|      ALEXANDER, Charles K             |    24    | 1992-06-20 |      3     |
|       ALEXÉEV, Michael V.             |    23    | 1992-05-14 |      3     |
|           ALLEN, P. A                 |    25    | 1992-07-14 |      2     |
|    ALLINGER, Norman L (et al)         |    26    | 1992-09-29 |      0     |
| ALMEIDA, Alfredo Wagner Berno De       |    27    | 1992-10-02 |      0     |
|   ALMEIDA, Fernando José De            |    28    | 1993-02-03 |      1     |
|       ALMEIDA, Jalcione                |    29    | 1993-03-29 |      3     |
|  ALMEIDA, Márcio De Souza S. De        |    30    | 1993-04-23 |      1     |
|   ALMEIDA, Rogério Henrique            |    31    | 1993-06-12 |      5     |
|   ALMEIDA, Salvador Luiz De            |    32    | 1993-06-24 |      0     |
|         ALONSO,  Marcelo               |    33    | 1993-08-23 |      2     |
|            ALRO, Helle                 |    34    | 1993-09-08 |      4     |
|       ALTMANN, Wolfgang                |    35    | 1994-03-18 |      2     |
| ALVARENGA, Beatriz Gonçalves De        |    36    | 1994-03-28 |      5     |
|   ALVES, Adilson Francelino            |    37    | 1994-04-02 |      2     |
| ALVES, José Jerônimo De Alencar        |    38    | 1994-08-09 |      3     |
|           ALVES, Rubem                 |    39    | 1994-09-04 |      6     |
|   ALVES, William Pereira               |    40    | 1994-10-26 |      2     |
|     AMABIS, José Mariano               |    41    | 1994-10-31 |      1     |
|         AMADO, Nélia                   |    42    | 1994-11-02 |      2     |
|            AMALDI, U                  |    43    | 1994-11-24 |      2     |
|     AMARAL FILHO, Jair Do              |    44    | 1994-12-07 |      4     |
|    AMARAL, Adriano Benayon Do          |    45    | 1994-12-31 |      5     |
|        AMARAL, Luciano Do              |    46    | 1995-02-09 |      6     |
|     ASTOLFI,  Jean-pierre              |    47    | 1995-02-21 |      5     |
|         ATKINS,  P.  W                 |    48    | 1995-03-02 |      2     |
|   AZEVEDO, Gustavo H. W. De            |    49    | 1995-04-22 |      2     |
|         BABBITT, Harold E              |    51    | 1995-05-16 |      0     |
|           BACCAN, Nivaldo              |    52    | 1995-08-17 |      4     |
|        BACHELARD, Gaston               |    53    | 1995-10-02 |      1     |
|        BALBO, José Tadeu               |    54    | 1995-10-02 |      0     |
| BALTA, Carlos Adolpho Magalhães        |    55    | 1995-10-20 |      1     |
|         BARANENKOV, G. S               |    56    | 1995-10-22 |      1     |
|          BARATA, Ronaldo               |    57    | 1995-11-01 |      2     |
|          BARBALHO, Jader               |    58    | 1995-11-05 |      2     |
|  BARBETTA, Pedro Alberto               |    59    | 1995-11-18 |      2     |
|    BARBOSA,  Ruy  Madsen               |    60    | 1995-12-11 |      2     |
|   BARBOSA, Addson Lourenço             |    61    | 1995-12-17 |      2     |
| BARBOSA, Estêvão José Da Silva         |    62    | 1995-12-22 |      0     |
|    BARBOSA, João Lucas Marques         |    63    | 1995-12-30 |      2     |
|        BARCELOS NETO, João             |    64    | 1996-01-02 |      2     |
|   BARDÁLEZ  HOYOS,  Juan  L            |    65    | 1996-01-13 |      2     |
|         BARISON, Thiago                |    66    | 1996-01-20 |      3     |
|       BARP, Wilson José                |    67    | 1996-02-14 |      7     |
|    BARROS NETO, Benício De              |    68    | 1996-02-15 |      1     |
|   BARROS, Benjamim Ferreira De          |    69    | 1996-02-28 |      4     |
|         BARROS, Carlos                  |    70    | 1996-04-02 |      2     |
|  BARROS, Maria Vitória Martins          |    71    | 1996-04-03 |      0     |
|     BARROS, Regina Mambeli              |    72    | 1996-06-07 |      4     |
|  BARROSO, Leônidas Conceição.           |    73    | 1996-06-09 |      1     |
|     BARSANO, Paulo Roberto              |    74    | 1996-06-09 |      4     |
|         ÁVILA,  Geraldo                 |    2     | 1975-10-08 |      2     |

### E5 - Apresente a query para listar o nome dos autores que publicaram livros através de editoras NÃO situadas na região sul do Brasil. Ordene o resultado pela coluna nome, em ordem crescente. Não podem haver nomes repetidos em seu retorno.
```SQL
SELECT
	autor.nome
FROM
	autor
LEFT JOIN livro ON
	autor.codautor = livro.autor
LEFT JOIN editora ON
	livro.editora = editora.codeditora
LEFT JOIN endereco ON
	editora.endereco = endereco.codendereco
WHERE
	endereco.estado NOT IN ('PARANÁ', 'RIO GRANDE DO SUL', 'SANTA CATARINA')
GROUP BY
	autor.codautor
ORDER BY
	autor.nome;
```
|            nome             |
|:---------------------------:|
|      ABBASCHIAN,  R         |
|      ABE, Jair Minoro       |
|     ABREU, Antônio Suárez   |
|  ACEVEDO MARIN, Rosa Elizabeth |
|     ALEXANDER, Charles K    |
|        ALLEN, P. A          |
|   ALMEIDA, Fernando José De |
|       ALTMANN, Wolfgang     |
| ALVARENGA, Beatriz Gonçalves De |
| ALVES, José Jerônimo De Alencar |
|     ALVES, William Pereira  |
|         AMADO, Nélia        |
|          AMALDI, U          |
|   AMARAL, Adriano Benayon Do |
|       AMARAL, Luciano Do    |
|    ASTOLFI,  Jean-pierre    |
|     BARANENKOV, G. S        |
|       BARATA, Ronaldo       |
|        BARBALHO, Jader      |
|   BARBETTA, Pedro Alberto   |
|    BARBOSA,  Ruy  Madsen    |
| BARDÁLEZ  HOYOS,  Juan  L   |
|       BARISON, Thiago       |
|     BARP, Wilson José       |
|    BARROS, Regina Mambeli   |
|    BARSANO, Paulo Roberto   |


### E6 - Apresente a query para listar o autor com maior número de livros publicados. O resultado deve conter apenas as colunas codautor, nome, quantidade_publicacoes.
```SQL
SELECT
	autor.codautor,
	autor.nome,
	count(livro.autor) AS quantidade_publicacoes
FROM
	autor
LEFT JOIN livro
	ON
	autor.codautor = livro.autor
GROUP BY
	livro.autor
ORDER BY
	quantidade_publicacoes DESC
LIMIT 1
```
| codautor |       nome        | quantidade_publicacoes |
|:--------:|:-----------------:|:---------------------:|
|    67    | BARP, Wilson José |          7            |



### E7 - Apresente a query para listar o nome dos autores com nenhuma publicação. Apresentá-los em ordem crescente.
```SQL
SELECT
	autor.nome
FROM
	autor
LEFT JOIN livro
    ON
	autor.codautor = livro.autor
GROUP BY
	autor.codautor
HAVING
	COUNT(livro.titulo) = 0
ORDER BY
	autor.nome;
SELECT
	*
FROM
	autor
```
|             nome               |
|:-----------------------------:|
| ABUNAHMAN, Sérgio Antonio     |
| ALLINGER, Norman L (et al)    |
| ALMEIDA, Alfredo Wagner Berno De |
| ALMEIDA, Salvador Luiz De     |
| BABBITT, Harold E             |
| BALBO, José Tadeu             |
| BARBOSA, Estêvão José Da Silva|
| BARROS, Maria Vitória Martins |

