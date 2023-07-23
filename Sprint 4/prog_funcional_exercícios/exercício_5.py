import csv

def processar_aluno(aluno):
    # Convertendo cada nota do aluno em número inteiro, a partir de sua posição(índice)
    notas_int = [int(nota) for nota in aluno[1:]]
    # Criando um dicionário para cada aluno
    dict_aluno = {}
    # Adicionando no dicionário o nome de cada um
    dict_aluno['Nome'] = aluno[0]
    # Ordenando as notas em ordem decrescente e selecionando apenas as 3 maiores 
    notas_ordenadas = sorted(notas_int, reverse=True)[:3]
    # Adicionando as 3 maiores notas no dicionário
    dict_aluno['Notas'] = notas_ordenadas
    # Calculando a média das 3 maiores notas e adicionando-a no dicionário
    media = sum(notas_ordenadas) / 3
    dict_aluno['Media'] = round(media,2)
    return dict_aluno
    
# Lendo o arquivo CSV e adicionando os dados na lista 'alunos'    
alunos = []
with open('C:\development\estagio_compass\Estagio_Compass\Sprint 4\prog_funcional_exercícios\estudantes.csv','r') as arquivo:
    csv_data = csv.reader(arquivo)
    for linha in csv_data:
        alunos.append(linha)

# Ordenando os alunos em ordem alfabética, a partir do índice dos nomes 
nomes_ordenados = sorted(alunos, key=lambda aluno: aluno[0])
# Aplicando a função 'processar_aluno' para cada aluno
alunos_mapped = map(processar_aluno, nomes_ordenados)

# Imprimindo o relatório de cada aluno
for aluno_dict in alunos_mapped:
    print('Nome: {} Notas: {} Media: {}'.format(aluno_dict['Nome'],aluno_dict['Notas'],aluno_dict['Media'])) 
