#!/bin/bash

container_ids=$(docker ps -a | grep redis | grep Up | sort -k 10,10 | awk '{print $1}')
index=1
container_ip=""
clusters=""

for id in `echo $container_ids`; do
  container_ip=$(docker exec -it "$id" bash -c 'hostname -i' | sed 's/ //g' | tr -d "\r")
  port="700${index}"
  clusters+="${container_ip}:${port} "
  index=$((index+1))
done

echo $clusters
docker exec -it redis01 bash -c "redis-cli --cluster create $clusters --cluster-replicas 0"
