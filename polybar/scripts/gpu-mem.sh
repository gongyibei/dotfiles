#!/bin/sh
para=${1},${1}p
nvidia-smi --query-gpu=utilization.memory --format=csv,noheader,nounits|sed -n "${para}"
