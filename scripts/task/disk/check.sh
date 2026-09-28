#!/bin/sh
df -h /
lsblk
size_kb=$(df -Pk / | awk 'NR==2 {print $2}')
[ "$size_kb" -gt 5242880 ]
