## Links interessantes

- http://localhost:9090/metrics => mostra as métricas do prometheus
- http://localhost:8080/actuator/prometheus => métricas aplicacionais


### Tipos de dados

- gauge
- histogram
- summary
- counter


## Running
```
docker run -p 9090:9090 -v /Users/ferreirad/Documents/Jobs/TI/Ada/Aulas/DE-OP-012-Observability/02/prometheus.yml:/etc/prometheus/prometheus.yml -v /Users/ferreirad/Documents/Jobs/TI/Ada/Aulas/DE-OP-012-Observability/02/data:/prometheus prom/prometheus
```
