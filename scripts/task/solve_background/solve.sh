#!/bin/sh
# Start the long job detached and return immediately (well under 30s).
nohup sh -c 'echo "bg start $(date -u +%T)"; sleep 90; touch /tmp/solve_bg.done; echo "bg done $(date -u +%T)"' \
  > /tmp/solve_bg.log 2>&1 < /dev/null &
echo "background job started, pid $!"
exit 0
