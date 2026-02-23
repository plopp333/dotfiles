#!/bin/sh

echo `nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader | tr ',' '   '`
