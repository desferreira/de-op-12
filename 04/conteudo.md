## Comandos
```
docker run -d -p 3000:3000 grafana/grafana-oss
```
admin / admin


# Adicionar datasource

URL do prometheus: 172.17.0.1:8080

## Métricas para gráficos

Estudo de caso 01:
- memoria
- cpu
- disco
- qtd de pedidos por hora
- qtd de erros na rota
- disponibilidade, timeout, latência


Estudo de caso 02:
- volume de requisições por endpoint - prometheus_http_requests_total
- rate(volume de requisções por endpoint) - rate(prometheus_http_requests_total[1m])


### Sistema

#### Disco
- node_disk_written_bytes_total => número de bytes escritos
- disk_free_bytes => espaço livre em disco
- disk_total_bytes => espaço total em disco

#### Memória
- node_memory_MemTotal_bytes => memória total
- node_memory_MemAvailable_bytes => memória available

#### CPU
- node_cpu_seconds_total => segundos de CPU total
- (sum(node_cpu_seconds_total{mode="idle"})/sum(node_cpu_seconds_total))*100 segundos de CPU em IDLE comparado ao total


### Aplicação

#### Memória
- jvm_memory_used_bytes => memória utilizada pela jvm
- jvm_memory_used_bytes{area="heap"} => memória utilizada só pelo programa
- (sum(jvm_memory_used_bytes{area="heap"})/sum(jvm_memory_used_bytes))*100 => percentual utilizado pelo heap em relação ao total


#### Classes
- jvm_classes_loaded_classes => total de classes "loaded" na memória
-

#### Requisições
- http_server_requests_seconds_count => total de requests
- http_server_requests_active_seconds_max => tempo máximo "gasto" em uma requisição http
- http_server_requests_seconds_max => tempo máximo gasto em cada endpoint
