#!/bin/sh
echo "REPRO-CHECK-STDOUT $(date -u +%T)"
echo "REPRO-CHECK-STDERR $(date -u +%T)" >&2
echo "REPRO-CHECK-FILE $(date -u +%T)" >> /tmp/check_debug.log
test -f /tmp/logs_solved
