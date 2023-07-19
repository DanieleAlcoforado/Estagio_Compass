import hashlib

def gerar_hash(entrada):
    my_hash = hashlib.sha1(entrada.encode('utf-8')).hexdigest()
    return my_hash

while True:
  entrada = input('Digite uma string (ou "sair" para encerrar): ')
  if entrada == 'sair':
    break
  else:
    hash_resultado = gerar_hash(entrada)
    print("Hash SHA-1 da string:", hash_resultado)