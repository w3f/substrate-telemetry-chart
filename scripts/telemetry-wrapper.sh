#!/bin/bash

# Start the first process
/usr/local/bin/telemetry_core --listen 0.0.0.0:8000 2>&1 &
P1=$!

sleep 10;

# Start the second process
/usr/local/bin/telemetry_shard --core 127.0.0.1:8000 2>&1 &
P2=$!
  
# Wait for any process to exit
wait $P1 $P2
  
# Exit with status of process that exited first
exit $?
