#!/bin/bash


start_time="$(date -u +%s.%N)"
# echo $start_time
# for i in {1..5}
# do
#     /root/process.sh &
#     sleep 10
# done
# 
# wait

/root/process.sh
elapsed="$(bc <<<"$end_time-$start_time")"
# echo "$elapsed"


