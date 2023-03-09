## Links interessantes

- https://prometheus.io/docs/instrumenting/exporters/
- https://www.devopsschool.com/blog/what-is-prometheus-and-how-it-works/
- https://www.tigera.io/learn/guides/prometheus-monitoring/
- https://www.youtube.com/watch?v=NqUWL_0rQ5Y
- https://www.tutorialworks.com/spring-boot-prometheus-micrometer/
- https://betterprogramming.pub/how-to-monitor-a-spring-boot-app-with-prometheus-and-grafana-22e2338f97fc
- https://network-insight.net/2022/06/29/prometheus-monitoring-the-pull-approach/


### Alternatives

- InfluxDB with Kapacitor
- Nagios Core
- Sensu
- ContainIQ
- Datadog
- Last9


## Running
```
docker run -p 9090:9090 -v $(pwd)/02/prometheus.yml:/etc/prometheus/prometheus.yml -v $(pwd)/02/data:/prometheus prom/prometheus
docker run -p 9090:9090 -v $(pwd)/02/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```
