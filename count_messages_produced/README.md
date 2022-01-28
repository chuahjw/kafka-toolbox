# Count number of messages produced into a Kafka topic between 2 timestamps

## Usage
Run:
```
./count_messages_produced.sh <broker:port> <properties_file> <topic> <start_time> <end_time>
```

Example output:
```
./count_messages.sh kafka-1.confluent.test:9092 client-ssl.properties my-topic-p3 1643341867638 1643341868562
Counting number of messages from 1643341867638 to 1643341868562
Total message offset at start: 	 10
Total message offset at end: 	 13
Number of messages produced: 	 3
```