## Comandos
```
docker run -d -p 3000:3000 grafana/grafana-oss
```
admin / admin


# Adicionar datasource

URL do prometheus: host.docker.internal:8080

## Métricas para gráficos

- node_cpu_seconds_total => tempo de cpu
- node_filesystem_avail_bytes => espaço em disco
- node_memory_total_bytes => memoria total
- process_cpu_usage => uso de CPU
- jvm_memory_used_bytes => memória total do usada
- jvm_memory_max_bytes => memória total disponível