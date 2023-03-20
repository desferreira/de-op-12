## Links
- https://network-insight.net/2022/05/16/observability-vs-monitoring/
- https://www.youtube.com/watch?v=ACL_YVPD3gw


o objetivo principal das métricas é: fornecer um retrato atualizado do estado do ms/servidor/aplicação no momento de consulta. 

o objetivo principal do loggin é: descrever o estado do ms em qualquer momento passado recente. O logging deve ser tal qual que os desenvolvedores possam determinara patir dos logs exatamente o que deu errado e onde as coisas começaram a desmoronar. determinarexatamente o que deve ser gravado no log é específico de cada ms.

o objetivo principal dos dashboards é: oferecer uma ferramenta visual do estado/saúde do MS. Ideal também para identificar problemas adicionados após deployments.

o objetivo principal dos alertas é: garantir que os responsáveis pelo MS sejam avisados de qualquer falha no sistema. os limites devem ter 3º níveis: normal, warning e crítico. Idealmente, alertas devem ser de todas as métricas principais e que podem causar problemas aos usuários finais. 

e quando um alerta é ativado? idealmente, qualquer pessoa no turno de plantão deveria ser capaz de resolver através de um runbook contendo instruções claras de como resolver aquele problema. 

Em algumas empresas, existem equipes de SRE/DevOps que são responsáveis por toda a saúde da aplicação, mesmo que estes não sejam responsáveis pela app, trabalhei numa startup que era assim. O pessoal fazia os códigos e durante o final de semama (ou fora do horário de trabalho) se houvesse algum problema (e haviam, vários) éramos nós que deveriamos resolver e quebrar a cabeça para descobrir.. não recomendo. Porque o desenvolvedor que criou a app é a pessoa indicada para identificar o erro e resolver, não qualquer pessoa aleatória de outro time. 



- [ ] Métricas principais (cpu, eram) são monitoradas nos níveis de servidor, infraestrutura e microsserviços
- [ ] Logging adequado refletindo com precisão os estados da aplicação
- [ ] Dashboards fáceis de interpretar e contendo as métricas principais
- [ ] Alertas acionáveis e definidos por limites sinalizadores
- [ ] Turno dedicado em responder por falhas/monitoramento do microserviço
- [ ] Procedimento claro e bem definido para tratamento de incidentes e interrupções