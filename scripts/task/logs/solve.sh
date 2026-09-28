#!/bin/sh
echo "REPRO-SOLVE-STDOUT $(date -u +%T)"
echo "REPRO-SOLVE-STDERR $(date -u +%T)" >&2
touch /tmp/logs_solved
