#!/bin/bash

docker exec -it cassandra01 bash -c "nodetool status | grep UN"
un_cnt=$(docker exec -it cassandra01 bash -c "nodetool status | grep UN | wc -l")

while sleep 3; do
  un_cnt=$(docker exec -it cassandra01 bash -c "nodetool status | grep UN | wc -l")
  if [[ $un_cnt == *"3"* ]]; then
    echo "Completed setup Cassandra cluster"
    exit 0
  else
    echo "Wait for cluster setup"
  fi
done
