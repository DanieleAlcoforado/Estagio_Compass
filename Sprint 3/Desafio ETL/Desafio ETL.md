```python
# função que faz a interpretação da linha de um .csv
def dividir_linha(linha):
    linha_dividida = [] # lista que armazenará os valores de cada linha
    valor_atual = "" # variável auxiliar que armazena por caractere cada valor da linha
    entre_aspas = False # variável que verifica se um valor da linha está entre aspas

    # percorre cada caractere para fazer o tratamento adequado
    for char in linha:
        if char == '"': # verifica se houve abertura ou fechamento de aspas
            entre_aspas = not entre_aspas 
        elif char == ',' and not entre_aspas: # verifica se a vírgula está como separador de coluna
            linha_dividida.append(valor_atual.strip())
            valor_atual = ""
        else: # se não, o caractere é adicionado ao valor atual
            valor_atual += char

    # adicionando o último valor após o último separador da linha do .csv
    linha_dividida.append(valor_atual.strip())
    return linha_dividida

# acessando o arquivo "actors.csv"
arquivo_original = 'C:\\Users\\Danie\\Documents\\Desafio ETL\\actors.csv'

# lista vazia que vai armazenar os dados/conteúdo do arquivo "actors.csv"
conteudo_actors = []

#acessando o arquivo e lendo as linhas
with open(arquivo_original,'r') as arquivo:
  linhas = arquivo.readlines() 

  for linha in linhas:
    colunas = dividir_linha(linha.strip())
    conteudo_actors.append(colunas)
```


```python
# acessar a primeira linha, que é referente ao cabeçalho do arquivo
primeira_linha = conteudo_actors[0]

primeira_linha
```




    ['Actor',
     'Total Gross',
     'Number of Movies',
     'Average per Movie',
     '#1 Movie',
     'Gross']



### 1) Apresente o ator/atriz com maior número de filmes e a respectiva quantidade.


```python
txt_1 = "C:\\Users\\Danie\\Documents\\Desafio ETL\\etapa-1.txt"
maior_valor = 0
nome_ator = ""

for linha in conteudo_actors[1:]:
    if maior_valor < int(linha[2]):
        maior_valor = int(linha[2])
        nome_ator = linha[0]
        
with open(txt_1,'w') as arquivo_txt:
    arquivo_txt.write(f'Ator: {nome_ator}\nNúmero de filmes: {maior_valor}.')
```

### 2) Apresente a média de faturamento bruto por ator.


```python
txt_2 = "C:\\Users\\Danie\\Documents\\Desafio ETL\\etapa-2.txt"

with open(txt_2,'w') as arquivo_txt:
    for linha in conteudo_actors[1:]:
        media_faturamento = linha[3]
        nome_ator = linha[0]
        arquivo_txt.write(f'Ator/atriz: {nome_ator}. Média de faturamento bruto: {media_faturamento}.\n')
```

### 3) Apresente o ator/atriz com a maior média de faturamento por filme.


```python
txt_3 = "C:\\Users\\Danie\\Documents\\Desafio ETL\\etapa-3.txt"
maior_media = 0

with open(txt_3,'w') as arquivo_txt:
    for linha in conteudo_actors[1:]:
        if float(linha[3]) > maior_media:
            maior_media = float(linha[3])
            nome_ator = linha[0]
    arquivo_txt.write(f'Ator: {nome_ator}. Média de faturamento por filme: {maior_media}.')
```

### 4) O nome do(s) filme(s) mais frequente(s) e sua respectiva frequência.


```python
txt_4 = "C:\\Users\\Danie\\Documents\\Desafio ETL\\etapa-4.txt"
frequencias = {}

for linha in conteudo_actors[1:]:
    if linha[4] not in frequencias:
        frequencias[linha[4]] = 1
    else:
        frequencias[linha[4]] += 1
        
maior_frequencia = max(frequencias.values())

with open(txt_4,'w') as arquivo_txt:
    for chave, valor in frequencias.items():
        if valor == maior_frequencia:
            arquivo_txt.write(f'{chave}: {valor} vezes')
```

### 5) A lista dos atores ordenada pelo faturamento bruto total, em ordem decrescente.


```python
txt_5 = "C:\\Users\\Danie\\Documents\\Desafio ETL\\etapa-5.txt"
faturamentos = {}

for linha in conteudo_actors[1:]:
    faturamentos[linha[0]] = linha[1]

faturamento_ordenado = dict(sorted(faturamentos.items(), key=lambda x: x[1], reverse=True))

with open(txt_5,'w') as arquivo_txt:
    for chave, valor in faturamento_ordenado.items():
        arquivo_txt.write(f'{chave}: {valor}\n')
```
