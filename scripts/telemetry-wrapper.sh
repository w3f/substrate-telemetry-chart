#!/bin/bash

# Start the first process
/usr/local/bin/telemetry_core &
  
# Start the second process
/usr/local/bin/telemetry_shard &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
