#!/bin/sh

osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@tesla watch -n 600 /hdd/chia/chia-blockchain/venv/bin/chia farm summary"'