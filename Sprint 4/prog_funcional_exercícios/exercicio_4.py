# Dicionário que associa cada operador a uma função lambda para a operação correspondente.
operador_dict = {
        '+': lambda x, y: x + y,
        '-': lambda x, y: x - y,
        '*': lambda x, y: x * y,
        '/': lambda x, y: x / y,
        '%': lambda x, y: x % y,
        '**': lambda x, y: x ** y,
        '//': lambda x, y: x // y,
}

def calcular_valor_maximo(operadores,operandos) -> float:
    # Combinando os operadores com os operandos em uma lista de tuplas.
    listas_unidas = list(zip(operadores, operandos))
    # A função lambda é aplicada a cada elemento de 'listas_unidas', onde o elemento é uma tupla (operador, operando).
    # O resultado é uma lista contendo o resultado de cada operação.
    listas_unidasMap = map(lambda elemento: operador_dict[elemento[0]](*elemento[1]),listas_unidas)
    # Retorna o valor máximo da lista de resultados das operações.
    return max(list(listas_unidasMap))