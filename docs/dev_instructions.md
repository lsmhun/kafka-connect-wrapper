Developer notes
===============

Running lenses.io fast-data dev
-------------------------------
This container was tested with running lenses.io fast data dev environment and
Git Bash environment on Windows 10 with WSL2.

https://github.com/lensesio/fast-data-dev

You need to get YOUR_IP_ADDRESS. 

```shell
docker run --rm -p 2181:2181 -p 3030:3030 -p 8081-8083:8081-8083 \
       -p 9581-9585:9581-9585 -p 9092:9092 -e ADV_HOST=YOUR_IP_ADDRESS \
       lensesio/fast-data-dev:latest
```

Then you can reach (http://localhost:3030) for monitoring interface. Fast data dev
container includes Kafka Connect, but this image is designed for standalone
working.

Build and run
-------------

First you need to run _gradlew build_ , because it will collect all dependencies. Then
you can use some shell scripts, which are available in _/bin_ directory. These are 
bash commands, original sources are available [here](https://github.com/a0x8o/kafka/tree/master/bin)

If you would like to rebuild the Docker image based on [Dockerfile](../Dockerfile)
```shell
./gradlew docker
```

Or you can get the docker image from [Docker Hub](https://hub.docker.com/repository/docker/lsmaster/kafka-connect-wrapper)

**Alternative solution:** you can run _gradlew shadowJar_ command. It will build a fat jar
(some guys called it über-jar). After that you can use classpath parameter to test it.
```shell
java -cp build/libs/kafka-connect-wrapper-6.1.0-0.1-all.jar org.apache.kafka.connect.cli.ConnectStandalone worker.properties sink.properties 
```

Debug and test
--------------
You can find two basic tests. [Test case 1](../tests/test-case-01) is just a simple
startup. Actually it will just start a simple standalone connect flow. [Test case 2](../tests/test-case-02)
will run docker container, but the same flow. It expects that _gradlew docker_ command
was executed. 


Useful commands:
```shell
winpty docker run --rm -it lsmaster/kafka-connect-wrapper bash
```

Versioning
----------
Kafka connect wrapper uses Confluent version and private subversion. 

**Name**: kafka-connect-wrapper-${confluent_version}-${our-semver-version}