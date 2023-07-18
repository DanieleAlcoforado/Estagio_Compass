## Construindo a imagem
```
FROM python

WORKDIR /app

COPY carguru.py /app

CMD ["python","carguru.py"]
```
## Comandos no terminal

```
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker build .
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
<none>       <none>    57a006883572   3 minutes ago   1.01GB
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker tag 57a006883572 imagem_tarefa_1
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker run imagem_tarefa_1
Você deve dirigir um Honda City
```