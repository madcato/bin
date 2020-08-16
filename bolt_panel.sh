#!/bin/sh

osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt.local watch sensors"'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt.local watch nvidia-smi"'
osascript -e 'tell application "Terminal" to do script "ssh -t danielvela@bolt.local htop"'

