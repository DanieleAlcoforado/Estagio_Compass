def selecionar_maiores_pares(lista):
    lista_nova = map(int,lista)
    pares = filter(lambda numero: numero % 2 == 0, lista_nova)
    maiores_pares = sorted(pares,reverse=True)[:5]
    somatorio = sum(maiores_pares)
    print(maiores_pares)
    print(somatorio)

numeros = []

with open('number.txt','r') as arquivo:
    for linha in arquivo.readlines():
        numeros.append(linha)
    
selecionar_maiores_pares(numeros)