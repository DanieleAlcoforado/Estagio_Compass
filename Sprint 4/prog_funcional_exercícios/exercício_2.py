vogais = ['a','e','i','o','u']

def conta_vogais(texto:str)-> int:
    texto_novo = map(str.lower,texto)
    vogais_texto = filter(lambda letra: letra in vogais, texto_novo)
    contagem = len(list(vogais_texto))
    return contagem
            