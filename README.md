# Laboratório de Experimentação de Software 5

## Integrantes
* Gustavo Barbosa
* Gabriel Silva


### Pré-requisitos

Antes de executar o experimento, certifique-se de ter instalado em sua máquina:

- **Docker**  
- **Docker Compose**  
- **Git Bash** no Windows (ou WSL2) — necessário para rodar os scripts `.sh`
- Porta **4000** livre no computador

---

###  Passo a Passo de Execução do Experimento

```sh
cd server
npm install
``` 

#### Subir o servidor REST + GraphQL com Docker

Abra o terminal na pasta raiz do projeto e execute:

```sh
docker-compose up -d
```
Rodar o Warm-up

Evita que as primeiras requisições distorçam os resultados

```sh
scripts\warmup.bat
```

Coletar as amostras do experimento

Esse script realizará 30 execuções REST e 30 execuções GraphQL:

```sh
scripts\collect_sample.bat
```

Desligar o ambiente Docker

```sh
docker-compose down
```