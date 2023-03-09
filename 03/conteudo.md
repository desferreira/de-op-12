## Links interessantes

- http://localhost:9090/metrics => mostra as métricas do prometheus
- http://localhost:8080/actuator/prometheus => métricas aplicacionais

- Arquivo de configuração: prometheus.yaml



### Tipos de dados

- gauge
- histogram
- summary
- counter

### Funções
- rate():  function in PromQL takes the history of metrics over a time frame and calculates how fast value is increasing per second. Rate is applicable on counter values only.
- sum(): soma de valores


## PC
- node_disk_write_errors_total => número de rros de escrita em disco
- node_cpu_seconds_total => tempo de cpu
- node_filesystem_avail_bytes => espaço em disco
- node_memory_total_bytes => memoria total
- node_memory_swap_total_bytes => memoria em swap
- node_memory_free_bytes => memória livre

## Java
### Métricas interessantes de rede
- http_server_requests_seconds_count => número de requests 
- http_server_requests_seconds_sum => tempo total gasto nos requests 
- rate(http_server_requests_seconds_count[5m]) => taxa de crescimento nos últimos 5 min.
- rate( http_server_requests_seconds_sum[1m]) / rate(http_server_requests_seconds_count[1m]) => taxa de tempo total gasto no endpoint e o total de requets
- http_server_requests_seconds_max => tempo máximo de duração de um requets


### Métricas interessantes de memória
- process_cpu_usage => uso de CPU
- jvm_memory_used_bytes => memória total do usada
- jvm_memory_max_bytes => memória total disponível
- sum(jvm_memory_used_bytes{area="heap"}) => memória total do heap
- sum(jvm_memory_max_bytes{area="heap"}) => memória total disponível para o heap
- sum(jvm_memory_used_bytes{area="heap"}) / sum(jvm_memory_max_bytes{area="heap"})

- jvm_gc_pause_seconds_sum => tempo total "em pausa" para o garbage collector
- jvm_gc_pause_seconds_count => total de pausas por causa do garbage collector

- jvm_gc_pause_seconds_max => tempo máximo parado para gc

- jvm_threads_states_threads => quantidade de threads da jvm

## Running
```
docker run -p 9090:9090 -v $(pwd)/02/prometheus.yml:/etc/prometheus/prometheus.yml -v $(pwd)/02/data:/prometheus prom/prometheus
```
