#!/bin/bash

CURRENT_DIR=`pwd`
docker run -d --rm -l test=test02 \
    --volume /$CURRENT_DIR/source:/opt/connect-config/source  \
    --volume /$CURRENT_DIR/sink:/opt/connect-config/sink  \
    --volume /$CURRENT_DIR/worker:/opt/connect-config/worker  \
    --volume /$CURRENT_DIR/out:/opt/out  \
    docker.io/library/kafka-connect-wrapper:6.1.0-0.1-SNAPSHOT
echo "Waiting 10 seconds to start"
sleep 10
cd ../../bin
echo "Sending test message"
echo '{"schema":{"type":"struct","fields":[{"field":"timestamp","optional":false,"type":"int64"},{"field":"curr","optional":false,"type":"string"},{"field":"xcurr","optional":false,"type":"string"},{"field":"price","optional":false,"type":"double"}],"optional":false,"name":"forex"},"payload":{"timestamp":134,"curr":"ETH","xcurr":"USD","price":1.23}}' | ./kafka-console-producer.sh --broker-list localhost:9092 --topic forex
sleep 5
CURRENT_DOCKER_CONTAINER=`docker ps -aqf 'label=test=test02'`
echo " Checking /opt/out directory"
RESULT=`docker exec $CURRENT_DOCKER_CONTAINER sh -c "ls /opt/out"`
if [ "x$RESULT" = "x" ]; then
  echo "Test failed"
else
  echo "Test successful"
fi
docker kill $CURRENT_DOCKER_CONTAINER
