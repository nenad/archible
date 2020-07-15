#!/bin/bash

sensors -u | grep Core -A 1 | grep temp | cut -d ":" -f 2 | awk 'BEGIN { sum=0; n=0; } { sum+=$1; n++; } END { print sum/n }' | xargs printf '%.1f&#xb0;C &#xf2c9;'
