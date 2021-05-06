[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Flsmhun%2Fkafka-connect-wrapper.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Flsmhun%2Fkafka-connect-wrapper?ref=badge_shield)

Kafka connect wrapper
=====================

This is just a small, easy-to-use wrapper for 
[Kafka Connect](https://docs.confluent.io/platform/current/connect/index.html "Confluent's Homepage")
It can be practical sometimes for PoC or testing data flows.

Directory structure:
```
/opt/bin                         <-- scripts
/opt/config                      <-- default logging configuration (default is empty)
/opt/libs                        <-- all dependency jar files
/opt/connect-config/worker/      <-- Kafka connect worker properties
/opt/connect-config/source/      <-- Kafka connect source properties
/opt/connect-config/sink/        <-- Kafka connect sink properties
```

Docker container ( [Dockerfile](Dockerfile) ) will run [connect-default.sh](bin/connect-default.sh) by default. 
It will try to collect configuration from _/opt/connect-config/_ directories, then start 
a Kafka Connect standalone instance. 

Running
-------
If you prepared your configuration in folder structure above, you can run this command:

```shell
CURRENT_DIR=`pwd`
docker run -d --rm \
    --volume /$CURRENT_DIR/source:/opt/connect-config/source  \
    --volume /$CURRENT_DIR/sink:/opt/connect-config/sink  \
    --volume /$CURRENT_DIR/worker:/opt/connect-config/worker  \
    lsmaster/kafka-connect-wrapper
```

Documentation
-------------
You can find some development documentation [here](docs/dev_instructions.md).

Some additional articles, notes are available [here](docs/descr_en.md)

Example application: [frx-crypto-scrape-demo-ms](https://github.com/lsmhun/frx-crypto-scrape-demo-ms)

## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Flsmhun%2Fkafka-connect-wrapper.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Flsmhun%2Fkafka-connect-wrapper?ref=badge_large)
