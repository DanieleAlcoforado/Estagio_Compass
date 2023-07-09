## Exercício 21


```python
class Passaro:
    def voar(self):
        print("Voando...")
    
    def emitir_som(self):
        print("Passaro emitindo som...")
        

class Pato(Passaro):
    def emitir_som(self):
        super().emitir_som()  # chamando o método emitir_som() da classe Passaro
        print("Quack Quack")  # imprimindo o som específico do pato


class Pardal(Passaro):
    def emitir_som(self):
        super().emitir_som()  # chamando o método emitir_som() da classe Passaro
        print("Piu Piu")  # imprimindo o som específico do pardal


# Testando as classes
pato = Pato()
print("Pato")
pato.voar()
pato.emitir_som()

print()

pardal = Pardal()
print("Pardal")
pardal.voar()
pardal.emitir_som()
```

    Pato
    Voando...
    Passaro emitindo som...
    Quack Quack
    
    Pardal
    Voando...
    Passaro emitindo som...
    Piu Piu
    

## Exercício 22


```python
class Pessoa:
    def __init__(self, id): # construtor da classe Pessoa
        self.id = id
        self.__nome = None 

    def nome(self, nome): # método que define o atributo 'nome'
        self.__nome = nome  

    def nome(self): # método que acessa o atributo 'nome'
        return self.__nome 

# Testando
pessoa = Pessoa(0)
pessoa.nome = 'Fulano De Tal'
print(pessoa.nome)
```

    Fulano De Tal
    

## Exercício 23


```python
class Calculo:
    def soma(self,x,y): # método que realiza a soma de dois valores
        resultado = x + y
        return resultado
    
    def subtracao(self,x,y): # método que realiza a subtração de dois valores
        resultado_subt = x - y
        return resultado_subt

calculo = Calculo() # instanciando o objeto 'calculo' e seus parâmetros
x = 4
y = 5

# fazendo a chamada dos métodos para o objeto 'calculo'
resultado_soma = calculo.soma(x,y)
resultado_subtracao = calculo.subtracao(x,y)

print(f'Somando: {x} + {y} = {resultado_soma}')
print(f'Subtraindo: {x} - {y} = {resultado_subtracao}')
```

    Somando: 4 + 5 = 9
    Subtraindo: 4 - 5 = -1
    

## Exercício 24


```python
class Ordenadora:
    def __init__(self,listaBaguncada):
        self.listaBaguncada = listaBaguncada
        
    def ordenacaoCrescente(self): # método que retorna a lista ordenada de forma crescente
        return sorted(self.listaBaguncada)
        
    def ordenacaoDecrescente(self): # método que retorna a lista ordenada de forma decrescente
        return sorted(self.listaBaguncada, reverse=True)
        
# instanciando objetos da classe 'Ordenadora'        
crescente = Ordenadora([3,4,2,1,5]) 
decrescente = Ordenadora([9,7,6,8])

# imprimindo as listas ordenadas
print(crescente.ordenacaoCrescente())
print(decrescente.ordenacaoDecrescente())
```

    [1, 2, 3, 4, 5]
    [9, 8, 7, 6]
    

## Exercício 25


```python
class Aviao:
    def __init__(self,modelo,velocidade_maxima,capacidade,cor='Azul'): # construtor da classe Aviao
        self.modelo = modelo
        self.velocidade_maxima = velocidade_maxima
        self.cor = cor
        self.capacidade = capacidade
    
    def imprimir_aviao(self): # método que imprime os atributos da classe 'Aviao'
        print('O avião de modelo {} possui uma velocidade máxima de {}, capacidade para {} passageiros e é da cor {}.'.format(self.modelo, self.velocidade_maxima,self.capacidade,self.cor))

# lista que armazena 3 aviões da classe 'Aviao'
lista_avioes = [Aviao('BOIENG456','1500 km/h','400'),Aviao('Embraer Praetor 600','863km/h','14'),Aviao('Antonov An-2','258 Km/h','12')]

# iterando sobre cada avião da lista para imprimir seus atributos
for aviao in lista_avioes:
    aviao.imprimir_aviao()
```

    O avião de modelo BOIENG456 possui uma velocidade máxima de 1500 km/h, capacidade para 400 passageiros e é da cor Azul.
    O avião de modelo Embraer Praetor 600 possui uma velocidade máxima de 863km/h, capacidade para 14 passageiros e é da cor Azul.
    O avião de modelo Antonov An-2 possui uma velocidade máxima de 258 Km/h, capacidade para 12 passageiros e é da cor Azul.
    
