#!/usr/bin/env bash

ARGS=("$@" --listen 0.0.0.0 --port 3001)

export PYTHONUNBUFFERED=1
echo "Starting ComfyUI"
cd /root/autodl-tmp/ComfyUI
source venv/bin/activate
TCMALLOC="$(ldconfig -p | grep -Po "libtcmalloc.so.\d" | head -n 1)"
export LD_PRELOAD="${TCMALLOC}"
python3 main.py "${ARGS[@]}" > /root/autodl-tmp/logs/comfyui.log 2>&1 &
echo "ComfyUI started"
echo "Log file: /root/autodl-tmp/logs/comfyui.log"
deactivate
