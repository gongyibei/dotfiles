#!/bin/sh
para=${1},${1}p
gpu=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits|sed -n "${para}")
mem=$(nvidia-smi --query-gpu=utilization.memory --format=csv,noheader,nounits|sed -n "${para}")
echo ${gpu}% ${mem}%
