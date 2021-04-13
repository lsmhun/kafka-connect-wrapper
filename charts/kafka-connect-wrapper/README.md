Kafka Connect Wrapper
=====================
**WARNING**: Do NOT use it!!! This chart is created for DEMO purposes! 

[Kafka Connect](https://docs.confluent.io/platform/current/connect/index.html "Confluent's Homepage")
is a tool for streaming data between Apache Kafka® and other data systems. There are more 
professional charts with good support, this chart is designed for simple use cases
for PoC or demo data flows.

More information is available on [Github](https://github.com/lsmhun/kafka-connect-wrapper)

## TL;DR

```console
$ helm repo add lsmhun https://lsmhun.github.io/lsmhun-helm-charts/
$ helm install my-release \
  --set connectConfig.worker.bootstrap=MY_KAFKA_BOOTSTRAP,connectConfig.logLevel=DEBUG \
    lsmhun/kafka-connect-wrapper
```
**Tip**: Do not use it alone, rather with parent helm 

## Parameters

The following tables lists the configurable parameters of the chart and their default values.
These are just some values for base demos, but with ConfigMap overwrite any properties can be
available.

| Parameter                                               | Description                         | Default                                                 |
|---------------------------------------------------------|-------------------------------------|---------------------------------------------------------|
| `connectConfig.topics`                                  | Topic list (comma separated values) | `demo`                                                  |
| `connectConfig.logLevel`                                | Log level                           | `INFO`                                                  |
| `connectConfig.worker.bootstrap`                        | Kafka Bootstrap address             | `nil`                                                   |
| `connectConfig.worker.keyConverter`                     | Key converter                       | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.worker.keyConverterSchemasEnable`        | Key schema enabled (not used)       | `false`                                                 |
| `connectConfig.worker.keyConverterSchemasRegistryUrl`   | Key schema registry url (not used)  | `nil`                                                   |
| `connectConfig.worker.valueConverter`                   | Value converter                     | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.worker.valueConverterSchemasEnable`      | Value schema enabled                | `false`                                                 |
| `connectConfig.worker.valueConverterSchemasRegistryUrl` | Value schema registry url           | `nil`                                                   |
| `connectConfig.worker.errorTolerance`                   | Tolerance level                     | `all`                                                   |
| `connectConfig.source.enabled`                          | Enable source.properties            | `false`                                                 |
| `connectConfig.source.errorTolerance`                   | Tolerance level                     | `all`                                                   |
| `connectConfig.source.keyConverter`                     | Key converter                       | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.source.keyConverterSchemasEnable`        | Key schema enabled (not used)       | `false`                                                 |
| `connectConfig.source.keyConverterSchemasRegistryUrl`   | Key schema registry url (not used)  | `nil`                                                   |
| `connectConfig.source.valueConverter`                   | Value converter                     | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.source.valueConverterSchemasEnable`      | Value schema enabled                | `false`                                                 |
| `connectConfig.source.valueConverterSchemasRegistryUrl` | Value schema registry url           | `nil`                                                   |
| `connectConfig.source.file`                             | Input file in case of File source   | `/opt/out/kafka.in`                                     |
| `connectConfig.source.connectionUrl`                    | jdbc connection url                 | `nil`                                                   |
| `connectConfig.source.connectionUser`                   | database user name                  | `nil`                                                   |
| `connectConfig.source.connectionPassword`               | database user password              | `nil`                                                   |
| `connectConfig.sink.enabled`                            | Enable sink.properties              | `true`                                                  |
| `connectConfig.sink.errorTolerance`                     | Tolerance level                     | `all`                                                   |
| `connectConfig.sink.connectorClass`                     | Connector class                     | `org.apache.kafka.connect.file.FileStreamSinkConnector` |
| `connectConfig.sink.connectionUrl`                      | jdbc connection url                 | `nil`                                                   |
| `connectConfig.sink.connectionUser`                     | database user name                  | `nil`                                                   |
| `connectConfig.sink.connectionPassword`                 | database user password              | `nil`                                                   |
| `connectConfig.sink.keyConverter`                       | Key converter                       | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.sink.keyConverterSchemasEnable`          | Key schema enabled (not used)       | `false`                                                 |
| `connectConfig.sink.keyConverterSchemasRegistryUrl`     | Key schema registry url (not used)  | `nil`                                                   |
| `connectConfig.sink.valueConverter`                     | Value converter                     | `org.apache.kafka.connect.storage.StringConverter`      |
| `connectConfig.sink.valueConverterSchemasEnable`        | Value schema enabled                | `false`                                                 |
| `connectConfig.sink.valueConverterSchemasRegistryUrl`   | Value schema registry url           | `nil`                                                   |
| `connectConfig.sink.file`                               | Output file in case of FileSink     | `/opt/out/kafka.out`                                    |
| `connectConfig.sink.autoCreate`                         | Auto create                         | `true`                                                  |
| `connectConfig.sink.autoEvolve`                         | Auto evolve                         | `true`                                                  |
| `connectConfig.sink.tasksMax`                           | Maximum tasks                       | `1`                                                     |