#!/bin/sh

osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@tesla watch sensors"'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@tesla watch nvidia-smi"'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@tesla htop"'

