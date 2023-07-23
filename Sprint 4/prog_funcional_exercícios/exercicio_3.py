from functools import reduce

def calcula_saldo(lancamentos):
    # Mapeando os lançamentos, ajustando o sinal de acordo com o tipo (C ou D).
    # Se o tipo for 'C', o valor é mantido positivo. Se for 'D', o valor é negativo.
    valores_mapeados = map(
        lambda lancamento: lancamento[0] if lancamento[1] == 'C' else -lancamento[0],
        lancamentos
        )
    # Utilizando a função reduce para somar todos os valores mapeados.
    saldo_final = reduce(lambda saldo, valor: saldo + valor, valores_mapeados, 0)
    return saldo_final


lancamentos = [(200,'D'),(300,'C'),(100,'C')]
saldo = calcula_saldo(lancamentos)
print(saldo)