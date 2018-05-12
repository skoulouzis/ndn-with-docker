#!/bin/bash

sudo docker stack rm ndn

sudo docker stack deploy -c docker-compose-file_chunk.yml ndn


start_time="$(date -u +%s.%N)"
 
for i in {2..5}
do
    sleep 15
    sudo docker service scale ndn_consumer_1=$i
done

# sudo docker stack rm ndn


elapsed="$(bc <<<"$end_time-$start_time")"
# echo "$elapsed"


