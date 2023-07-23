import csv

def processar_aluno(aluno):
    notas_int = [int(nota) for nota in aluno[1:]]
    
    dict_aluno = {}
    dict_aluno['Nome'] = aluno[0]
    
    notas_ordenadas = sorted(notas_int, reverse=True)[:3]
    dict_aluno['Notas'] = notas_ordenadas
    
    media = sum(notas_ordenadas) / 3
    dict_aluno['Media'] = round(media,2)
    
    return dict_aluno
    
alunos = []
with open('C:\development\estagio_compass\Estagio_Compass\Sprint 4\prog_funcional_exercícios\estudantes.csv','r') as arquivo:
    csv_data = csv.reader(arquivo)
    for linha in csv_data:
        alunos.append(linha)

nomes_ordenados = sorted(alunos, key=lambda aluno: aluno[0])
alunos_mapped = map(processar_aluno, nomes_ordenados)

for aluno_dict in alunos_mapped:
    print('Nome: {} Notas: {} Media: {}'.format(aluno_dict['Nome'],aluno_dict['Notas'],aluno_dict['Media'])) 
