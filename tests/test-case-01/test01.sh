#!/bin/bash

echo "This test will run just a simple Kafka connect flow. Exit: Ctrl+C  "
CURRENT_DIR=`pwd`
cd ../../bin
./connect-standalone.sh $CURRENT_DIR/worker-kafka.properties $CURRENT_DIR/sink-sqlite.properties