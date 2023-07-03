## Exercício 1


```python
from datetime import datetime

# entrada dos valores pelo usuário
nome = input('Digite seu nome: ')
idade = input('Digite a sua idade (apenas dígitos): ')

diferenca_anos = 100 - int(idade) # diferença de anos entre 100 e a idade atual
ano_atual = datetime.now().year # acessando o ano atual
resposta = ano_atual + diferenca_anos # ano em que a pessoa completa 100 anos

print(resposta)
```

    Digite seu nome: Dani
    Digite a sua idade (apenas dígitos): 26
    2097
    

## Exercício 2


```python
# função que verifica se um número é par ou ímpar
def verificar_par_ou_impar(numero):
    if numero % 2 == 0:
        return "Par: " + str(numero)
    else:
        return "Ímpar: " + str(numero)

# função que solicita que 3 números sejam digitados, chama a função de verificação e imprime o resultado
for i in range(3):
    numero = int(input("Digite um número: "))
    resultado = verificar_par_ou_impar(numero)
    print(resultado)
```

    Digite um número: 5
    Ímpar: 5
    Digite um número: 6
    Par: 6
    Digite um número: 7
    Ímpar: 7
    

## Exercício 3


```python
for num in range(0, 21, 2):
    print(num)
```

    0
    2
    4
    6
    8
    10
    12
    14
    16
    18
    20
    

## Exercício 4


```python
def num_primo(num):
    if num < 2:  # Se o número for menor que 2, não é primo
        return False
    for i in range(2, int(num ** 0.5) + 1):  # Loop de 2 até a raiz quadrada do número (arredondado para cima)
        if num % i == 0:  # Se o número for divisível por algum número no intervalo, não é primo
            return False
    return True

for num in range(1, 101):  # Loop de 1 a 100
    if num_primo(num):  # Se o número for primo, imprime o número
        print(num)
```

    2
    3
    5
    7
    11
    13
    17
    19
    23
    29
    31
    37
    41
    43
    47
    53
    59
    61
    67
    71
    73
    79
    83
    89
    97
    

## Exercício 5


```python
dia = 22
mes = 10
ano = 2022

print(str(dia) + '/' + str(mes) + '/' + str(ano))
```

    22/10/2022
    

## Exercício 6
### Duas formas de fazer


```python
a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89] 
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]  

a_set = set(a)  # convertendo a lista 'a' em um conjunto e removendo duplicatas
b_set = set(b)  # convertendo a lista 'a' em um conjunto e removendo duplicatas

intersecao = list(a_set & b_set)  # acessando a interseção dos dois conjuntos e convertendo o resultado em lista

print(intersecao)
```

    [1, 2, 3, 5, 8, 14]
    


```python
a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
intersecao = []

# para cada número da lista 'a' que não está presente em 'b' e nem em 'intersecao', adiciona-se este número na lista 'intersecao'
for num in a:
    if num in b and num not in intersecao:
        intersecao.append(num)

print(intersecao)
```

    [1, 2, 3, 5, 8, 14]
    

## Exercício 7


```python
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
impar = []

# os elemento da lista 'a' que não forem divisíveis por 2 são adicionados na lista 'impar'
for num in a:
    if num % 2 != 0:
        impar.append(num)

print(impar)
```

    [1, 9, 25, 49, 81]
    

## Exercício 8


```python
words = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']

for word in words:
    if word == word[::-1]:
        print('A palavra {} é um palíndromo.\n'.format(word))
    else:
        print('A palavra {} não é um palíndromo.\n'.format(word))
```

    A palavra: maça não é um palíndromo.
    
    A palavra: arara é um palíndromo.
    
    A palavra: audio não é um palíndromo.
    
    A palavra: radio não é um palíndromo.
    
    A palavra: radar é um palíndromo.
    
    A palavra: moto não é um palíndromo.
    
    

## Exercício 9


```python
primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José'] 
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']  
idades = [19, 28, 25, 31] 

for indice, primeiro_nome in enumerate(primeirosNomes):
    # 'enumerate(primeirosNomes)' retorna um objeto que contém pares (índice, primeiro_nome) para cada elemento na lista 'primeirosNomes'
    sobrenome = sobreNomes[indice]  # acessa o sobrenome correspondente ao mesmo índice do primeiro nome
    idade = idades[indice]  # acessa a idade correspondente ao mesmo índice do primeiro nome
    print(f"{indice} - {primeiro_nome} {sobrenome} está com {idade} anos")
```

    0 - Joao Soares está com 19 anos
    1 - Douglas Souza está com 28 anos
    2 - Lucas Silveira está com 25 anos
    3 - José Pedreira está com 31 anos
    

## Exercício 10
### Duas formas de fazer


```python
exemplo = ['abc', 'abc', 'abc', '123', 'abc', '123', '123'] 

def sem_duplicados(lista):
    set_lista = set(lista)
    nova_lista = list(set_lista)
    print(nova_lista)
    
sem_duplicados(exemplo)
```

    ['abc', '123']
    


```python
def intersecao(lista):
    nova_lista = []
    for item in lista:
        if item not in nova_lista:
            nova_lista.append(item)
    return nova_lista

lista = ['abc', 'abc', 'abc', '123', 'abc', '123', '123']    
intersecao(lista)
```




    ['abc', '123']



## Exercício 11


```python
arquivo = 'arquivo_texto.txt'

leitura = open(arquivo,'r')

conteudo = leitura.read()

leitura.close()

print(conteudo, end="")
```

## Exercício 12


```python
import json

with open('person.json','r') as arquivo:
    conteudo = json.load(arquivo)

print(conteudo)
```

## Exercício 13


```python
def my_map(lst, f): # Função que aplica a função 'f' a cada elemento da lista 'lst'
    return [f(x) for x in lst] 

def potenciacao(x): # Função que recebe um número 'x' e retorna o valor de 'x' elevado ao quadrado
    return x ** 2  


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultado = my_map(lista, potenciacao)
# aplicando a função 'my_map' à lista 'lista' usando a função 'potenciacao' como argumento

print(resultado)
```

    [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
    

## Exercício 14


```python
def imprimir_parametros(*args, **kwargs): # Função que recebe um número variável de parâmetros não nomeados (*args) e nomeados (**kwargs)
    for arg in args: # Loop que itera sobre os parâmetros não nomeados e imprime cada um
        print(arg)

    for key, value in kwargs.items(): # Loop que itera sobre os parâmetros nomeados e imprime cada um
        print(f"{value}")

imprimir_parametros(1, 3, 4, 'hello', parametro_nomeado='alguma coisa', x=20)
# Chamada da função
```

    1
    3
    4
    hello
    parametro_nomeado: alguma coisa
    x: 20
    

## Exercício 15


```python
class Lampada:
    def __init__(self, ligada=False):
        # Método especial que é executado quando uma nova instância da classe é criada
        # Recebe o parâmetro 'ligada' que por padrão é False
        # Cria um atributo de instância 'ligada' e atribui o valor recebido como argumento
        self.ligada = ligada
    
    def liga(self): # Método que liga a lâmpada
        self.ligada = True
    
    def desliga(self): # Método que desliga a lâmpada
        self.ligada = False
    
    def esta_ligada(self): # Método que verifica se a lâmpada está ligada ou desligada
        return self.ligada

# Criando uma nova instância da classe Lampada e aplicando os métodos
lamp1 = Lampada()
lamp1.liga() 
print(lamp1.esta_ligada()) 
lamp1.desliga() 
print(lamp1.esta_ligada())
```

    True
    False
    

## Exercício 16


```python
def soma_valores(string):
    numeros = string.split(',') # separa os elementos da string
    calculo = sum(int(num) for num in numeros) # converte os elementos para inteiros e realiza o somatório de todos eles
    return calculo

string1 = "1,3,4,6,10,76"
resultado = soma_valores(string1)
print(resultado)
```

    100
    

## Exercício 17


```python
def dividir_lista(lista): # Função que recebe uma lista e a divide em três partes iguais
    num_elementos = len(lista) # Obtém o número de elementos na lista
    tamanho_parte = num_elementos // 3 # Calcula o tamanho aproximado de cada parte
    partes = [lista[i:i + tamanho_parte] for i in range(0, num_elementos, tamanho_parte)] # Divide a lista em partes e cria sublistas contendo os elementos correspondentes a cada parte
    return partes # Retorna a lista de partes

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
partes_divididas = dividir_lista(lista)

for parte in range(len(partes_divididas)): # Loop que itera sobre as partes divididas
    end = " "
    if(parte == len(partes_divididas) - 1): # Verificando se é a última parte para alterar o caractere de final de linha
        end = "\n" 
    print(partes_divididas[parte], end=end) # Imprime cada parte
```

    [1, 2, 3, 4] [5, 6, 7, 8] [9, 10, 11, 12]
    

## Exercício 18


```python
speed = {'jan': 47, 'feb': 52, 'march': 47, 'April': 44, 'May': 52, 'June': 53, 'july': 54, 'Aug': 44, 'Sept': 54}

valores = list(set(speed.values()))
# acessando os valores do dicionário, convertendo em um set e em seguida em lista
# os valores duplicados são removidos quando convertido em set

print(valores)
```

## Exercício 19


```python
import random
import statistics

random_list = random.sample(range(500), 50)
# Cria uma lista com 50 números inteiros únicos selecionados aleatoriamente no intervalo de 0 a 499

sorted_list = sorted(random_list)
# Ordena a lista aleatória em ordem crescente

soma = sum(sorted_list)
media = soma / len(sorted_list)
# Calcula a média dos elementos da lista 

mediana = statistics.median(sorted_list)
# Calcula a mediana dos elementos da lista ordenada

valor_minimo = min(sorted_list)
# Encontra o valor mínimo na lista 

valor_maximo = max(sorted_list)
# Encontra o valor máximo na lista 

print('Media: {}, Mediana: {}, Mínimo: {}, Máximo: {}'.format(media, mediana, valor_minimo, valor_maximo))
```

    Media: 250.48, Mediana: 240.0, Mínimo: 23, Máximo: 487
    

## Exercício 20


```python
a = [1, 0, 2, 3, 5, 8, 13, 21, 34, 55, 89]

print(a[::-1])
```

    [89, 55, 34, 21, 13, 8, 5, 3, 2, 0, 1]
    
