#!/usr/bin/env bash

bootstrap_server="$1"
shift 1
properties_file="$1"
shift 1
topic="$1"
shift 1
start_time="$1"
shift 1
end_time="$1"

if [ -z "$broker" ] | [ -z "$properties_file" ] | [ -z "$topic" ] | [ -z "$start_time" ] | [ -z "$end_time" ]; then
       echo "Usage $0 <broker:port> <properties_file> <topic> <start_time> <end_time>"
       echo ""
       exit 1
fi

start_offsets=$(kafka-run-class kafka.tools.GetOffsetShell  --bootstrap-server $bootstrap_server --command-config $properties_file --topic $topic -time $start_time | awk -F ":" '{SUM += $3} END {print SUM}')
end_offsets=$(kafka-run-class kafka.tools.GetOffsetShell  --bootstrap-server $bootstrap_server --command-config $properties_file --topic $topic -time $end_time | awk -F ":" '{SUM += $3} END {print SUM}')
num_messages=$((end_offsets-start_offsets))

echo -e "Counting number of messages from $start_time to $end_time"
echo -e "Total message offset at start: \t $start_offsets"
echo -e "Total message offset at end: \t $end_offsets"
echo -e "Number of messages produced: \t $num_messages"
echo ""
exit 1