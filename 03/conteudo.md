## Links interessantes

- https://prometheus.io/docs/concepts/metric_types/
- https://prometheus.io/docs/practices/histograms/
- https://medium.com/mercari-engineering/have-you-been-using-histogram-metrics-correctly-730c9547a7a9
- https://prometheus.io/docs/prometheus/latest/querying/basics/
- https://logz.io/blog/promql-examples-introduction/
- https://www.containiq.com/post/promql-cheat-sheet-with-examples
- https://www.alibabacloud.com/blog/pull-or-push-how-to-select-monitoring-systems_599007

## Links com métricas

- http://localhost:9090/metrics => mostra as métricas do prometheus
- http://localhost:8080/actuator/prometheus => métricas aplicacionais
- http://localhost:9100/metrics => métricas do node exporter

- Arquivo de configuração: prometheus.yaml



### Tipos de dados

- gauge
- histogram
- summary
- counter

### Tipos de "valores" 
- Floats (mostly scalars) => valor cru da métrica
- Range vectors => valor de uma métrica em um determinado período de tempo
- Instant vectors => valor de uma métrica ao longo do tempo
### Pesquisas

#### Teoria / Sintaxes
- nome_da_metrica{label1="valor1",label2="valor2"}[filtro_de_tempo] 
- access_log{job!=”apache2”} => pesquisa de diferença
- http_total_requests{job=”prometheus”,method!=”GET”} => pesquisa de match exato
- http_total_requests{job=!~".prom*"} => pesquisa de diferença com regex
- http_total_requests{job=~".prom*",environment=~”} => pesquisa de math com regex

#### Prática
- prometheus_http_requests_total{status!~"4.."} => todos os request que não sejam da linha dos 400
- prometheus_http_requests_total{job=~".*server"} => todos os request que são o job termina com .server
- prometheus_http_requests_total{code=~"2.*|4.*"} => todos os requsts com status code 200 ou 400

#### Operadores
- "+" => soma
- "–" => subtração
- "*" => multiplicação
- "/" => divisão
- "%" => porcentagem
- "^" => expoente

### Funções
- month(): retorna o mês
- day_of_month(): retorna o dia do mês
- rate():  function in PromQL takes the history of metrics over a time frame and calculates how fast value is increasing per second. Rate is applicable on counter values only. 
- sum(): soma de valores
- avg_over_time(): semelhante ao rate, mas funciona com "gauges" também.

## Prometheus
- prometheus_http_request_duration_seconds_sum: é um instant vector
- prometheus_http_request_duration_seconds_sum[1m]: é um range vector
- rate(prometheus_http_request_duration_seconds_sum[1m]) / rate(prometheus_http_request_duration_seconds_count[1m]) => taxa de tempo total gasto nos endpoints e o total de requests
## PC
- node_disk_write_errors_total => número de rros de escrita em disco
- node_cpu_seconds_total => tempo de cpu
- node_filesystem_avail_bytes => espaço em disco
- node_filesystem_avail_bytes{device="/dev/disk3s5"} => espaço em disco no mac
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
