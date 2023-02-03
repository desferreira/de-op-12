## Links interessantes

- https://prometheus.io/docs/instrumenting/exporters/
- https://www.devopsschool.com/blog/what-is-prometheus-and-how-it-works/
- https://www.tigera.io/learn/guides/prometheus-monitoring/
- https://www.youtube.com/watch?v=NqUWL_0rQ5Y
- https://www.tutorialworks.com/spring-boot-prometheus-micrometer/


### Alternatives

- InfluxDB with Kapacitor
- Nagios Core
- Sensu
- ContainIQ
- Datadog
- Last9


## Running
docker run -p 9090:9090 -v /Users/ferreirad/Documents/Jobs/TI/Ada/Aulas/DE-OP-012-Observability/02/prometheus.yml:/etc/prometheus/prometheus.yml -v /Users/ferreirad/Documents/Jobs/TI/Ada/Aulas/DE-OP-012-Observability/02/data:/prometheus prom/prometheus