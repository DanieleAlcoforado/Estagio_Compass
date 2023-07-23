vogais = ['a','e','i','o','u']

def conta_vogais(texto:str)-> int:
    # Usando map para verificar se um caractere é vogal
    texto_minusculo = map(str.lower,texto)
    # Filtrando somente os caracteres da string que são vogais
    vogais_texto = filter(lambda letra: letra in vogais, texto_minusculo)
    # Contando o número de vogais filtradas
    contagem = len(list(vogais_texto))
    return contagem
            