## Links Interessantes
- https://network-insight.net/2022/05/16/observability-vs-monitoring/
- https://www.youtube.com/watch?v=ACL_YVPD3gw
- https://dev.to/caioflavio/melhorando-a-observabilidade-boas-praticas-na-escrita-de-logs-1f5a

## Métricas

O objetivo principal das métricas é: fornecer um retrato atualizado do estado do ms/servidor/aplicação no momento de consulta. 

## Logging

O objetivo principal do logging é: descrever o estado do ms em qualquer momento passado recente. O logging deve ser tal qual que os desenvolvedores possam determinara patir dos logs exatamente o que deu errado e onde as coisas começaram a desmoronar. determinarexatamente o que deve ser gravado no log é específico de cada ms.

## Dashboards

O objetivo principal dos dashboards é: oferecer uma ferramenta visual do estado/saúde do MS. Ideal também para identificar problemas adicionados após deployments.

## Alertas

O objetivo principal dos alertas é: garantir que os responsáveis pelo MS sejam avisados de qualquer falha no sistema. os limites devem ter 3º níveis: normal, warning e crítico. Idealmente, alertas devem ser de todas as métricas principais e que podem causar problemas aos usuários finais. 

## E quando um alerta é ativado? 
Idealmente, qualquer pessoa no turno de plantão deveria ser capaz de resolver através de um runbook contendo instruções claras de como resolver aquele problema. Afinal, se o problema existe, qualquer pessoal do time deveria ser capaz de resolver aquele problema.
