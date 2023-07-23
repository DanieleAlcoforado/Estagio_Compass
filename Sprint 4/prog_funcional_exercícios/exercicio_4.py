operator_dict = {
        '+': lambda x, y: x + y,
        '-': lambda x, y: x - y,
        '*': lambda x, y: x * y,
        '/': lambda x, y: x / y,
        '%': lambda x, y: x % y,
        '**': lambda x, y: x ** y,
        '//': lambda x, y: x // y,
}

def calcular_valor_maximo(operadores,operandos) -> float:
    juntos = list(zip(operadores, operandos))
    print(juntos[0])
    juntosMap = map(lambda elemento: operator_dict[elemento[0]](*elemento[1]),  juntos)
    print(max(list(juntosMap)))

operadores = ['+','-','*','/','+']
operandos  = [(3,6), (-7,4.9), (8,-8), (10,2), (8,4)]

calcular_valor_maximo(operadores, operandos)