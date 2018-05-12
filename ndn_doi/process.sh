#!/bin/bash


start_time="$(date -u +%s.%N)"
/root/getDataset.sh

sleep 4
# /root/csv2json.sh /root/out > out.json

end_time="$(date -u +%s.%N)"

elapsed="$(bc <<<"$end_time-$start_time")"
echo "$start_time, $elapsed"


                


