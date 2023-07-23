def selecionar_maiores_pares(lista):
    # Convertendo cada elemento da lista para valor inteiro 
    lista_nova = map(int,lista)
    # Filtrando os números pares
    pares = filter(lambda numero: numero % 2 == 0, lista_nova)
    # Ordenando os pares em ordem decrescente e selecionando os 5 maiores
    maiores_pares = sorted(pares,reverse=True)[:5]
    # Calculando a soma dos 5 maiores pares
    somatorio = sum(maiores_pares)
    # Imprimindo os resultados 
    print(maiores_pares)
    print(somatorio)

# Executando a leitura do arquivo 'number.txt'
numeros = []
with open('number.txt','r') as arquivo:
    for linha in arquivo.readlines():
        numeros.append(linha)
           
# Executando a função para a lista 'numeros'
selecionar_maiores_pares(numeros)