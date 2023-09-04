import os
import datetime
import boto3

# Get the current date
def format_date():
    current_date = datetime.date.today()
    return str(current_date).replace('-', '\\')

# função que autentica com as credenciais da AWS
def s3_authenticate():
    aws_access_key_id = os.getenv('AWS_ACCESS_KEY_ID')
    aws_secret_access_key = os.getenv('AWS_SECRET_ACCESS_KEY')
    aws_region = os.getenv('AWS_REGION')
    # inicializando o cliente S3
    return boto3.client('s3',
        aws_access_key_id = aws_access_key_id,
        aws_secret_access_key = aws_secret_access_key,
        region_name = aws_region)
    
# função para listar arquivos csv no diretório local
def list_csv_files(directory):
  csv_files = []
  for root, dirs, files in os.walk(directory):
    for file in files:
      if file.endswith('csv'):
        csv_files.append(os.path.join(root, file))
  return csv_files    

# função que chama a função de carregar cada arquivo csv
def format_s3_path(csv_file):
    data_type = ''
    if 'movie' in csv_file:
        data_type = 'Movies'
    elif 'series' in csv_file:
        data_type = 'Series'
    return f'Raw/Local/CSV/{data_type}/{format_date()}/{os.path.basename(csv_file)}'

# função para carregar arquivos csv no S3
def upload_local_to_s3(s3, local_file, bucket, s3_key):
  s3.upload_file(local_file, bucket, s3_key)
  print(f'Arquivo enviando com sucesso para o S3 em {s3_key}.')

# diretório local com os arquivos csv
directory = r"/app/"
bucket = 'data-lake-daniele'

# autenticando com as credenciais da AWS
s3 = s3_authenticate()

# listando os arquivos csv 
csv_files = list_csv_files(directory)

for csv_file in csv_files:
    s3_path = format_s3_path(csv_file)
    upload_local_to_s3(s3, csv_file, bucket, s3_path)
    
    

    

    

    
