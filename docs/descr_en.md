Kafka connect wrapper
=====================

Kafka is an industrial standard for messaging now. It has various usages and lots of sub-projects 
(ksql, kafka streams, etc.) One of them is
[Kafka Connect](https://docs.confluent.io/platform/current/connect/index.html "Confluent's Homepage")
. 

Confluent is the most important player in this area. Fortunately they don't forget the open source
community, so you can reach CSS version, which is community supported. They would like to coordinate 
the dependencies and versions, so they started to use multi versioning the same library. For example
[Kafka](https://mvnrepository.com/artifact/org.apache.kafka/kafka) has various release numbers for 
the same code base. Welcome to the desert of the real!

Sometimes you need to build just a simple pipeline with some data source and just want to store 
data somewhere (mostly database). Then you don't need anything, just a simple tool, which is able to
read and write the data. 

This is the reason of this tool.

Running lenses.io fast-data dev
-------------------------------

There is other data flow company, https://lenses.io/ and they built an easy-to-use docker image
which contains everything, what you need. I would recommend it, but you have to pay. I used their
container to test this wrapper. This container includes Kafka connect, but I would create a simple
standalone solution.

https://github.com/lensesio/fast-data-dev

You need to get YOUR_IP_ADDRESS.

```shell
docker run --rm -p 2181:2181 -p 3030:3030 -p 8081-8083:8081-8083 \
       -p 9581-9585:9581-9585 -p 9092:9092 -e ADV_HOST=YOUR_IP_ADDRESS \
       lensesio/fast-data-dev:latest
```

Kafka configuration
-------------------
Scripts are coming from the original Kafka github repo:
https://github.com/a0x8o/kafka/blob/master/bin

Only one script was added: [connect-default.sh](../bin/connect-default.sh)

Confluent links
---------------
If you starts to work with Confluent Kafka connect, I would recommend these articles. There are
lots of tricks behind the scenes, which can be important.

* https://www.confluent.io/blog/data-wrangling-apache-kafka-ksql/
* https://www.confluent.io/blog/kafka-connect-deep-dive-converters-serialization-explained
* https://docs.confluent.io/5.4.2/schema-registry/serdes-develop/index.html#serializer-and-formatter

* https://github.com/confluentinc/schema-registry/blob/master/bin/kafka-json-schema-console-producer

* https://docs.confluent.io/platform/current/schema-registry/serdes-develop/serdes-json.html

Schema registry
---------------
Kafka Connect are designed originally for [Apache Avro](http://avro.apache.org/), but it can support 
ProtoBuf and JSON as well. Message formats can be changed during the time, so this it the time when
you need schema evolution. You can use Confluent Schema registry for handling that. 

```shell
curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" \
--data '{"type":"object","properties":{"f1":{"type":"string"}}}' \
http://localhost:8081/subjects/forex-value/versions
```

Schema registry is not included in kafka-connect-wrapper, but it can be configured.

Unfortunately JSON handling is not trivial, because of schema definition is not strict. There are 
libraries, however Confluent uses an other schema description for that. As a result, if you want to 
use Confluent schema registry with JSON, then you should be prepared their 'Magic byte' or you 
have to include the schema in your message. 

IMPORTANT! This article explains what is the difference between JSON 
* https://rmoff.net/2020/07/03/why-json-isnt-the-same-as-json-schema-in-kafka-connect-converters-and-ksqldb-viewing-kafka-messages-bytes-as-hex/
* https://www.confluent.io/blog/kafka-connect-deep-dive-converters-serialization-explained/#json-topics

* https://stackoverflow.com/questions/64108336/confluent-schema-registry-post-simple-json-schema-with-object-having-single-pro
* https://docs.confluent.io/platform/current/schema-registry/develop/api.html

Other links
-----------
https://stackoverflow.com/questions/31324981/how-to-access-host-port-from-docker-container


