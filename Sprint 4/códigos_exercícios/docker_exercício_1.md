## Exercício 1

### Construindo a imagem
```
FROM python

WORKDIR /app

COPY carguru.py /app

CMD ["python","carguru.py"]
```
### Comandos no terminal
```
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker build .
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
<none>       <none>    57a006883572   3 minutes ago   1.01GB
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker tag 57a006883572 imagem_tarefa_1
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker run imagem_tarefa_1
Você deve dirigir um Honda City
```

## Exercício 2
### Comando
```
CONTAINER ID   IMAGE             COMMAND               CREATED        STATUS                    PORTS     NAMES
f8bdade13f8c   imagem_tarefa_1   "python carguru.py"   18 hours ago   Exited (0) 18 hours ago             magical_rubin
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker logs f8bdade13f8c 
Você deve dirigir um Honda City
```
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker start f8b
f8b
PS C:\development\estagio_compass\Estagio_Compass\Sprint 4> docker logs f8b
Você deve dirigir um Honda City
Você deve dirigir um Chevrolet Onix
```