#!/bin/sh
# Log to a file too, so the timing is visible even if the request dies.
echo "solve_long start $(date -u +%T)" >> /tmp/solve_long.log
sleep 45
touch /tmp/solve_long.done
echo "solve_long done $(date -u +%T)" >> /tmp/solve_long.log
