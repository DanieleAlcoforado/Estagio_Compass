# Coleta e Preparação de Dados de Filmes do Gênero Crime

Para a análise de filmes do gênero crime, foram coletados dados por meio da API do TMDB, começando a partir do ano de 1970. Os dados iniciais estavam em formato JSON e foram posteriormente armazenados no AWS S3 para melhor organização e disponibilidade.

## Desafios Iniciais

Durante o processo, foram encontradas dificuldades com o reconhecimento do Schema dos arquivos JSON pelo AWS Glue. Para superar esse obstáculo, optei por concatenar os arquivos JSON e, em seguida, convertê-los para o formato CSV. Essa adaptação permitiu que os dados fossem usados com sucesso no ambiente do AWS Glue.

COLOCAR FOTOS

## Solução Flexível

Para algumas transformações necessárias nos dados, houveram dificuldades para rodar no job, que não consegui contornar em tempo hábil. Por isso as demais modificações que restavam foram realizadas com uso do Pandas no Google Colaboratory.

COLOCAR FOTOS DOS ERROS