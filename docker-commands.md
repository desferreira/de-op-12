Links interessantes:
- [Podman](https://podman.io/)
- [Docker](https://www.docker.com/)
- [Containerd](https://containerd.io/)
- [Container runtime detalhes](https://www.techtarget.com/searchitoperations/tip/A-breakdown-of-container-runtimes-for-Kubernetes-and-Docker)
- [DockerHub](https://hub.docker.com/)
- [Amazon ECR](https://aws.amazon.com/ecr/)

# Usando o Docker para criar e executar containers

Lembrando que o Docker é uma das ferramentas capazes de executar containers, o Docker oferece uma CLI para interagir com os containers.

## Como instalar o Docker?

Basta ir ao [site oficial do docker](https://docs.docker.com/get-docker/) e instalar para o seu SO. 

## Criando o meu primeiro container

Para criar o seu primeiro container, a forma mais fácil é utilizando o comando do docker `docker run`, por ex: para criar um Ubuntu: `docker run -it ubuntu`

### Lista de comandos úteis para containers:
flags interessantes:
- t: ligação ao terminal do container
- i: abre em modo interativo
- d: executa em background
- e: passa uma variável de ambiente
```
docker container ls run -it ubuntu | docker run -it ubuntu
docker container exec -it [CONTAINER_ID][MEU_COMANDO]
docker container ls | docker ps
docker logs [CONTAINER_ID]
docker images 
docker container stop [CONTAINER_ID]
docker container rm [CONTAINER_ID]
docker rmi [IMAGE_ID]
```

### Outros comandos mais avançados do docker
```
Mapeando portas: docker run -it -p 8085:8080 nginx, posso usar o -d para executar em background
Mapeando volumes: docker run -it -v "$(pwd)":/test ubuntu, assim é possível fazer alterações diretamente no PC, em vez de no container
Limitando o uso de recursos: docker run -it -m 400mb --cpus 1 ubuntu

docker run -itd -e POSTGRES_USER=letscode -e POSTGRES_PASSWORD=123456 -p 5432:5432 -v /data:/var/lib/postgresql/data --name postgresql postgres
```

### Criando um container personalizado
```
docker build .
docker build -t [MINHA_TAG]
```

### Executando mais de um container ao mesmo tempo
O `docker compose` é uma ferramenta do docker que possibilita a execução de um "conjunto" de containers, eles podem trabalhar em conjunto ou de forma unitária. 

```
docker compose up [SERVICE]
docker compose down [SERVICE]
```