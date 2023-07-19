## Script em Python 
```python
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
```
## Criando a imagem
```dockerfile
FROM python

WORKDIR /app

COPY script.py /app

CMD [ "python","script.py"]
```
## Comandos no Terminal
```powershell
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4\docker_exercício_3> docker build -t mascarar-dados .
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4\docker_exercício_3> docker run -it mascarar-dados
Digite uma string (ou "sair" para encerrar): estagio
Hash SHA-1 da string: 4c9c87ecce93113233ea1f4c73613caeb6ec940b
Digite uma string (ou "sair" para encerrar): compass
Hash SHA-1 da string: 9d0f85fe3fbd242b08852f16240c6034dbc6f73d
Digite uma string (ou "sair" para encerrar): dados
Hash SHA-1 da string: d0e380c06bbfb0e8dfb3f13347b51a59d8a2e388
Digite uma string (ou "sair" para encerrar): sair
```