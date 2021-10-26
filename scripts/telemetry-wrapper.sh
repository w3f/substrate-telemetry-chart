#!/bin/bash

# Start the first process
/usr/local/bin/telemetry_core 2>&1 &
  
# Start the second process
/usr/local/bin/telemetry_shard 2>&1 &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
