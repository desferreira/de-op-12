```
docker run -p 9093:9093 -v $(pwd)/05/config/alertmanager.yml:/config/alertmanager.yml prom/alertmanager

docker run -p 9090:9090 -v $(pwd)/02/prometheus.yml:/etc/prometheus/prometheus.yml -v $(pwd)/05/alert.rules.yml:/etc/prometheus/alert.rules.yml prom/prometheus
```
