# Objetivos

- Overview sobre Monitoramento e a sua Importância

- Overview sobre Ferramentas de Observabilidade

- Entendimento sobre o Grafana

- Entendimento sobre o Prometheus

- Entendimento sobre o Graylog

- Entendimento sobre Métricas e Logs

- Entendimento sobre Alertas

- Etendimento sobre Dashboards


## Divisão dos conteúdos

- Pilares da Observabilidade

- Consequências das falhas no ambiente  

- Tipos de Métricas 

- Funcionalidades, Componentes e Arquitetura 

- Uso do Prometheus e Grafana

- Instalando o Grafana e o Prometheus (Docker) 

- Trabalhando com Counters, Gauges, Summaries e Histogramas

- Criando visões do Prometheus no Grafana

- Conhecendo o Graylog

- Componentes e Arquitetura

- Uso do Graylog

- Instalação e Configuração do ElasticSearch

- Configurando captura de Logs no Graylog

- Trabalhando com Dashboards

- Trabalhando com Filtros no Graylog


## Utilizando tudo que tem nesse repo
```
iniciar o prometheus: docker run -p 9090:9090 -v $(pwd)/02/prometheus.yml:/etc/prometheus/prometheus.yml -d prom/prometheus
iniciar o grafana: docker run -d -p 3000:3000 grafana/grafana-oss
iniciar o graylog: cd 07 ; docker compose up -d

```
