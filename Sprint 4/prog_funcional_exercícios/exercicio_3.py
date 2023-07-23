from functools import reduce

def calcula_saldo(lancamentos):
    valores_mapeados = map(
        lambda lancamento: lancamento[0] if lancamento[1] == 'C' else -lancamento[0],
        lancamentos
        )
    saldo_final = reduce(lambda saldo, valor: saldo + valor, valores_mapeados, 0)
    return saldo_final

saldo = calcula_saldo([
    (200,'D'),
    (300,'C'),
    (100,'C')
])

print(saldo)