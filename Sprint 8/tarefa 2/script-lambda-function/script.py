import os
import datetime
import boto3
import requests
import json

# Instanciando o cliente S3 da AWS
s3 = boto3.client('s3')   
# Instanciando o bucket de destino dos arquivos no S3    
bucket = 'data-lake-daniele'
# Instanciando os parâmetros de consulta no TMDB
api_key = os.getenv('API_KEY')
base_url = "https://api.themoviedb.org/3/discover/movie"
params = {
    "api_key": api_key,
    "include_adult": True,
    "language": "en-US",
    "sort_by": "primary_release_date.asc",
    "with_genres": "80",
}

# Função de extração dos dados do TMDB
def extract_tmdb_data():
    # lista de anos para iterar
    years = list(range(1970, 2024))
    # lista que armazenará os resultados de todas as páginas
    all_results = []

    # loop de extração para cada ano
    for year in years:
        page = 1
        total_pages = 1
        while page <= total_pages:
            # adicionando o número da página e o ano aos parâmetros de consulta
            params['page'] = page
            params['primary_release_year'] = year

            try:
                # fazendo solicitação à API
                response = requests.get(base_url, params=params)
                response.raise_for_status()  # verificando se houve um erro na solicitação HTTP
                data = response.json() # obtendo os dados de cada página

                # verificando se a chave 'results' está presente
                if 'results' not in data:
                    print('A chave "results" não está presente na resposta da API.')
                    break

                # adicionando os resultados da página atual à lista de resultados
                all_results.extend(data["results"])

                # incrementando o número da página
                page += 1
                # atualizando o total de páginas para a página atual
                total_pages = data.get('total_pages', 0)

                print(f'Página {page-1}/{total_pages} do ano {year}')

            except requests.exceptions.RequestException as e:
                print(f"Erro na solicitação HTTP: {str(e)}")

    return all_results
    
# Função que acessa a data do dia
def format_date():
    current_date = datetime.date.today()
    return str(current_date).replace('-', '/')

# Função para gerar arquivos JSON e enviá-los ao S3        
def generate_and_upload_json(all_movies,bucket):
    temp_folder = '/tmp/json_files'
    os.makedirs(temp_folder, exist_ok=True)
    
    # dividindo a lista em partes de 100 registros cada
    for i in range(0, len(all_movies),100):
        sliced_movies = all_movies[i:i + 100]
        
    # gerando arquivos JSON para cada parte de 100 registros
    for i, slice_data in enumerate(sliced_movies):
        name_json = f"crime-1970-to-2023-{i + 1}.json" # definindo o nome do JSON
        file_path = os.path.join(temp_folder, name_json)
        with open(file_path, 'w') as json_file:
            json.dump(slice_data, json_file)

        # especificando o caminho no S3
        s3_path = f'Raw/TMDB/JSON/{format_date()}/{name_json}'
        # enviando o arquivo JSON para o S3
        s3.upload_file(file_path, bucket, s3_path)

    print(f'Arquivos enviados com sucesso para o S3.')


def lambda_handler(event, context):
    try:
        # executando a extração dos dados do TMDB
        tmdb_data = extract_tmdb_data()
        
        # gerando e fazendo upload dos arquivos JSON no S3
        generate_and_upload_json(tmdb_data,bucket)
        
        return {
            'statusCode': 200,
            'body': json.dumps('Dados enviados com sucesso ao S3!')
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f'Erro: {str(e)}')
        }
        
# Chamada da função principal
if __name__ == '__main__':
    lambda_handler(None,None)
